class PopulerEntity {
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
PopulerEntity({
    this.adult = false,
     this.backdropPath = "" ,
     this.genreIds = const [],
     this.id = 0,
     this.originalLanguage = "",
     this.originalTitle = "",
     this.overview = "",
     this.popularity = 0.0,
     this.posterPath = "",
     this.releaseDate = "",
     this.title = "",
     this.video = false,
     this.voteAverage = 0.0,
     this.voteCount = 0,
  });
}

