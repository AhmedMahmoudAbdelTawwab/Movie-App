import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/result_api.dart';
import '../../../domain/entities/populer_entity.dart';
import '../../../domain/usecase/popular_use_case.dart';

import 'popular_state.dart';

@injectable
class PopularCubit extends Cubit<PopularState> {
  PopularCubit(this._useCase) : super(PopularInitial());

  final PopularUseCase _useCase;

  Future<void> loadPopular() async {
    emit(PopularLoading());
    final ResultApi<List<PopulerEntity>> result = await _useCase.invoke();
    switch (result) {
      case Success<List<PopulerEntity>>(data: final movies):
        emit(PopularLoaded(movies));
      case Failure<List<PopulerEntity>>(message: final msg):
        emit(PopularError(msg));
    }
  }
}
