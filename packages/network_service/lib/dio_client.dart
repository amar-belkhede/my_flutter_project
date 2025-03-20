import 'package:dio/dio.dart';
import 'package:network_service/interception/api_key_interceptor.dart';
import 'package:network_service/interception/error_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));

    _dio
      ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: true,
        filter: (options, args) {
          // don't print requests with uris containing '/posts'
          if (options.path.contains('/posts')) {
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        },
      ))
      ..interceptors.add(ApiKeyInterceptor())
      ..interceptors.add(ErrorInterceptor());
    // ..interceptors.add(LogInterceptor(
    //   requestBody: true,
    //   responseBody: true,
    //   requestHeader: true,
    //   responseHeader: true,
    // ));
  }

  Dio get dio => _dio;

  void dispose() {
    _dio.close();
  }
}
