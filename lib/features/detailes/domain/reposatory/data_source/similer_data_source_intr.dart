import 'package:movie_app/features/detailes/domain/entites/similer_entity.dart';

abstract interface class SimilarDataSource {
  Future<SimilarEntity> getSimilarMovies(int id);
}
