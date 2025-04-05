part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState extends Equatable {}

final class FavoriteInitial extends FavoriteState {
  @override
  List<Object?> get props => [];
}

final class FavoriteLoading extends FavoriteState {
  @override
  List<Object?> get props => [];
}

final class FavoriteSuccess extends FavoriteState {
  final List<FavoriteMovieDB> movies;
  FavoriteSuccess(this.movies);

  @override
  List<Object?> get props => [movies];
}

final class FavoriteError extends FavoriteState {
  final String message;

  FavoriteError(this.message);

  @override
  List<Object?> get props => [message];
}
