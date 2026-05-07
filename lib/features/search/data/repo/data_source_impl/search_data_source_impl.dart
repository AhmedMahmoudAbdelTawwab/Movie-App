import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/result_api.dart';
import '../../api/search_api.dart';
import '../../models/search_movie_dto.dart';
import '../../../domain/entities/search_movie_entity.dart';
import '../../../domain/repositories/data_source/search_data_source.dart';

@Injectable(as: SearchDataSource)
class SearchDataSourceImpl implements SearchDataSource {
  SearchDataSourceImpl(this._api);

  final SearchApi _api;

  @override
  Future<ResultApi<List<SearchMovieEntity>>> searchMovies(String query) async {
    final ResultApi<SearchMoviesDto> result = await _api.searchMovies(query);
    switch (result) {
      case Success<SearchMoviesDto>(data: final SearchMoviesDto dto):
        final List<SearchMovieEntity> entities = dto.toEntityList();
        final List<SearchMovieEntity> enriched =
            await Future<List<SearchMovieEntity>>.value(
              Future.wait<SearchMovieEntity>(
                entities.map((SearchMovieEntity e) async {
                  final ResultApi<MovieDetailsDto> detailsResult = await _api
                      .getMovieDetails(e.id);
                  switch (detailsResult) {
                    case Success<MovieDetailsDto>(
                      data: final MovieDetailsDto details,
                    ):
                      final List<String> genres = details.genres ?? <String>[];
                      return SearchMovieEntity(
                        id: e.id,
                        title: e.title,
                        overview: e.overview,
                        posterPath: e.posterPath,
                        releaseDate: e.releaseDate,
                        voteAverage: e.voteAverage,
                        voteCount: e.voteCount,
                        originalLanguage: e.originalLanguage,
                        genre: genres.isNotEmpty ? genres.first : '',
                        runtime: details.runtime ?? 0,
                      );
                    case Failure<MovieDetailsDto>():
                      return e;
                  }
                }),
              ),
            );
        return Success<List<SearchMovieEntity>>(enriched);
      case Failure<SearchMoviesDto>(
        message: final String msg,
        statusCode: final int? code,
      ):
        return Failure<List<SearchMovieEntity>>(message: msg, statusCode: code);
    }
  }
}
