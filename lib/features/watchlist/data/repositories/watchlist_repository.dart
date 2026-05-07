import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/watchlist_movie.dart';

@lazySingleton
class WatchlistRepository {
  static const String _key = 'watchlist_movies';

  Future<List<WatchlistMovie>> getWatchlist() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> list = prefs.getStringList(_key) ?? [];
    return list
        .map((String item) => WatchlistMovie.fromJson(jsonDecode(item)))
        .toList();
  }

  Future<void> addToWatchlist(WatchlistMovie movie) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<WatchlistMovie> currentList = await getWatchlist();
    if (!currentList.any((m) => m.id == movie.id)) {
      currentList.add(movie);
      final List<String> stringList = currentList
          .map((m) => jsonEncode(m.toJson()))
          .toList();
      await prefs.setStringList(_key, stringList);
    }
  }

  Future<void> removeFromWatchlist(int movieId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<WatchlistMovie> currentList = await getWatchlist();
    currentList.removeWhere((m) => m.id == movieId);
    final List<String> stringList = currentList
        .map((m) => jsonEncode(m.toJson()))
        .toList();
    await prefs.setStringList(_key, stringList);
  }

  Future<bool> isWatchlisted(int movieId) async {
    final List<WatchlistMovie> currentList = await getWatchlist();
    return currentList.any((m) => m.id == movieId);
  }

  Future<void> clearWatchlist() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
