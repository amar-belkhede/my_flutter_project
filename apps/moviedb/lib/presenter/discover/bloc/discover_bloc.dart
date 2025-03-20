import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:moviedb/repository/movie_repository.dart';
import 'package:network_service/model/movie_response.dart';

part 'discover_event.dart';
part 'discover_state.dart';

@lazySingleton
class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  MovieRepository _movieRepositoryImpl;
  DiscoverBloc(this._movieRepositoryImpl) : super(DiscoverInitial()) {
    on<DiscoverEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetDiscoverMovieEvent>(getMovies);
    on<GetDiscoverTvEvent>(getTvShows);
    on<SaveMovieEvent>(saveMovie);
  }

  FutureOr<void> saveMovie(event, emit) async {
    try {
      _movieRepositoryImpl.saveMovie(event.movie);
    } on Exception catch (e) {}
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
      emit(const DiscoverLoading());
      var response = await _movieRepositoryImpl.getDiscoverMovie();
      emit(DiscoverMovies(movieResponse: response));
    } on Exception catch (e) {
      emit(DiscoverError(e.toString()));
    }
  }
}
