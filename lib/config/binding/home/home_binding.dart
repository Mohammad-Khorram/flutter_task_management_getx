import 'package:get/get.dart';
import 'package:task_management/config/boilerplate/network_boilerplate.dart';
import 'package:task_management/feature/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:task_management/feature/home/data/repository/home_repository_impl.dart';
import 'package:task_management/feature/home/domain/controller/home_controller.dart';
import 'package:task_management/feature/home/domain/repository/home_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
        () => HomeController(Get.find<HomeRepository>()));

    Get.lazyPut<HomeRepository>(
        () => HomeRepositoryImpl(Get.find<HomeRemoteDataSource>()));

    Get.lazyPut<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl(
        Get.find<DioConfig>(), Get.find<ServerPathConfig>()));
  }
}
