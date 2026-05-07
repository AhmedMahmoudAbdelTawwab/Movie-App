import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/use_case/get_recommended_use_case.dart';
import 'recommended_state.dart';

@injectable
class RecommendedCubit extends Cubit<RecommendedState> {
  final GetRecommendedSeriesUseCase _getRecommendedSeriesUseCase;
  RecommendedCubit(this._getRecommendedSeriesUseCase)
    : super(RecommendedLoading());

  Future<void> loadRecommended() async {
    await _getRecommendedSeries();
  }

  Future<void> intent(RecommendedEvent evant) async {
    if (evant is GetRecommended) {
      await _getRecommendedSeries();
    }
  }

  Future<void> _getRecommendedSeries() async {
    emit(RecommendedLoading());
    try {
      final result = await _getRecommendedSeriesUseCase.call();
      emit(RecommendedSuccess(result.results));
    } catch (e) {
      emit(RecommendedError("Error happened"));
    }
  }
}

sealed class RecommendedEvent {}

class GetRecommended extends RecommendedEvent {}
