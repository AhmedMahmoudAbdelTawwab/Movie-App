import '../../domain/entities/watchlist_movie.dart';

abstract class WatchlistEvent {}

class LoadWatchlistEvent extends WatchlistEvent {}

class ToggleWatchlistEvent extends WatchlistEvent {
  final WatchlistMovie movie;
  ToggleWatchlistEvent(this.movie);
}

class RemoveFromWatchlistEvent extends WatchlistEvent {
  final int movieId;
  RemoveFromWatchlistEvent(this.movieId);
}

class ClearWatchlistEvent extends WatchlistEvent {}
