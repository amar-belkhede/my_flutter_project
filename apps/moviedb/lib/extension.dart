import 'package:database/table/movie_db.dart';
import 'package:network_service/model/movie_response.dart';

extension MovieExtension on Movie {
  FavoriteMovieDB toFavoriteMovieDB() {
    return FavoriteMovieDB(
        adult,
        backdropPath ?? '',
        id,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath ?? '',
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount,
        genreIds: genreIds ?? []);
  }
}
