import 'package:dio/dio.dart';
import 'package:task_management/config/boilerplate/network_boilerplate.dart';

class DioConfig {
  late Dio dio;
  late Map<String, String> headerWithToken;

  DioConfig(this.dio) {
    dio = Dio();
    dio.interceptors.add(DioInterceptor(dio));
  }

  Future<Response> get(
          {required String path, final dynamic queryParameters}) async =>
      await dio.get(path, queryParameters: queryParameters);

  Future<Response> post(
          {required String path,
          final Object? data,
          final dynamic queryParameters}) async =>
      await dio.post(path, queryParameters: queryParameters, data: data);

  Future<Response> put(
          {required String path,
          final dynamic data,
          final dynamic queryParameters}) async =>
      await dio.put(path, queryParameters: queryParameters, data: data);

  Future<Response> delete(
          {required String path, final dynamic queryParameters}) async =>
      await dio.delete(path, queryParameters: queryParameters);
}
