part of 'discover_bloc.dart';

@immutable
sealed class DiscoverEvent extends Equatable {
  const DiscoverEvent();
  @override
  List<Object?> get props => [];
}

final class GetDiscoverMovieEvent extends DiscoverEvent {}

final class GetDiscoverTvEvent extends DiscoverEvent {}

final class SaveMovieEvent extends DiscoverEvent {
  final Movie movie;
  const SaveMovieEvent(this.movie);

  @override
  List<Object?> get props => [movie];
}

final class DeleteMovieEvent extends DiscoverEvent {
  final Movie movie;
  const DeleteMovieEvent(this.movie);

  @override
  List<Object?> get props => [movie];
}
