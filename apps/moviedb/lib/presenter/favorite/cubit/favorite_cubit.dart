import 'package:bloc/bloc.dart';
import 'package:database/table/movie_db.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:moviedb/repository/movie_repository.dart';

part 'favorite_state.dart';

@singleton
class FavoriteCubit extends Cubit<FavoriteState> {
  final MovieRepository _movieRepository;
  List<FavoriteMovieDB> _movies = [];

  FavoriteCubit(this._movieRepository) : super(FavoriteLoading()) {
    getMovies();
  }

  getMovies() async {
    try {
      Stream<List<FavoriteMovieDB>> favoriteMovies =
          _movieRepository.getFavoriteSavedMovies();

      favoriteMovies.listen((event) {
        _movies = event;
        emit(FavoriteSuccess(_movies));
      });
    } on Exception catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  removeFromFavorite(FavoriteMovieDB movie) {
    _movieRepository.deleteFavoriteMoviesDB(movie);
    getMovies();
  }

  List<FavoriteMovieDB> get movies => _movies;
}
