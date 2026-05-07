import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/result_api.dart';
import '../../../domain/entities/populer_entity.dart';
import '../../../domain/repositories/data_source/popular_data_source.dart';
import '../../../domain/repositories/repo/popular_repo.dart';

@Injectable(as: PopularRepo)
class PopularRepositoryImpl implements PopularRepo {
  PopularRepositoryImpl(this._dataSource);

  final PopularDataSource _dataSource;

  @override
  Future<ResultApi<List<PopulerEntity>>> getPopularMovies() async =>
      await _dataSource.getPopularMovies();
}
