import 'package:injectable/injectable.dart';
import '../api/recommend_api.dart';
import '../model/recommended_dto.dart';
import '../../domain/entities/recommended_entity.dart';
import '../../domain/repo/data_source/recommended_data_source.dart';
import '../../network/statess.dart';

@Injectable(as: RecommendedDataSource)
class RecommendedDataSourceImp implements RecommendedDataSource {
  final RecommendedApi _recommendedApi;
  RecommendedDataSourceImp(this._recommendedApi);
  @override
  Future<RecommendedEntity> getRecommendedSeries() async {
    final recommendedData = await _recommendedApi.getRecommended();

    if (recommendedData is SuccesApi<RecommendedDto>) {
      final recommendedDto = recommendedData.data!;
      final recommendedEntity = recommendedDto.toEntity();
      return recommendedEntity;
    } else if (recommendedData is ErrorApi<RecommendedDto>) {
      throw Exception(recommendedData.message);
    } else {
      throw Exception("unKnown Error");
    }
  }
}
