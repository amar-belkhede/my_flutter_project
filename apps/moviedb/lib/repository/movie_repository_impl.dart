import 'package:database/realm_database.dart';
import 'package:database/table/movie_db.dart';
import 'package:injectable/injectable.dart';
import 'package:moviedb/repository/movie_repository.dart';
import 'package:network_service/api/moviedb_api_endpoint.dart';
import 'package:network_service/model/movie_response.dart';
import 'package:moviedb/extension.dart';

@LazySingleton(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MoviedbApiEndpoint _moviedbApiEndpoint;
  final RealmDatabase _realmDatabase;

  MovieRepositoryImpl(this._moviedbApiEndpoint, this._realmDatabase);

  @override
  Future<MovieResponse> getDiscoverMovie() async {
    return await _moviedbApiEndpoint.getDiscoverMovie();
  }

  @override
  Future<MovieResponse> getDiscoverTv() async {
    return await _moviedbApiEndpoint.getDiscoverTv();
  }

  @override
  void deleteMovie(MovieDB movie) {
    _realmDatabase.deleteMovie(movie);
  }

  @override
  Future<List<MovieDB>> getMovies() async {
    return _realmDatabase.getMovies();
  }

  @override
  void saveMovie(Movie movie) {
    _realmDatabase.saveMovie(movie.toMovieDB());
  }
}
