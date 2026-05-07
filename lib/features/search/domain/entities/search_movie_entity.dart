class SearchMovieEntity {
  SearchMovieEntity({
    this.id = 0,
    this.title = '',
    this.overview = '',
    this.posterPath = '',
    this.releaseDate = '',
    this.voteAverage = 0.0,
    this.voteCount = 0,
    this.originalLanguage = '',
    this.genre = '',
    this.runtime = 0,
  });

  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;
  final String originalLanguage;
  final String genre;
  final int runtime;
}
