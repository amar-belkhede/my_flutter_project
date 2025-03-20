part of 'discover_bloc.dart';

@immutable
sealed class DiscoverEvent {
  const DiscoverEvent();
}

final class GetDiscoverMovieEvent extends DiscoverEvent {}

final class GetDiscoverTvEvent extends DiscoverEvent {}

final class SaveMovieEvent extends DiscoverEvent {
  final Movie movie;
  const SaveMovieEvent(this.movie);
}
