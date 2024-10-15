import 'package:task_management/config/boilerplate/model_boilerplate.dart';
import 'package:task_management/config/boilerplate/network_boilerplate.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class HomeRemoteDataSource {
  Future<Either<NetworkException, TodoListModel>> getTodo(
      {required GetTodoRequestModel getTodoRequestModel});

  Future<Either<NetworkException, TodoResponseModel>> createTodo(
      {required CreateTodoRequestModel createTodoRequestModel});

  Future<Either<NetworkException, TodoResponseModel>> updateTodo(
      {required UpdateTodoRequestModel updateTodoRequestModel});

  Future<Either<NetworkException, TodoResponseModel>> deleteTodo(
      {required DeleteTodoRequestModel deleteTodoRequestModel});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final DioConfig dio;
  final ServerPathConfig serverPath;

  HomeRemoteDataSourceImpl(this.dio, this.serverPath);

  @override
  Future<Either<NetworkException, TodoListModel>> getTodo(
      {required GetTodoRequestModel getTodoRequestModel}) async {
    try {
      final Response<dynamic> response = await dio.get(
          path: serverPath.getTodo,
          queryParameters: getTodoRequestModel.toJson());
      return Right(TodoListModel.fromJson(response.data));
    } on DioException catch (ex) {
      return Left(NetworkException.handleResponse(ex.response!));
    } catch (ex) {
      return Left(NetworkException.parsingDataException());
    }
  }

  @override
  Future<Either<NetworkException, TodoResponseModel>> createTodo(
      {required CreateTodoRequestModel createTodoRequestModel}) async {
    try {
      final Response<dynamic> response = await dio.post(
          path: serverPath.createTodo, data: createTodoRequestModel.toJson());
      return Right(TodoResponseModel.fromJson(response.data));
    } on DioException catch (ex) {
      return Left(NetworkException.handleResponse(ex.response!));
    } catch (ex) {
      return Left(NetworkException.parsingDataException());
    }
  }

  @override
  Future<Either<NetworkException, TodoResponseModel>> updateTodo(
      {required UpdateTodoRequestModel updateTodoRequestModel}) async {
    try {
      final Response<dynamic> response = await dio.put(
          path: '${serverPath.updateTodo}/${updateTodoRequestModel.id}',
          data: updateTodoRequestModel.toJson());
      return Right(TodoResponseModel.fromJson(response.data));
    } on DioException catch (ex) {
      return Left(NetworkException.handleResponse(ex.response!));
    } catch (ex) {
      return Left(NetworkException.parsingDataException());
    }
  }

  @override
  Future<Either<NetworkException, TodoResponseModel>> deleteTodo(
      {required DeleteTodoRequestModel deleteTodoRequestModel}) async {
    try {
      final Response<dynamic> response = await dio.delete(
          path: '${serverPath.deleteTodo}/${deleteTodoRequestModel.id}');
      return Right(TodoResponseModel.fromJson(response.data));
    } on DioException catch (ex) {
      return Left(NetworkException.handleResponse(ex.response!));
    } catch (ex) {
      return Left(NetworkException.parsingDataException());
    }
  }
}
