import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:task_management/config/boilerplate/base_classes_boilerplate.dart';
import 'package:task_management/config/boilerplate/model_boilerplate.dart';
import 'package:task_management/config/boilerplate/network_boilerplate.dart';
import 'package:task_management/config/boilerplate/resource_boilerplate.dart';
import 'package:task_management/config/boilerplate/util_boilerplate.dart';
import 'package:task_management/config/boilerplate/widget_boilerplate.dart';
import 'package:task_management/core/constant/constants.dart';
import 'package:task_management/core/enumeration/enumerations.dart';
import 'package:task_management/feature/home/domain/repository/home_repository.dart';

class HomeController extends BaseController {
  // values
  static const String route = '/';
  String? errorMessage;

  // data_models
  TodoListModel todoListModel = const TodoListModel(todos: []);
  TodoListModel filteredTodoListModel = const TodoListModel(todos: []);

  // filter
  Rx<EFilterType> filterType = EFilterType.all.obs;

  // pagination
  ScrollController scrollController = ScrollController();
  int skip = 0;
  int limit = 32;
  int total = 0;
  RxBool hasNextPage = true.obs;
  RxBool loadingPagination = false.obs;

  // create_task
  TextEditingController titleController = TextEditingController();
  TextEditingController userIdController = TextEditingController();

  // bool_values
  RxBool loading = true.obs;
  RxBool errConnection = false.obs;
  RxBool errException = false.obs;

  HomeController(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  void onInit() async {
    getTodo();
    super.onInit();
  }

  // pagination is only effected when Filter=all
  bool handlePagination(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
        !isLoading() &&
        !isLoadingPagination() &&
        isHaveNextPage() &&
        getFilterType() == EFilterType.all) {
      setLoadingPagination(true);
      getTodo(type: EPaginationType.pagination);
      return true;
    }
    return false;
  }

  // completed, incomplete = filteredTodoListModel
  // all = todoListModel
  void filterAction({required EFilterType type}) async {
    setLoading(true);
    setFilterType(type);
    List<TodoResponseModel> filteredTodos;

    filteredTodos = todoListModel.todos
        .where((todo) =>
            todo.isCompleted == (type == EFilterType.completed ? true : false))
        .toList();

    filteredTodoListModel = TodoListModel(
      todos: filteredTodos,
      total: filteredTodos.length,
      skip: todoListModel.skip,
      limit: todoListModel.limit,
    );

    setLoading(false);
  }

  Future<void> getTodo({EPaginationType? type = EPaginationType.first}) async {
    try {
      if (!await connectionChecker()) {
        setConnectionError(true);
        return;
      }

      if (type == EPaginationType.first) {
        setLoading(true);
        setConnectionError(false);
        setExceptionError(false);
      }

      final GetTodoRequestModel getTodoRequestModel =
          GetTodoRequestModel(limit: limit, skip: skip);
      final Either<NetworkException, TodoListModel> response =
          await homeRepository.getTodo(
              getTodoRequestModel: getTodoRequestModel);

      response.fold(
        (failure) {
          /// handle exception for show to the end user
          errorMessage = failure.message;
          setExceptionError(true);
          setHaveNextPage(false);
        },
        (result) {
          type == EPaginationType.first
              ? todoListModel = result
              : todoListModel.todos.addAll(result.todos);
          total = result.total!;
          // determine has page
          if (total <= skip + limit) setHaveNextPage(false);
          // determine next page
          skip += limit;
        },
      );
    } on NetworkException catch (ex) {
      /// handle exception for show to the end user
      errorMessage = ex.message;
      setExceptionError(true);
      setHaveNextPage(false);
    } finally {
      type == EPaginationType.first
          ? setLoading(false)
          : setLoadingPagination(false);
    }
  }

