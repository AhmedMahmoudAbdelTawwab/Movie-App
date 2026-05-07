import 'package:movie_app/features/detailes/domain/entites/detailes_entity.dart';

abstract interface class DetailsDataSource {
  Future<DetailsEntity> getDetailsMovie(int movieId);
}
