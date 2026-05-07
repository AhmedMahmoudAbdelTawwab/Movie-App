import '../../domain/entities/search_movie_entity.dart';

class SearchMoviesDto {
  SearchMoviesDto(
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  );

  int? page;
  List<SearchMovieResultDto>? results;
  int? totalPages;
  int? totalResults;

  SearchMoviesDto.fromJson(Map<String, dynamic> json) {
    page = json['page'] as int?;
    final dynamic rawResults = json['results'];
    if (rawResults is List) {
      results = rawResults
          .whereType<Map<String, dynamic>>()
          .map(SearchMovieResultDto.fromJson)
          .toList();
    }
    totalPages = json['total_pages'] as int?;
    totalResults = json['total_results'] as int?;
  }

  List<SearchMovieEntity> toEntityList() {
    return (results ?? <SearchMovieResultDto>[])
        .map(
          (SearchMovieResultDto r) => SearchMovieEntity(
            id: r.id ?? 0,
            title: r.title ?? '',
            overview: r.overview ?? '',
            posterPath: r.posterPath ?? '',
            releaseDate: r.releaseDate ?? '',
            voteAverage: r.voteAverage ?? 0.0,
            voteCount: r.voteCount ?? 0,
            originalLanguage: r.originalLanguage ?? '',
          ),
        )
        .toList();
  }
}

class MovieDetailsDto {
  MovieDetailsDto({
    this.runtime,
    this.genres,
  });

  int? runtime;
  List<String>? genres;

  MovieDetailsDto.fromJson(Map<String, dynamic> json) {
    runtime = (json['runtime'] as num?)?.toInt();
    final dynamic rawGenres = json['genres'];
    if (rawGenres is List) {
      genres = rawGenres
          .whereType<Map<String, dynamic>>()
          .map(
            (Map<String, dynamic> g) => (g['name'] as String?) ?? '',
          )
          .where((String name) => name.isNotEmpty)
          .toList();
    }
  }
}

class SearchMovieResultDto {
  int? id;
  String? title;
  String? overview;
  String? posterPath;
  String? releaseDate;
  double? voteAverage;
  int? voteCount;
  String? originalLanguage;

  SearchMovieResultDto({
    this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
    this.voteCount,
    this.originalLanguage,
  });

  SearchMovieResultDto.fromJson(Map<String, dynamic> json) {
    id = (json['id'] as num?)?.toInt();
    title = json['title'] as String?;
    overview = json['overview'] as String?;
    posterPath = json['poster_path'] as String?;
    releaseDate = json['release_date'] as String?;
    voteAverage = (json['vote_average'] as num?)?.toDouble();
    voteCount = (json['vote_count'] as num?)?.toInt();
    originalLanguage = json['original_language'] as String?;
  }
}
