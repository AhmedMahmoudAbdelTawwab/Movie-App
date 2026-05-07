import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/features/detailes/domain/use_case/similer_use_case.dart';
import 'package:movie_app/features/detailes/presentation/view_model/similer/similer_state.dart';

@injectable
class SimilarCubit extends Cubit<SimilarStates> {
  GetSimilarUseCase getSimilarUseCase;

  SimilarCubit(this.getSimilarUseCase) : super(SimilarLoading());

  Future<void> loadSimilarMovies(int id, SimilarEvents event) async {
    emit(SimilarLoading());

    try {
      if (event is GetSimilarMovies) {
        final res = await getSimilarUseCase.call(id);

        emit(SimilarSuccess(res.results));
      }
    } on Exception catch (e) {
      emit(SimilarError(e.toString()));
    }
  }
}

sealed class SimilarEvents {}

class GetSimilarMovies extends SimilarEvents {}
