class SimilarEntity {
  SimilarEntity({
    this.page = 0,
    this.totalPages = 0,
    this.totalResults = 0,
    this.results = const [],
  });
  int page;
  int totalPages;
  int totalResults;
  List<SimilarMovieEntity> results;
}

class SimilarMovieEntity {
  SimilarMovieEntity({
    this.adult = false,
    this.backdropPath = '',
    this.genreIds = const [],
    this.id = 0,
    this.originalLanguage = '',
    this.originalTitle = '',
    this.overview = '',
    this.popularity = 0.0,
    this.posterPath = '',
    this.releaseDate = '',
    this.title = '',
    this.video = false,
    this.voteAverage = 0.0,
    this.voteCount = 0,
  });
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;
}
