import '../../entities/recommended_entity.dart';

abstract class RecommendedRepository {
  Future<RecommendedEntity> getRecommendedSeries();
}
