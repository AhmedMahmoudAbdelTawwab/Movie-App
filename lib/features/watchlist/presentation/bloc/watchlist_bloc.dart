import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/repositories/watchlist_repository.dart';
import 'watchlist_event.dart';
import 'watchlist_state.dart';

@injectable
class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  final WatchlistRepository _repository;

  WatchlistBloc(this._repository) : super(WatchlistInitial()) {
    on<LoadWatchlistEvent>(_onLoadWatchlist);
    on<ToggleWatchlistEvent>(_onToggleWatchlist);
    on<RemoveFromWatchlistEvent>(_onRemoveFromWatchlist);
    on<ClearWatchlistEvent>(_onClearWatchlist);
  }

  Future<void> _onLoadWatchlist(
    LoadWatchlistEvent event,
    Emitter<WatchlistState> emit,
  ) async {
    emit(WatchlistLoading());
    try {
      final movies = await _repository.getWatchlist();
      emit(WatchlistLoaded(movies));
    } catch (e) {
      emit(WatchlistError('Failed to load watchlist'));
    }
  }

  Future<void> _onToggleWatchlist(
    ToggleWatchlistEvent event,
    Emitter<WatchlistState> emit,
  ) async {
    try {
      final isWatchlisted = await _repository.isWatchlisted(event.movie.id);
      if (isWatchlisted) {
        await _repository.removeFromWatchlist(event.movie.id);
      } else {
        await _repository.addToWatchlist(event.movie);
      }
      add(LoadWatchlistEvent());
    } catch (e) {
      emit(WatchlistError('Operation failed'));
    }
  }

  Future<void> _onRemoveFromWatchlist(
    RemoveFromWatchlistEvent event,
    Emitter<WatchlistState> emit,
  ) async {
    try {
      await _repository.removeFromWatchlist(event.movieId);
      add(LoadWatchlistEvent());
    } catch (e) {
      emit(WatchlistError('Failed to remove movie'));
    }
  }

  Future<void> _onClearWatchlist(
    ClearWatchlistEvent event,
    Emitter<WatchlistState> emit,
  ) async {
    try {
      await _repository.clearWatchlist();
      add(LoadWatchlistEvent());
    } catch (e) {
      emit(WatchlistError('Failed to clear watchlist'));
    }
  }
}
