import 'package:injectable/injectable.dart';
import 'package:movie_app/features/detailes/domain/entites/similer_entity.dart';
import 'package:movie_app/features/detailes/domain/reposatory/reposatory/similer_reposatory_intr.dart';

@injectable
class GetSimilarUseCase {
  GetSimilarUseCase(this._similarRepository);
  final SimilarRepository _similarRepository;
  Future<SimilarEntity> call(int id) async {
    final similarResultUseCase = await _similarRepository.getSimilarRepo(id);
    return similarResultUseCase;
  }
}
