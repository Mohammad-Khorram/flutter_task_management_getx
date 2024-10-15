import 'package:dartz/dartz.dart';
import 'package:task_management/config/boilerplate/model_boilerplate.dart';
import 'package:task_management/config/boilerplate/network_boilerplate.dart';

abstract class HomeRepository {
  Future<Either<NetworkException, TodoListModel>> getTodo(
      {required GetTodoRequestModel getTodoRequestModel});

  Future<Either<NetworkException, TodoResponseModel>> createTodo(
      {required CreateTodoRequestModel createTodoRequestModel});

  Future<Either<NetworkException, TodoResponseModel>> updateTodo(
      {required UpdateTodoRequestModel updateTodoRequestModel});

  Future<Either<NetworkException, TodoResponseModel>> deleteTodo(
      {required DeleteTodoRequestModel deleteTodoRequestModel});
}
