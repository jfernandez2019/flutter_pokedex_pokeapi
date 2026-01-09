import 'package:dio/dio.dart';
import '../constants/endpoints.dart';

Dio createDio() {
  final dio = Dio(
    BaseOptions(
      baseUrl: Endpoints.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  // Para debug: ver requests/responses en consola (modo dev)
  //dio.interceptors.add(
  //  LogInterceptor(request: true, requestBody: false, responseBody: false),
  //);

  return dio;
}
