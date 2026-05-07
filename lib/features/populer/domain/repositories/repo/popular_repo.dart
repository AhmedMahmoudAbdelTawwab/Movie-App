import 'package:movie_app/core/network/result_api.dart';

import '../../entities/populer_entity.dart';

abstract class PopularRepo {
  Future<ResultApi<List<PopulerEntity>>> getPopularMovies();
}
