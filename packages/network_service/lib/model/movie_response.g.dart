// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieResponseAdapter extends TypeAdapter<MovieResponse> {
  @override
  final int typeId = 1;

  @override
  MovieResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieResponse(
      page: fields[1] as int,
      movies: (fields[3] as List?)?.cast<Movie>(),
      totalPages: fields[5] as int,
      totalResults: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MovieResponse obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.page)
      ..writeByte(3)
      ..write(obj.movies)
      ..writeByte(5)
      ..write(obj.totalPages)
      ..writeByte(7)
      ..write(obj.totalResults);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MovieAdapter extends TypeAdapter<Movie> {
  @override
  final int typeId = 2;

  @override
  Movie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Movie(
      adult: fields[1] as bool,
      backdropPath: fields[3] as String?,
      genreIds: (fields[5] as List?)?.cast<int>(),
      id: fields[7] as int,
      originalLanguage: fields[9] as String,
      originalTitle: fields[11] as String,
      overview: fields[13] as String,
      popularity: fields[15] as double,
      posterPath: fields[17] as String?,
      releaseDate: fields[19] as DateTime,
      title: fields[21] as String,
      video: fields[23] as bool,
      voteAverage: fields[25] as double,
      voteCount: fields[27] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Movie obj) {
    writer
      ..writeByte(14)
      ..writeByte(1)
      ..write(obj.adult)
      ..writeByte(3)
      ..write(obj.backdropPath)
      ..writeByte(5)
      ..write(obj.genreIds)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(9)
      ..write(obj.originalLanguage)
      ..writeByte(11)
      ..write(obj.originalTitle)
      ..writeByte(13)
      ..write(obj.overview)
      ..writeByte(15)
      ..write(obj.popularity)
      ..writeByte(17)
      ..write(obj.posterPath)
      ..writeByte(19)
      ..write(obj.releaseDate)
      ..writeByte(21)
      ..write(obj.title)
      ..writeByte(23)
      ..write(obj.video)
      ..writeByte(25)
      ..write(obj.voteAverage)
      ..writeByte(27)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    MovieResponse(
      page: (json['page'] as num).toInt(),
      movies: (json['results'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['total_pages'] as num).toInt(),
      totalResults: (json['total_results'] as num).toInt(),
    );

Map<String, dynamic> _$MovieResponseToJson(MovieResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.movies,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      adult: json['adult'] as bool,
      backdropPath: json['backdrop_path'] as String?,
      genreIds: (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      id: (json['id'] as num).toInt(),
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String?,
      releaseDate: DateTime.parse(json['release_date'] as String),
      title: json['title'] as String,
      video: json['video'] as bool,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: (json['vote_count'] as num).toInt(),
      favorite: json['favorite'] as bool? ?? false,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate.toIso8601String(),
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'favorite': instance.favorite,
    };
