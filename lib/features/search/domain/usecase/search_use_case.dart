import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/result_api.dart';
import '../entities/search_movie_entity.dart';
import '../repositories/repo/search_repo.dart';

@injectable
class SearchUseCase {
  SearchUseCase(this._repo);

  final SearchRepo _repo;

  Future<ResultApi<List<SearchMovieEntity>>> invoke(String query) async {
    return _repo.searchMovies(query);
  }
}
