import "package:realm/realm.dart";

part 'movie_db.realm.dart';

@RealmModel()
class _FavoriteMovieDB {
  late bool adult;
  late String backdropPath;
  late List<int> genreIds;
  @PrimaryKey()
  late int id;
  late String originalLanguage;
  late String originalTitle;
  late String overview;
  late double popularity;
  late String posterPath;
  late DateTime releaseDate;
  late String title;
  late bool video;
  late double voteAverage;
  late int voteCount;
}
