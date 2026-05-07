import 'package:movie_app/features/detailes/domain/entites/similer_entity.dart';

class SimilarDto {
  SimilarDto({this.page, this.totalPages, this.totalResults, this.results});
  int? page;
  int? totalPages;
  int? totalResults;
  List<Results>? results;

  SimilarDto.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  SimilarEntity toEntity() {
    return SimilarEntity(
      page: page ?? 0,
      results: results?.map((r) => r.toEntity()).toList().cast() ?? [],
      totalPages: totalPages ?? 0,
      totalResults: totalResults ?? 0,
    );
  }
}

class Results {
  Results({
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.releaseDate,
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.popularity,
    this.posterPath,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  String? backdropPath;
  int? id;
  int? voteCount;
  double? popularity;
  double? voteAverage;
  bool? adult;
  bool? video;
  List<int>? genreIds;

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  SimilarMovieEntity toEntity() {
    return SimilarMovieEntity(
      adult: adult ?? false,
      backdropPath: backdropPath ?? '',
      genreIds: genreIds ?? [],
      id: id ?? 0,
      originalLanguage: originalLanguage ?? '',
      originalTitle: originalTitle ?? '',
      overview: overview ?? '',
      popularity: popularity ?? 0.0,
      posterPath: posterPath ?? '',
      releaseDate: releaseDate ?? '',
      title: title ?? '',
      video: video ?? false,
      voteAverage: voteAverage ?? 0.0,
      voteCount: voteCount ?? 0,
    );
  }
}
