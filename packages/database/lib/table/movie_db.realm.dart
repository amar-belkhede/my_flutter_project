// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_db.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class MovieDB extends _MovieDB with RealmEntity, RealmObjectBase, RealmObject {
  MovieDB(
    bool adult,
    String backdropPath,
    int id,
    String originalLanguage,
    String originalTitle,
    String overview,
    double popularity,
    String posterPath,
    DateTime releaseDate,
    String title,
    bool video,
    double voteAverage,
    int voteCount, {
    Iterable<int> genreIds = const [],
  }) {
    RealmObjectBase.set(this, 'adult', adult);
    RealmObjectBase.set(this, 'backdropPath', backdropPath);
    RealmObjectBase.set<RealmList<int>>(
        this, 'genreIds', RealmList<int>(genreIds));
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'originalLanguage', originalLanguage);
    RealmObjectBase.set(this, 'originalTitle', originalTitle);
    RealmObjectBase.set(this, 'overview', overview);
    RealmObjectBase.set(this, 'popularity', popularity);
    RealmObjectBase.set(this, 'posterPath', posterPath);
    RealmObjectBase.set(this, 'releaseDate', releaseDate);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'video', video);
    RealmObjectBase.set(this, 'voteAverage', voteAverage);
    RealmObjectBase.set(this, 'voteCount', voteCount);
  }

  MovieDB._();

  @override
  bool get adult => RealmObjectBase.get<bool>(this, 'adult') as bool;
  @override
  set adult(bool value) => RealmObjectBase.set(this, 'adult', value);

  @override
  String get backdropPath =>
      RealmObjectBase.get<String>(this, 'backdropPath') as String;
  @override
  set backdropPath(String value) =>
      RealmObjectBase.set(this, 'backdropPath', value);

  @override
  RealmList<int> get genreIds =>
      RealmObjectBase.get<int>(this, 'genreIds') as RealmList<int>;
  @override
  set genreIds(covariant RealmList<int> value) =>
      throw RealmUnsupportedSetError();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get originalLanguage =>
      RealmObjectBase.get<String>(this, 'originalLanguage') as String;
  @override
  set originalLanguage(String value) =>
      RealmObjectBase.set(this, 'originalLanguage', value);

  @override
  String get originalTitle =>
      RealmObjectBase.get<String>(this, 'originalTitle') as String;
  @override
  set originalTitle(String value) =>
      RealmObjectBase.set(this, 'originalTitle', value);

  @override
  String get overview =>
      RealmObjectBase.get<String>(this, 'overview') as String;
  @override
  set overview(String value) => RealmObjectBase.set(this, 'overview', value);

  @override
  double get popularity =>
      RealmObjectBase.get<double>(this, 'popularity') as double;
  @override
  set popularity(double value) =>
      RealmObjectBase.set(this, 'popularity', value);

  @override
  String get posterPath =>
      RealmObjectBase.get<String>(this, 'posterPath') as String;
  @override
  set posterPath(String value) =>
      RealmObjectBase.set(this, 'posterPath', value);

  @override
  DateTime get releaseDate =>
      RealmObjectBase.get<DateTime>(this, 'releaseDate') as DateTime;
  @override
  set releaseDate(DateTime value) =>
      RealmObjectBase.set(this, 'releaseDate', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  bool get video => RealmObjectBase.get<bool>(this, 'video') as bool;
  @override
  set video(bool value) => RealmObjectBase.set(this, 'video', value);

  @override
  double get voteAverage =>
      RealmObjectBase.get<double>(this, 'voteAverage') as double;
  @override
  set voteAverage(double value) =>
      RealmObjectBase.set(this, 'voteAverage', value);

  @override
  int get voteCount => RealmObjectBase.get<int>(this, 'voteCount') as int;
  @override
  set voteCount(int value) => RealmObjectBase.set(this, 'voteCount', value);

  @override
  Stream<RealmObjectChanges<MovieDB>> get changes =>
      RealmObjectBase.getChanges<MovieDB>(this);

  @override
  Stream<RealmObjectChanges<MovieDB>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<MovieDB>(this, keyPaths);

  @override
  MovieDB freeze() => RealmObjectBase.freezeObject<MovieDB>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'adult': adult.toEJson(),
      'backdropPath': backdropPath.toEJson(),
      'genreIds': genreIds.toEJson(),
      'id': id.toEJson(),
      'originalLanguage': originalLanguage.toEJson(),
      'originalTitle': originalTitle.toEJson(),
      'overview': overview.toEJson(),
      'popularity': popularity.toEJson(),
      'posterPath': posterPath.toEJson(),
      'releaseDate': releaseDate.toEJson(),
      'title': title.toEJson(),
      'video': video.toEJson(),
      'voteAverage': voteAverage.toEJson(),
      'voteCount': voteCount.toEJson(),
    };
  }

  static EJsonValue _toEJson(MovieDB value) => value.toEJson();
  static MovieDB _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'adult': EJsonValue adult,
        'backdropPath': EJsonValue backdropPath,
        'id': EJsonValue id,
        'originalLanguage': EJsonValue originalLanguage,
        'originalTitle': EJsonValue originalTitle,
        'overview': EJsonValue overview,
        'popularity': EJsonValue popularity,
        'posterPath': EJsonValue posterPath,
        'releaseDate': EJsonValue releaseDate,
        'title': EJsonValue title,
        'video': EJsonValue video,
        'voteAverage': EJsonValue voteAverage,
        'voteCount': EJsonValue voteCount,
      } =>
        MovieDB(
          fromEJson(adult),
          fromEJson(backdropPath),
          fromEJson(id),
          fromEJson(originalLanguage),
          fromEJson(originalTitle),
          fromEJson(overview),
          fromEJson(popularity),
          fromEJson(posterPath),
          fromEJson(releaseDate),
          fromEJson(title),
          fromEJson(video),
          fromEJson(voteAverage),
          fromEJson(voteCount),
          genreIds: fromEJson(ejson['genreIds']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(MovieDB._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, MovieDB, 'MovieDB', [
      SchemaProperty('adult', RealmPropertyType.bool),
      SchemaProperty('backdropPath', RealmPropertyType.string),
      SchemaProperty('genreIds', RealmPropertyType.int,
          collectionType: RealmCollectionType.list),
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('originalLanguage', RealmPropertyType.string),
      SchemaProperty('originalTitle', RealmPropertyType.string),
      SchemaProperty('overview', RealmPropertyType.string),
      SchemaProperty('popularity', RealmPropertyType.double),
      SchemaProperty('posterPath', RealmPropertyType.string),
      SchemaProperty('releaseDate', RealmPropertyType.timestamp),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('video', RealmPropertyType.bool),
      SchemaProperty('voteAverage', RealmPropertyType.double),
      SchemaProperty('voteCount', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
