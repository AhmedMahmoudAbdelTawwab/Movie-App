import 'package:movie_app/features/detailes/domain/entites/detailes_entity.dart';

sealed class DetailsStates<DetailsEntity> {}

class DetailsLoading extends DetailsStates<DetailsEntity> {}

class DetailsSuccess extends DetailsStates<DetailsEntity> {
  final DetailsEntity movies;
  DetailsSuccess(this.movies);
}

class DetailsError extends DetailsStates<DetailsEntity> {
  final String message;
  DetailsError(this.message);
}
