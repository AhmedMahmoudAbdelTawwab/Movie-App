import 'package:injectable/injectable.dart';

import '../entities/recommended_entity.dart';
import '../repo/repository/recommended_repository.dart';

@injectable
class GetRecommendedSeriesUseCase {
  final RecommendedRepository repository;

  GetRecommendedSeriesUseCase(this.repository);

  Future<RecommendedEntity> call() async {
    return await repository.getRecommendedSeries();
  }
}
