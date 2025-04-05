import 'package:database/realm_database.dart';
import 'package:database/table/movie_db.dart';
import 'package:injectable/injectable.dart';
import 'package:moviedb/extension.dart';
import 'package:moviedb/repository/movie_repository.dart';
import 'package:network_service/api/moviedb_api_endpoint.dart';
import 'package:network_service/model/language_response.dart';
import 'package:network_service/model/movie_response.dart';
import 'package:network_service/api/configuration_api_endpoint.dart';
import 'package:moviedb/secure_storage.dart';

@LazySingleton(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MoviedbApiEndpoint _moviedbApiEndpoint;
  final ConfigurationApiEndpoint _configurationApiEndpoint;
  final RealmDatabase _realmDatabase;

  MovieRepositoryImpl(this._moviedbApiEndpoint, this._realmDatabase,
      this._configurationApiEndpoint);

  @override
  Future<MovieResponse> getDiscoverMovie() async {
    final language = await Storage().getLanguage();
    return await _moviedbApiEndpoint.getDiscoverMovie(
        language: language.iso6391 ?? "en-US");
  }

  @override
  Future<MovieResponse> getDiscoverTv() async {
    return await _moviedbApiEndpoint.getDiscoverTv();
  }

  @override
  void deleteFavoriteMovie(Movie movie) {
    _realmDatabase.deleteMovie(movie.toFavoriteMovieDB());
  }

@override
  void deleteFavoriteMoviesDB(FavoriteMovieDB movie) {
    _realmDatabase.deleteMovie(movie);
  }

  @override
  Stream<List<FavoriteMovieDB>> getFavoriteSavedMovies() async* {
    await for (final movies in _realmDatabase.getFavoriteMovies()) {
      yield movies;
    }
  }

  @override
  Future<void> saveFavoriteMovie(Movie movie) async {
    await _realmDatabase.saveMovie(movie.toFavoriteMovieDB());
  }

  @override
  Future<List<LanguageResponse>> getLanguages() {
    return _configurationApiEndpoint.getConfiguration();
  }
}
