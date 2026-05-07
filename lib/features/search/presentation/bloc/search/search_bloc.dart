import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/result_api.dart';
import '../../../domain/entities/search_movie_entity.dart';
import '../../../domain/usecase/search_use_case.dart';

import 'search_event.dart';
import 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this._useCase) : super(SearchInitial()) {
    on<ExecuteSearch>(_onExecuteSearch);
    on<ClearSearch>(_onClearSearch);
  }

  final SearchUseCase _useCase;

  Future<void> _onExecuteSearch(
    ExecuteSearch event,
    Emitter<SearchState> emit,
  ) async {
    final String trimmed = event.query.trim();
    if (trimmed.isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());
    final ResultApi<List<SearchMovieEntity>> result = await _useCase.invoke(
      trimmed,
    );

    switch (result) {
      case Success<List<SearchMovieEntity>>(
        data: final List<SearchMovieEntity> movies,
      ):
        if (movies.isEmpty) {
          emit(SearchEmpty());
        } else {
          emit(SearchLoaded(movies));
        }
      case Failure<List<SearchMovieEntity>>(message: final String msg):
        emit(SearchError(msg));
    }
  }

  void _onClearSearch(ClearSearch event, Emitter<SearchState> emit) {
    emit(SearchInitial());
  }
}
