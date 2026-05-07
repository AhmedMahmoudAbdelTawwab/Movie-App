import 'package:movie_app/features/detailes/domain/entites/detailes_entity.dart';

class DetailsDto {
  DetailsDto({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? backdropPath;
  String? homepage;
  String? imdbId;
  String? posterPath;
  String? status;
  String? tagline;
  String? title;
  String? releaseDate;
  int? budget;
  int? id;
  int? revenue;
  int? runtime;
  int? voteCount;
  double? voteAverage;
  double? popularity;
  bool? adult;
  bool? video;
  Map<String, dynamic>? belongsToCollection;
  List<Genres>? genres;
  List<String>? originCountry;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  List<SpokenLanguages>? spokenLanguages;

  DetailsDto.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originCountry = json['origin_country'] != null
        ? json['origin_country'].cast<String>()
        : [];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = <ProductionCompanies>[];
      json['production_companies'].forEach((v) {
        productionCompanies!.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = <ProductionCountries>[];
      json['production_countries'].forEach((v) {
        productionCountries!.add(ProductionCountries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = <SpokenLanguages>[];
      json['spoken_languages'].forEach((v) {
        spokenLanguages!.add(SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  DetailsEntity toEntity() {
    return DetailsEntity(
      adult: adult ?? false,
      backdropPath: backdropPath ?? '',
      belongsToCollection: belongsToCollection ?? {},
      budget: budget ?? 0,
      genres: genres != null
          ? genres!
                .map((genre) => genre.toEntity())
                .toList()
                .cast<GenresEntity>()
          : [],
      homepage: homepage ?? '',
      id: id ?? 0,
      imdbId: imdbId ?? '',
      originalLanguage: originalLanguage ?? '',
      originalTitle: originalTitle ?? '',
      overview: overview ?? '',
      popularity: popularity ?? 0.0,
      posterPath: posterPath ?? '',
      releaseDate: releaseDate ?? '',
      revenue: revenue ?? 0,
      runtime: runtime ?? 0,
      spokenLanguages: spokenLanguages != null
          ? spokenLanguages!
                .map((language) => language.toEntity())
                .toList()
                .cast<SpokenLanguagesEntity>()
          : [],
      status: status ?? '',
      tagline: tagline ?? '',
      title: title ?? '',
      video: video ?? false,
      voteAverage: voteAverage ?? 0.0,
      voteCount: voteCount ?? 0,
    );
  }
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    return data;
  }

  GenresEntity toEntity() {
    return GenresEntity(id: id ?? 0, name: name ?? '');
  }
}

class ProductionCompanies {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['logo_path'] = logoPath;
    data['name'] = name;
    data['origin_country'] = originCountry;
    return data;
  }

  ProductionCompanies toEntity() {
    return ProductionCompanies(
      id: id ?? 0,
      logoPath: logoPath ?? '',
      name: name ?? '',
      originCountry: originCountry ?? '',
    );
  }
}

class ProductionCountries {
  String? iso31661;
  String? name;

  ProductionCountries({this.iso31661, this.name});

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['iso_3166_1'] = iso31661;
    data['name'] = name;
    return data;
  }

  ProductionCountries toEntity() {
    return ProductionCountries(iso31661: iso31661 ?? '', name: name ?? '');
  }
}

class SpokenLanguages {
  String? englishName;
  String? name;

  SpokenLanguages({this.englishName, this.name});

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    englishName = json['english_name'];
    name = json['name'];
  }

  SpokenLanguages toEntity() {
    return SpokenLanguages(name: name ?? '');
  }
}
