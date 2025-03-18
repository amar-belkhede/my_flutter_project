import 'package:network_service/model/movie_response.dart';
import 'package:database/table/movie_db.dart';


abstract class MovieRepository {
  Future<MovieResponse> getDiscoverMovie();
  Future<MovieResponse> getDiscoverTv();
  void saveMovie(Movie movie);
  Future<List<MovieDB>> getMovies();
  void deleteMovie(MovieDB movie);
}
