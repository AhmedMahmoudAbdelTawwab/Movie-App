import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/detailes_api_result.dart';
import 'package:movie_app/features/detailes/data/api/details_api.dart';
import 'package:movie_app/features/detailes/data/model/details_dto.dart';
import 'package:movie_app/features/detailes/domain/entites/detailes_entity.dart';
import 'package:movie_app/features/detailes/domain/reposatory/data_source/detailes_data_source%20_intr.dart';

@Injectable(as: DetailsDataSource)
class DetailsDataSourceImp implements DetailsDataSource {
  DetailsApi detailsApi;
  DetailsDataSourceImp(this.detailsApi);
  @override
  Future<DetailsEntity> getDetailsMovie(int movieId) async {
    final result = await detailsApi.getDetailsApi(movieId);
    if (result is SuccessApi<DetailsDto>) {
      final detailsDto = result.data!;
      return detailsDto.toEntity();
    } else if (result is ErrorApi<DetailsDto>) {
      throw Exception(result.message);
    } else {
      throw Exception("Unknown error occurred");
    }
  }
}
