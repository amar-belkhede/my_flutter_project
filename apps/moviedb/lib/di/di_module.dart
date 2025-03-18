import 'package:injectable/injectable.dart';
import 'package:moviedb/di/configure_dependency.dart';
import 'package:network_service/api/moviedb_api_endpoint.dart';
import 'package:network_service/dio_client.dart';
import 'package:database/realm_database.dart';

@module
abstract class DiModule {
  @singleton
  DioClient provideDioClient() => DioClient();

  @singleton
  RealmDatabase provideRealmDatabase() => RealmDatabase();

  @lazySingleton
  MoviedbApiEndpoint provideMoviedbApiEndpoint() =>
      MoviedbApiEndpoint(getIt<DioClient>().dio);
}
