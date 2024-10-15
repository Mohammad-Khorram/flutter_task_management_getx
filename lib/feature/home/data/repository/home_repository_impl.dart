import 'package:dartz/dartz.dart';
import 'package:task_management/config/boilerplate/model_boilerplate.dart';
import 'package:task_management/config/boilerplate/network_boilerplate.dart';
import 'package:task_management/feature/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:task_management/feature/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl(this.homeRemoteDataSource);

  @override
  Future<Either<NetworkException, TodoListModel>> getTodo(
          {required GetTodoRequestModel getTodoRequestModel}) async =>
      homeRemoteDataSource.getTodo(getTodoRequestModel: getTodoRequestModel);

  @override
  Future<Either<NetworkException, TodoResponseModel>> createTodo(
          {required CreateTodoRequestModel createTodoRequestModel}) async =>
      homeRemoteDataSource.createTodo(
          createTodoRequestModel: createTodoRequestModel);

  @override
  Future<Either<NetworkException, TodoResponseModel>> updateTodo(
          {required UpdateTodoRequestModel updateTodoRequestModel}) async =>
      homeRemoteDataSource.updateTodo(
          updateTodoRequestModel: updateTodoRequestModel);

  @override
  Future<Either<NetworkException, TodoResponseModel>> deleteTodo(
          {required DeleteTodoRequestModel deleteTodoRequestModel}) async =>
      homeRemoteDataSource.deleteTodo(
          deleteTodoRequestModel: deleteTodoRequestModel);
}
