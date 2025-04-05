import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:database/table/movie_db.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:moviedb/repository/movie_repository.dart';
import 'package:network_service/model/movie_response.dart';

part 'discover_event.dart';
part 'discover_state.dart';

@singleton
class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  final MovieRepository _movieRepositoryImpl;

  List<int> favoriteMoviesId = [];
  DiscoverBloc(this._movieRepositoryImpl) : super(const DiscoverInitial()) {
    listenToFavoriteMovie();
    on<DiscoverEvent>((event, emit) {});
    on<GetDiscoverMovieEvent>(getMovies);
    on<GetDiscoverTvEvent>(getTvShows);
    on<SaveMovieEvent>(saveFavoriteMovie);
    on<DeleteMovieEvent>(deleteFavoriteMovie);
  }

  listenToFavoriteMovie() {
    Stream<List<FavoriteMovieDB>> favoriteMovies =
        _movieRepositoryImpl.getFavoriteSavedMovies();

    favoriteMovies.listen((event) async {
      favoriteMoviesId = event.map((e) {
        return e.id;
      }).toList();
    });
  }

  FutureOr<void> saveFavoriteMovie(SaveMovieEvent event, emit) async {
    try {
      _movieRepositoryImpl.saveFavoriteMovie(event.movie);
      add(GetDiscoverMovieEvent());
    } on Exception catch (e) {
      emit(DiscoverError(e.toString()));
    }
  }

  FutureOr<void> deleteFavoriteMovie(DeleteMovieEvent event, emit) async {
    try {
      _movieRepositoryImpl.deleteFavoriteMovie(event.movie);
      add(GetDiscoverMovieEvent());
    } on Exception catch (e) {
      emit(DiscoverError(e.toString()));
    }
  }

  FutureOr<void> getTvShows(event, emit) async {
    try {
      emit(const DiscoverLoading());
      var response = await _movieRepositoryImpl.getDiscoverTv();
      emit(DiscoverTvShows(movieResponse: response));
    } on Exception catch (e) {
      emit(DiscoverError(e.toString()));
    }
  }

  FutureOr<void> getMovies(event, emit) async {
    try {
      // emit(const DiscoverLoading());
      var response = await _movieRepositoryImpl.getDiscoverMovie();

      response.movies?.forEach((element) {
        if (favoriteMoviesId.contains(element.id)) {
          element.favorite = true;
        }
      });
      emit(DiscoverMovies(movieResponse: response));
    } on Exception catch (e) {
      emit(DiscoverError(e.toString()));
    }
  }
}
