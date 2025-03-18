import 'package:database/table/movie_db.dart';
import 'package:realm/realm.dart';

class RealmDatabase {
  late final Realm _realm;

  RealmDatabase() {
    final config = Configuration.local([MovieDB.schema]);
    _realm = Realm(config);
  }

  void saveMovie(MovieDB movie) {
    _realm.write(() {
      _realm.add(movie, update: true);
    });
  }

  List<MovieDB> getMovies() {
    return _realm.all<MovieDB>().toList();
  }

  void deleteMovie(MovieDB movie) {
    _realm.write(() {
      _realm.delete(movie);
    });
  }

  void deleteAllMovies() {
    _realm.write(() {
      _realm.deleteAll();
    });
  }
}
