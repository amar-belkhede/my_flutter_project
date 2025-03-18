import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final errorMessage = _handleError(err);
    super.onError(
        DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          error: errorMessage,
        ),
        handler);
  }

  String _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timeout. Please check your internet connection.";
      case DioExceptionType.sendTimeout:
        return "Request timeout. Please try again.";
      case DioExceptionType.receiveTimeout:
        return "Server response timeout. Please try again.";
      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response!);
      case DioExceptionType.cancel:
        return "Request was cancelled.";
      case DioExceptionType.unknown:
        return "Unknown error occurred. Please try again.";
      default:
        return "Something went wrong. Please try again.";
    }
  }

  String _handleBadResponse(Response response) {
    switch (response.statusCode) {
      case 400:
        return "Bad request. Please try again.";
      case 401:
        return "Unauthorized access. Please log in again.";
      case 403:
        return "Forbidden. You don't have permission to access this resource.";
      case 404:
        return "Data not found.";
      case 500:
        return "Internal server error. Please try again later.";
      default:
        return "Received invalid status code: ${response.statusCode}";
    }
  }
}
