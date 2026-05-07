import '../../domain/entities/recommended_entity.dart';

class RecommendedDto {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  RecommendedDto({this.page, this.results, this.totalPages, this.totalResults});

  RecommendedDto.fromJson(Map<String, dynamic> json) {
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

  RecommendedEntity toEntity() => RecommendedEntity(
    page: page ?? 0,
    results: results?.map((e) => e.toEntity()).toList() ?? [],
    totalPages: totalPages ?? 0,
    totalResults: totalResults ?? 0,
  );
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
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = (json['popularity'] as num?)?.toDouble();
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = (json['vote_average'] as num?)?.toDouble();
    voteCount = json['vote_count'];
  }

  ResultsEntity toEntity() {
    return ResultsEntity(
      id: id ?? 0,
      title: title ?? "",
      posterPath: posterPath ?? "",
      overview: overview ?? "",
      voteAverage: (voteAverage as num? ?? 0.0).toDouble(),
      backdropPath: backdropPath ?? "",
      releaseDate: releaseDate ?? "",
    );
  }
}
