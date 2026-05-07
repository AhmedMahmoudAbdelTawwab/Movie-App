import 'package:injectable/injectable.dart';

import '../../domain/entities/recommended_entity.dart';
import '../../domain/repo/data_source/recommended_data_source.dart';
import '../../domain/repo/repository/recommended_repository.dart';

@Injectable(as: RecommendedRepository)
class RecommendedRepositoryImp implements RecommendedRepository {
  final RecommendedDataSource _recommendedDataSource;
  RecommendedRepositoryImp(this._recommendedDataSource);
  @override
  Future<RecommendedEntity> getRecommendedSeries() {
    return _recommendedDataSource.getRecommendedSeries();
  }
}
