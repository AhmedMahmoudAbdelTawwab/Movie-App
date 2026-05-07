import '../../domain/entities/recommended_entity.dart';

sealed class RecommendedState {}

class RecommendedLoading extends RecommendedState {}

class RecommendedSuccess extends RecommendedState {
  final List<ResultsEntity> movies;
  RecommendedSuccess(this.movies);
}

class RecommendedError extends RecommendedState {
  final String message;
  RecommendedError(this.message);
}
