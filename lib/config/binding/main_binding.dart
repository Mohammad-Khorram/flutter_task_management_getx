import 'package:dio/dio.dart';
import 'package:task_management/config/boilerplate/binding_boilerplate.dart';
import 'package:task_management/config/boilerplate/network_boilerplate.dart';
import 'package:task_management/config/boilerplate/util_boilerplate.dart';
import 'package:task_management/config/boilerplate/widget_boilerplate.dart';
import 'package:task_management/core/constant/constants.dart';
import 'package:get/get.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    HomeBinding().dependencies();
    // OtherBinding().dependencies();

    Get.put<DioConfig>(DioConfig(Dio()));
    Get.lazyPut<ServerPathConfig>(ServerPathConfig.new, fenix: true);
    Get.lazyPut(EnvironmentCore.new, fenix: true);
    Get.lazyPut<LogCore>(LogCoreImpl.new, fenix: true);
    Get.lazyPut<Constants>(ConstantsConfig.new, fenix: true);

    // bottomSheet
    Get.lazyPut<ModalBottomSheet>(BottomSheetWidget.new, fenix: true);

    // uiErrorHandler
    Get.lazyPut(ConnectionError.new, fenix: true);
    Get.lazyPut(ExceptionError.new, fenix: true);

    // connectionChecker
    Get.lazyPut<ConnectionChecker>(ConnectivityCheckerImpl.new, fenix: true);
    Get.lazyPut<ConnectionCore>(
            () => ConnectionCore(connectionChecker: Get.find<ConnectionChecker>()),
        fenix: true);
  }
}
