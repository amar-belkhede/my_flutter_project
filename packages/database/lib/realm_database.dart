import 'dart:async';

import 'package:database/table/movie_db.dart';
import 'package:realm/realm.dart';

class RealmDatabase {
  late final Realm _realm;

  RealmDatabase() {
    final config = Configuration.local([FavoriteMovieDB.schema]);
    _realm = Realm(config);
  }

  Future<void> saveMovie(FavoriteMovieDB movie) async {
    _realm.write(() {
      _realm.add(movie, update: true);
    });
  }

  Stream<List<FavoriteMovieDB>> getFavoriteMovies() {
    final controller = StreamController<List<FavoriteMovieDB>>();
    _realm.all<FavoriteMovieDB>().changes.listen(
      (event) {
        controller.add(event.results.toList());
      },
    );
    return controller.stream;
  }

  void deleteMovie(FavoriteMovieDB movie) {
    var movieToDelete = _realm.find<FavoriteMovieDB>(movie.id);
    if (movieToDelete == null) {
      return;
    }
    _realm.write(() {
      _realm.delete(movieToDelete);
    });
  }

  void deleteAllMovies() {
    _realm.write(() {
      _realm.deleteAll();
    });
  }
}