  void createTodoModal() {
    Get.find<ModalBottomSheet>().bottomSheet(
      title: 'Create new task',
      description: 'Please fill the following form',
      content: Padding(
        padding: SpacingConfig.s16All,
        child: Column(
          children: [
            TextFormFieldWidget(
              controller: titleController,
              labelText: 'Title',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              autofocus: true,
            ),
            Gap(SizeConfig.s12.r),
            TextFormFieldWidget(
              controller: userIdController,
              labelText: 'User identity',
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
            ),
            Gap(SizeConfig.s12.r),
            SizedBox(
              width: double.infinity,
              height: SizeConfig.s48.r,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConfig.accent,
                  shape: RoundedRectangleBorder(
                      borderRadius: Get.find<Constants>().radius()),
                ),
                onPressed: createTask,
                child: const Text(
                  'Create task',
                  style: TextStyleConfig.elevatedActionTitle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void createTask() async {
    Get.back();
    final String title = titleController.text;
    final String userId = userIdController.text;
    titleController.text = '';
    userIdController.text = '';

    if (title.isEmpty || userId.isEmpty) {
      snackBar(message: 'Title and User identity should be specified!');
      return;
    }

    try {
      if (!await connectionChecker()) {
        snackBar(
            message: 'Please check your internet connection and try again.',
            type: ESnackBarIconType.connection);
        return;
      }

      setLoading(true);
      final CreateTodoRequestModel createTodoRequestModel =
          CreateTodoRequestModel(
              title: title, userId: int.parse(userId), isCompleted: false);
      final Either<NetworkException, TodoResponseModel> response =
          await homeRepository.createTodo(
              createTodoRequestModel: createTodoRequestModel);

      response.fold(
        (failure) {
          /// handle exception for show to the end user
          errorMessage = failure.message;
          snackBar(message: errorMessage!);
        },
        (result) {
          // add the new task to the list by locally
          todoListModel.todos.add(result);
          updatePageState(ResultState.data(data: result));
          snackBar(
              message: 'Your new task has been successfully created.',
              type: ESnackBarIconType.info);
        },
      );
    } on NetworkException catch (ex) {
      /// handle exception for show to the end user
      errorMessage = ex.message;
      snackBar(message: errorMessage!);
    } finally {
      setLoading(false);
    }
  }

  void todoOptionsModal(int index) {
    final TodoResponseModel model = todoListModel.todos[index];
    Get.find<ModalBottomSheet>().bottomSheet(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetItem(
            content: BottomSheetItemContent(
              title: model.isCompleted ? 'Undo to Incomplete' : 'Complete task',
              style: TextStyleConfig.bottomSheetContentStyle,
            ),
            onTap: () => updateTodo(index),
            icon: model.isCompleted
                ? CupertinoIcons.restart
                : CupertinoIcons.check_mark_circled,
          ),
          BottomSheetItem(
            content: BottomSheetItemContent(
              title: 'Delete',
              style: TextStyleConfig.bottomSheetContentStyle
                  .copyWith(color: ColorConfig.error),
            ),
            onTap: () => deleteTodo(index),
            icon: CupertinoIcons.trash,
            iconColor: ColorConfig.error,
          ),
        ],
      ),
    );
  }

  Future<void> updateTodo(int index) async {
    final TodoResponseModel model = todoListModel.todos[index];
    // close modal
    Get.back();

    try {
      if (!await connectionChecker()) {
        snackBar(
            message: 'Please check your internet connection and try again.',
            type: ESnackBarIconType.connection);
        return;
      }

      setLoading(true);
      final UpdateTodoRequestModel updateTodoRequestModel =
          UpdateTodoRequestModel(id: model.id, isCompleted: !model.isCompleted);
      final Either<NetworkException, TodoResponseModel> response =
          await homeRepository.updateTodo(
              updateTodoRequestModel: updateTodoRequestModel);

      response.fold(
        (failure) {
          /// handle exception for show to the end user
          errorMessage = failure.message;
          snackBar(message: errorMessage!);
        },
        (result) {
          // find old task
          final TodoResponseModel? oldTodo = todoListModel.todos
              .firstWhereOrNull((todo) => todo.id == model.id);
          if (oldTodo == null) {
            snackBar(message: 'An error occurred. Please try again later.');
            return;
          }

          // update the specified task at the list by locally
          final TodoResponseModel updatedTodo =
              oldTodo.copyWith(isCompleted: result.isCompleted);
          final todoIndex =
              todoListModel.todos.indexWhere((todo) => todo.id == model.id);
          if (todoIndex == -1) {
            snackBar(message: 'An error occurred. Please try again later.');
            return;
          }

          // replace updated task with the old task
          todoListModel.todos[todoIndex] = updatedTodo;
          // update UI
          updatePageState(ResultState.data(data: result.isCompleted));
          snackBar(
              message: 'Your specified task has been successfully completed.',
              type: ESnackBarIconType.info);
        },
      );
    } on NetworkException catch (ex) {
      /// handle exception for show to the end user
      errorMessage = ex.message;
      snackBar(message: errorMessage!);
    } finally {
      setLoading(false);
    }
  }

  Future<void> deleteTodo(int index) async {
    final TodoResponseModel model = todoListModel.todos[index];
    Get.back();

    try {
      if (!await connectionChecker()) {
        snackBar(
            message: 'Please check your internet connection and try again.',
            type: ESnackBarIconType.connection);
        return;
      }

      setLoading(true);
      final DeleteTodoRequestModel deleteTodoRequestModel =
          DeleteTodoRequestModel(id: model.id);
      final Either<NetworkException, TodoResponseModel> response =
          await homeRepository.deleteTodo(
              deleteTodoRequestModel: deleteTodoRequestModel);

      response.fold(
        (failure) {
          /// handle exception for show to the end user
          errorMessage = failure.message;
          snackBar(message: errorMessage!);
        },
        (result) {
          snackBar(
              message: 'Your specified task has been successfully deleted.',
              type: ESnackBarIconType.info);
          // remove the specified task from the list by locally
          todoListModel.todos.removeWhere((todo) => todo.id == model.id);
        },
      );
    } on NetworkException catch (ex) {
      /// handle exception for show to the end user
      errorMessage = ex.message;
      snackBar(message: errorMessage!);
    } finally {
      setLoading(false);
    }
  }

  ScaffoldFeatureController snackBar(
          {required String message,
          ESnackBarIconType type = ESnackBarIconType.exception}) =>
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          margin: SpacingConfig.s16All,
          backgroundColor: ColorConfig.dark,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 5),
          shape: BorderConfig.snackBarBorderStyle,
          content: Row(
            children: [
              Icon(
                type == ESnackBarIconType.info
                    ? CupertinoIcons.check_mark_circled
                    : type == ESnackBarIconType.exception
                        ? CupertinoIcons.exclamationmark_triangle
                        : CupertinoIcons.wifi,
                size: SizeConfig.s20.r,
                color: ColorConfig.light,
              ),
              Gap(SizeConfig.s12.r),
              Expanded(
                child: Text(
                  message,
                  style: TextStyleConfig.snackBarStyle,
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildExceptionError() => Get.find<ExceptionError>()
      .buildExceptionError(message: errorMessage!, onTap: getTodo);

  Widget buildConnectionError() =>
      Get.find<ConnectionError>().buildConnectionError(onTap: getTodo);

  /// handle internet connection status
  Future<bool> connectionChecker() async =>
      await Get.find<ConnectionCore>().hasConnection();

  bool isLoading() => loading.value;

  void setLoading(bool value) => loading.value = value;

  bool isLoadingPagination() => loadingPagination.value;

  void setLoadingPagination(bool value) => loadingPagination.value = value;

  bool isHaveNextPage() => hasNextPage.value;

  void setHaveNextPage(bool value) => hasNextPage.value = value;

  EFilterType getFilterType() => filterType.value;

  void setFilterType(EFilterType value) => filterType.value = value;

  bool isConnectionError() => errConnection.value;

  void setConnectionError(bool value) => errConnection.value = value;

  bool isExceptionError() => errException.value;

  void setExceptionError(bool value) => errException.value = value;
}
