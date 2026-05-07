import 'package:injectable/injectable.dart';
import 'package:movie_app/features/detailes/domain/entites/detailes_entity.dart';
import 'package:movie_app/features/detailes/domain/reposatory/reposatory/detailes_reposatory_intr.dart';

@injectable
class GetDetailsUseCase {
  final DetailsRepository detailsRepository;

  GetDetailsUseCase(this.detailsRepository);

  Future<DetailsEntity> call(int movieId) async {
    return detailsRepository.getDetailsRepo(movieId);
  }
}
