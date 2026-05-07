import 'package:injectable/injectable.dart';
import 'package:movie_app/features/detailes/domain/entites/similer_entity.dart';
import 'package:movie_app/features/detailes/domain/reposatory/data_source/similer_data_source_intr.dart';
import 'package:movie_app/features/detailes/domain/reposatory/reposatory/similer_reposatory_intr.dart';

@Injectable(as: SimilarRepository)
class SimilarRepositoryImp implements SimilarRepository {
  SimilarDataSource _similarDataSource;
  SimilarRepositoryImp(this._similarDataSource);
  @override
  Future<SimilarEntity> getSimilarRepo(int id) async {
    final repoResult = await _similarDataSource.getSimilarMovies(id);
    return repoResult;
  }
}
