import '../../domain/entities/watchlist_movie.dart';

abstract class WatchlistState {}

class WatchlistInitial extends WatchlistState {}

class WatchlistLoading extends WatchlistState {}

class WatchlistLoaded extends WatchlistState {
  final List<WatchlistMovie> movies;
  WatchlistLoaded(this.movies);
}

class WatchlistError extends WatchlistState {
  final String message;
  WatchlistError(this.message);
}
