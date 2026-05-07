import 'package:injectable/injectable.dart';
import 'package:movie_app/features/detailes/domain/entites/detailes_entity.dart';
import 'package:movie_app/features/detailes/domain/reposatory/data_source/detailes_data_source%20_intr.dart';
import 'package:movie_app/features/detailes/domain/reposatory/reposatory/detailes_reposatory_intr.dart';

@Injectable(as: DetailsRepository)
class DetailsRepositoryImp implements DetailsRepository {
  DetailsDataSource detailsDataSource;
  DetailsRepositoryImp(this.detailsDataSource);
  @override
  Future<DetailsEntity> getDetailsRepo(int movieId) async {
    final resultt = await detailsDataSource.getDetailsMovie(movieId);
    return resultt;
  }
}
