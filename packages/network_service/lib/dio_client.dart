import 'package:dio/dio.dart';
import 'package:network_service/interception/api_key_interceptor.dart';

class DioClient {
  static DioClient? _dioClient;
  static late Dio _dio;

  factory DioClient() {
    _dioClient ??= DioClient._internal();
    return _dioClient!;
  }

  DioClient._internal() {
    const String baseUrl = "https://api.themoviedb.org/3";
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      // connectTimeout: const Duration(milliseconds: 500),
      // receiveTimeout: const Duration(milliseconds: 500),
    ));

    _dio.interceptors.add(ApiKeyInterceptor());
  }

  Dio get dio => _dio;

  void dispose() {
    _dio.close();
  }
}
