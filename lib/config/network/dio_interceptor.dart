import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio_lib;
import 'package:get/get.dart';
import 'package:task_management/config/boilerplate/util_boilerplate.dart';
import 'package:task_management/config/network/network_exception.dart';

class DioInterceptor extends dio_lib.Interceptor {
  dio_lib.Dio dio;

  DioInterceptor(this.dio);

  @override
  void onRequest(dio_lib.RequestOptions options,
      dio_lib.RequestInterceptorHandler handler) {
    options.headers.addAll(
        {'Content-Type': 'application/json', 'Connection': 'keep-alive'});
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
      dio_lib.Response response, dio_lib.ResponseInterceptorHandler handler) {
    Get.find<LogCore>().info(response.data);
    super.onResponse(response, handler);
  }

  @override
  void onError(
      dio_lib.DioException err, dio_lib.ErrorInterceptorHandler handler) async {
    handler.next(dio_lib.DioException(
        requestOptions: err.requestOptions,
        error: Left(NetworkException.handleResponse(err.response!)),
        response: err.response,
        type: err.type));
    super.onError(err, handler);
  }
}
