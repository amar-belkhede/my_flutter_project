part of 'discover_bloc.dart';

@immutable
sealed class DiscoverState extends Equatable {
  final MovieResponse? movieResponse;

  const DiscoverState({this.movieResponse});
  @override
  List<Object?> get props => [movieResponse];
}

final class DiscoverInitial extends DiscoverState {
  const DiscoverInitial();

  @override
  List<Object?> get props => [movieResponse];
}

final class DiscoverLoading extends DiscoverState {
  const DiscoverLoading();
}

final class DiscoverMovies extends DiscoverState {
  const DiscoverMovies({required super.movieResponse});

  @override
  List<Object?> get props => [movieResponse];
}

final class DiscoverTvShows extends DiscoverState {
  const DiscoverTvShows({required super.movieResponse});

  @override
  List<Object?> get props => [movieResponse];
}

final class DiscoverError extends DiscoverState {
  final String message;

  const DiscoverError(this.message);

  @override
  List<Object?> get props => [message, movieResponse];
}
