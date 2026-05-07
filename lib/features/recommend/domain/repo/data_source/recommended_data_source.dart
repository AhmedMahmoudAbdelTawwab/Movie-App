import '../../entities/recommended_entity.dart';

abstract class RecommendedDataSource {
  Future<RecommendedEntity> getRecommendedSeries();
}
