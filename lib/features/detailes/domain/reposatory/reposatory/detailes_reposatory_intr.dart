import 'package:movie_app/features/detailes/domain/entites/detailes_entity.dart';

abstract interface class DetailsRepository {
  Future<DetailsEntity> getDetailsRepo(int movieId);
}
