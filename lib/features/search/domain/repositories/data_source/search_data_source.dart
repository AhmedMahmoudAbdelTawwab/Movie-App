import 'package:movie_app/core/network/result_api.dart';

import '../../entities/search_movie_entity.dart';

abstract class SearchDataSource {
  Future<ResultApi<List<SearchMovieEntity>>> searchMovies(String query);
}
