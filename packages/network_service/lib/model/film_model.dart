import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'film_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class FilmModel {
    @HiveField(1)
    @JsonKey(name: "page")
    int page;
    @HiveField(3)
    @JsonKey(name: "results")
    List<Result> results;
    @HiveField(5)
    @JsonKey(name: "total_pages")
    int totalPages;
    @HiveField(7)
    @JsonKey(name: "total_results")
    int totalResults;

    FilmModel({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory FilmModel.fromJson(Map<String, dynamic> json) => _$FilmModelFromJson(json);

    Map<String, dynamic> toJson() => _$FilmModelToJson(this);
}

@HiveType(typeId: 2)
@JsonSerializable()
class Result {
    @HiveField(1)
    @JsonKey(name: "adult")
    bool adult;
    @HiveField(3)
    @JsonKey(name: "backdrop_path")
    String? backdropPath;
    @HiveField(5)
    @JsonKey(name: "genre_ids")
    List<int> genreIds;
    @HiveField(7)
    @JsonKey(name: "id")
    int id;
    @HiveField(9)
    @JsonKey(name: "original_language")
    String originalLanguage;
    @HiveField(11)
    @JsonKey(name: "original_title")
    String originalTitle;
    @HiveField(13)
    @JsonKey(name: "overview")
    String overview;
    @HiveField(15)
    @JsonKey(name: "popularity")
    double popularity;
    @HiveField(17)
    @JsonKey(name: "poster_path")
    String? posterPath;
    @HiveField(19)
    @JsonKey(name: "release_date")
    DateTime releaseDate;
    @HiveField(21)
    @JsonKey(name: "title")
    String title;
    @HiveField(23)
    @JsonKey(name: "video")
    bool video;
    @HiveField(25)
    @JsonKey(name: "vote_average")
    double voteAverage;
    @HiveField(27)
    @JsonKey(name: "vote_count")
    int voteCount;

    Result({
        required this.adult,
        required this.backdropPath,
        required this.genreIds,
        required this.id,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.releaseDate,
        required this.title,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

    Map<String, dynamic> toJson() => _$ResultToJson(this);
}
