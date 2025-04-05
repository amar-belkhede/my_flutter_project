import 'package:network_service/model/language_response.dart';
import 'package:network_service/model/movie_response.dart';
import 'package:database/table/movie_db.dart';

abstract class MovieRepository {
  Future<MovieResponse> getDiscoverMovie();
  Future<MovieResponse> getDiscoverTv();
  void saveFavoriteMovie(Movie movie);
  Stream<List<FavoriteMovieDB>> getFavoriteSavedMovies();
  void deleteFavoriteMovie(Movie movie);
  void deleteFavoriteMoviesDB(FavoriteMovieDB movie);

  Future<List<LanguageResponse>> getLanguages();
}
