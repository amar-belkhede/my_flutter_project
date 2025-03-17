import 'package:dio/dio.dart';

class ApiKeyInterceptor extends Interceptor {
  final String? apiKey;

  ApiKeyInterceptor({this.apiKey});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.queryParameters.addAll({'api_key': apiKey});
    const String authKey =
        "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiMzRmNGU4ZGZiYWQzMTRlYjY3ZDMzNDNiODliZjQ1OCIsIm5iZiI6MTYzNDgwMzExMy43MzQwMDAyLCJzdWIiOiI2MTcxMWRhOWFiZGVjMDAwNjIyYjhlYzAiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.Rgj2fOtLbC7VEhwxDVS-NrB-AVkzxiCjN_BR5_m54L4";
    options.headers["Authorization"] = "Bearer $authKey";
    options.headers["accept"] = "application/json";
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("❗Dio Error: ${err.message}");
    super.onError(err, handler);
  }
}
