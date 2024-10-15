import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:task_management/config/boilerplate/base_classes_boilerplate.dart';
import 'package:task_management/config/boilerplate/resource_boilerplate.dart';
import 'package:task_management/config/boilerplate/widget_boilerplate.dart';
import 'package:task_management/core/enumeration/enumerations.dart';
import 'package:task_management/feature/home/domain/controller/home_controller.dart';
import 'package:task_management/feature/home/presentation/widget/filter_item.dart';
import 'package:task_management/feature/home/presentation/widget/todo_item.dart';

class HomeView extends BaseView<HomeController> {
  HomeView({super.key});

  @override
  Widget body(BuildContext context) => Scaffold(
        appBar: buildAppBar(),
        body: buildBody(),
        floatingActionButton: buildFloatingActionButton(),
      );

  PreferredSizeWidget? buildAppBar() => AppBar(
        title: Text('Task Management', style: TextStyleConfig.appBarTitleStyle),
        elevation: 1,
      );

  Widget buildBody() => controller.isLoading()
      ? loading()
      : controller.isExceptionError()
          ? controller.buildExceptionError()
          : controller.isConnectionError()
              ? controller.buildConnectionError()
              : buildContent();

  Widget buildContent() => NotificationListener<ScrollNotification>(
        onNotification: controller.handlePagination,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          controller: controller.scrollController,
          child: Column(
            children: [
              buildFilter(),
              buildList(),
              buildPaginationLoading(),
            ],
          ),
        ),
      );

  Widget buildFilter() => Padding(
        padding: SpacingConfig.s16l16t16r08b,
        child: Row(
          children: [
            FilterItem(
              title: 'All',
              selected: controller.getFilterType() == EFilterType.all,
              onTap: () => controller.filterAction(type: EFilterType.all),
            ),
            Gap(SizeConfig.s08.r),
            FilterItem(
              title: 'Completed',
              selected: controller.getFilterType() == EFilterType.completed,
              onTap: () => controller.filterAction(type: EFilterType.completed),
            ),
            Gap(SizeConfig.s08.r),
            FilterItem(
              title: 'Incomplete',
              selected: controller.getFilterType() == EFilterType.incomplete,
              onTap: () =>
                  controller.filterAction(type: EFilterType.incomplete),
            ),
          ],
        ),
      );

  Widget buildList() => ListView.builder(
        itemCount: controller.getFilterType() == EFilterType.all
            ? controller.todoListModel.todos.length
            : controller.filteredTodoListModel.todos.length,
        padding: SpacingConfig.s04All,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => TodoItem(
            model: controller.getFilterType() == EFilterType.all
                ? controller.todoListModel.todos[index]
                : controller.filteredTodoListModel.todos[index],
            onTap: () => controller.todoOptionsModal(index),
          ),
      );

  Widget buildPaginationLoading() => Visibility(
        visible: controller.isLoadingPagination(),
        child: Padding(
          padding: SpacingConfig.s12t24b,
          child: const PaginateLoadingWidget(),
        ),
      );

  Widget? buildFloatingActionButton() => controller.isLoading()
      ? null
      : FloatingActionButton.extended(
          onPressed: controller.createTodoModal,
          label: Text('Create task', style: TextStyleConfig.createTodoStyle),
          icon:
              const Icon(CupertinoIcons.plus_circle, color: ColorConfig.light),
          backgroundColor: ColorConfig.accent,
        );
}
