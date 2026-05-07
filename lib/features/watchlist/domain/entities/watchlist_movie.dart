import 'package:movie_app/features/search/domain/entities/search_movie_entity.dart';

class WatchlistMovie {
  final int id;
  final String title;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;
  final String genre;
  final int runtime;

  WatchlistMovie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.genre,
    required this.runtime,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'posterPath': posterPath,
      'releaseDate': releaseDate,
      'voteAverage': voteAverage,
      'genre': genre,
      'runtime': runtime,
    };
  }

  factory WatchlistMovie.fromJson(Map<String, dynamic> json) {
    return WatchlistMovie(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      posterPath: json['posterPath'] ?? '',
      releaseDate: json['releaseDate'] ?? '',
      voteAverage: (json['voteAverage'] as num?)?.toDouble() ?? 0.0,
      genre: json['genre'] ?? '',
      runtime: json['runtime'] ?? 0,
    );
  }

  SearchMovieEntity toSearchEntity() {
    return SearchMovieEntity(
      id: id,
      title: title,
      posterPath: posterPath,
      releaseDate: releaseDate,
      voteAverage: voteAverage,
      genre: genre,
      runtime: runtime,
    );
  }

  factory WatchlistMovie.fromSearchEntity(SearchMovieEntity entity) {
    return WatchlistMovie(
      id: entity.id,
      title: entity.title,
      posterPath: entity.posterPath,
      releaseDate: entity.releaseDate,
      voteAverage: entity.voteAverage,
      genre: entity.genre,
      runtime: entity.runtime,
    );
  }
}
