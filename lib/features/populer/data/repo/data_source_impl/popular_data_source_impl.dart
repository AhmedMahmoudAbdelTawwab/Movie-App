import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/result_api.dart';
import '../../api/popullar_api.dart';
import '../../models/popular_responce_dto.dart';
import '../../../domain/entities/populer_entity.dart';
import '../../../domain/repositories/data_source/popular_data_source.dart';

@Injectable(as: PopularDataSource)
class PopularDataSourceImpl implements PopularDataSource {
  PopularDataSourceImpl(this._api);

  final PopularApi _api;

  @override
  Future<ResultApi<List<PopulerEntity>>> getPopularMovies() async {
    final ResultApi<PopularDto> result = await _api.getPopular();
    switch (result) {
      case Success<PopularDto>(data: final PopularDto dto):
        return Success<List<PopulerEntity>>(dto.toEntityList());

      case Failure<PopularDto>(
        message: final String msg,
        statusCode: final int? code,
      ):
        return Failure<List<PopulerEntity>>(message: msg, statusCode: code);
    }
  }
}
