class DetailsEntity {
  DetailsEntity({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
  late bool adult;
  late String backdropPath;
  late Map<String, dynamic> belongsToCollection;
  late int budget;
  late List<GenresEntity> genres;
  late String homepage;
  late int id;
  late String imdbId;
  late String originalLanguage;
  late String originalTitle;
  late String overview;
  late double popularity;
  late String posterPath;
  late String releaseDate;
  late int revenue;
  late int runtime;
  late List<SpokenLanguagesEntity> spokenLanguages;
  late String status;
  late String tagline;
  late String title;
  late bool video;
  late double voteAverage;
  late int voteCount;
}

class GenresEntity {
  late int id;
  late String name;

  GenresEntity({required this.id, required this.name});
}

class ProductionCompaniesEntity {
  late int id;
  late String logoPath;
  late String name;
  late String originCountry;

  ProductionCompaniesEntity({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });
}

class ProductionCountriesEntity {
  late String iso31661;
  late String name;

  ProductionCountriesEntity({required this.iso31661, required this.name});
}

class SpokenLanguagesEntity {
  late String iso6391;
  late String name;

  SpokenLanguagesEntity({required this.iso6391, required this.name});
}
