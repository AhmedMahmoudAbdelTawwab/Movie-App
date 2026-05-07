import 'package:movie_app/features/detailes/domain/entites/similer_entity.dart';

abstract interface class SimilarRepository {
  Future<SimilarEntity> getSimilarRepo(int id);
}
