import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/features/detailes/domain/use_case/detailes_use_case.dart';
import 'package:movie_app/features/detailes/presentation/view_model/detailes/detailes_state.dart';

@injectable
class DetailsCubit extends Cubit<DetailsStates> {
  final GetDetailsUseCase _getDetailsUseCase;
  DetailsCubit(this._getDetailsUseCase) : super(DetailsLoading());
  Future<void> loadDetails(int movieId) async {
    emit(DetailsLoading());
    try {
      final res = await _getDetailsUseCase.call(movieId);
      emit(DetailsSuccess(res));
    } catch (e) {
      emit(DetailsError(e.toString()));
    }
  }
}
