import '../../domain/entities/populer_entity.dart';

class PopularDto {
  PopularDto(this.page, this.results, this.totalPages, this.totalResults);

  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  PopularDto.fromJson(Map<String, dynamic> json) {
    page = json['page'] as int?;
    final dynamic rawResults = json['results'];
    if (rawResults is List) {
      results = rawResults
          .whereType<Map<String, dynamic>>()
          .map(Results.fromJson)
          .toList();
    }
    totalPages = json['total_pages'] as int?;
    totalResults = json['total_results'] as int?;
  }

  List<PopulerEntity> toEntityList() {
    return (results ?? <Results>[])
        .map(
          (Results r) => PopulerEntity(
            adult: r.adult ?? false,
            backdropPath: r.backdropPath ?? '',
            genreIds: r.genreIds ?? <int>[],
            id: r.id ?? 0,
            originalLanguage: r.originalLanguage ?? '',
            originalTitle: r.originalTitle ?? '',
            overview: r.overview ?? '',
            popularity: r.popularity ?? 0.0,
            posterPath: r.posterPath ?? '',
            releaseDate: r.releaseDate ?? '',
            title: r.title ?? '',
            video: r.video ?? false,
            voteAverage: r.voteAverage ?? 0.0,
            voteCount: r.voteCount ?? 0,
          ),
        )
        .toList();
  }
}

class Results {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Results({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'] as bool?;
    backdropPath = json['backdrop_path'] as String?;
    genreIds = (json['genre_ids'] as List<dynamic>?)
        ?.whereType<num>()
        .map((num value) => value.toInt())
        .toList();
    id = (json['id'] as num?)?.toInt();
    originalLanguage = json['original_language'] as String?;
    originalTitle = json['original_title'] as String?;
    overview = json['overview'] as String?;
    popularity = (json['popularity'] as num?)?.toDouble();
    posterPath = json['poster_path'] as String?;
    releaseDate = json['release_date'] as String?;
    title = json['title'] as String?;
    video = json['video'] as bool?;
    voteAverage = (json['vote_average'] as num?)?.toDouble();
    voteCount = (json['vote_count'] as num?)?.toInt();
  }
}
