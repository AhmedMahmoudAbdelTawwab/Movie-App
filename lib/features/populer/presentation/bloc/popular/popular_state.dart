import '../../../domain/entities/populer_entity.dart';

abstract class PopularState {
  @override
  List<Object?> get props => <Object?>[];
}

class PopularInitial extends PopularState {}

class PopularLoading extends PopularState {}

class PopularLoaded extends PopularState {
  PopularLoaded(this.movies);

  final List<PopulerEntity> movies;

  @override
  List<Object?> get props => <Object?>[movies];
}

class PopularError extends PopularState {
  PopularError(this.message);

  final String message;

  @override
  List<Object?> get props => <Object?>[message];
}
