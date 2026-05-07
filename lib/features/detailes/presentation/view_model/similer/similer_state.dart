import 'package:movie_app/features/detailes/domain/entites/similer_entity.dart';

sealed class SimilarStates {}

class SimilarLoading extends SimilarStates {}

class SimilarSuccess extends SimilarStates {
  SimilarSuccess(this.similarEntity);

  List<SimilarMovieEntity> similarEntity;
}

class SimilarError extends SimilarStates {
  final String message;
  SimilarError(this.message);
}
