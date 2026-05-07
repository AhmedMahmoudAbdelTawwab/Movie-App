import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/result_api.dart';
import '../../../domain/entities/search_movie_entity.dart';
import '../../../domain/repositories/data_source/search_data_source.dart';
import '../../../domain/repositories/repo/search_repo.dart';

@Injectable(as: SearchRepo)
class SearchRepositoryImpl implements SearchRepo {
  SearchRepositoryImpl(this._dataSource);

  final SearchDataSource _dataSource;

  @override
  Future<ResultApi<List<SearchMovieEntity>>> searchMovies(String query) async {
    return _dataSource.searchMovies(query);
  }
}
