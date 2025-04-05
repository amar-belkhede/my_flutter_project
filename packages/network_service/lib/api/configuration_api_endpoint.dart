import 'package:dio/dio.dart';
import 'package:network_service/model/language_response.dart';
import 'package:retrofit/retrofit.dart';

part 'configuration_api_endpoint.g.dart';

@RestApi()
abstract class ConfigurationApiEndpoint {
  factory ConfigurationApiEndpoint(Dio dio) = _ConfigurationApiEndpoint;

  @GET("/configuration/languages")
  Future<List<LanguageResponse>> getConfiguration();
}
