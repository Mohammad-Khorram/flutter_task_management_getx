import 'package:get/get.dart';
import 'package:task_management/config/boilerplate/util_boilerplate.dart';

class ServerPathConfig {
  final String mainUrl;

  // controllers
  final String todos;

  // todos
  late final String getTodo;
  late final String createTodo;
  late final String updateTodo;
  late final String deleteTodo;

  ServerPathConfig()
      : mainUrl = Get.find<EnvironmentCore>().getValue(key: 'MAIN_URL'),
        todos = Get.find<EnvironmentCore>().getValue(key: 'TODO') {
    // todos
    getTodo = '$mainUrl$todos';
    createTodo = '$mainUrl$todos/add';
    updateTodo = '$mainUrl$todos';
    deleteTodo = '$mainUrl$todos';
  }
}
