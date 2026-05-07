import 'package:movie_app/core/network/result_api.dart';

import '../../entities/populer_entity.dart';

abstract class PopularDataSource {
  Future<ResultApi<List<PopulerEntity>>> getPopularMovies();
}
