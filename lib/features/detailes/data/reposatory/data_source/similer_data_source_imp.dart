import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/similer_api_result.dart';
import 'package:movie_app/features/detailes/data/api/similar_api.dart';
import 'package:movie_app/features/detailes/data/model/similer_dto.dart';
import 'package:movie_app/features/detailes/domain/entites/similer_entity.dart';
import 'package:movie_app/features/detailes/domain/reposatory/data_source/similer_data_source_intr.dart';

@Injectable(as: SimilarDataSource)
class SimilarDataSourceImp implements SimilarDataSource {
  SimilarDataSourceImp(this._similarApi);
  SimilarApi _similarApi;
  @override
  Future<SimilarEntity> getSimilarMovies(int id) async {
    final dataSourceResult = await _similarApi.getSimilarApi(id);
    if (dataSourceResult is SuccessSimilarApi<SimilarDto>) {
      final dataSourceResultEntity = dataSourceResult.data!.toEntity();
      return dataSourceResultEntity;
    }
    if (dataSourceResult is ErrorSimilarApi<SimilarDto>) {
      throw Exception(dataSourceResult.message);
    }
    throw Exception("unkown error occured");
  }
}
