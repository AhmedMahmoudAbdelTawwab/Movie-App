import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/result_api.dart';
import '../entities/populer_entity.dart';
import '../repositories/repo/popular_repo.dart';

@injectable
class PopularUseCase {
  PopularUseCase(this._repo);

  final PopularRepo _repo;

  Future<ResultApi<List<PopulerEntity>>> invoke() async {
    return _repo.getPopularMovies();
  }
}
