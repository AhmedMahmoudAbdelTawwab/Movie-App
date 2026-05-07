import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movie_app/features/detailes/data/api/details_api.dart' as _i38;
import 'package:movie_app/features/detailes/data/api/similar_api.dart' as _i757;
import 'package:movie_app/features/detailes/data/reposatory/data_source/detailes_data_source_imp.dart'
    as _i533;
import 'package:movie_app/features/detailes/data/reposatory/data_source/similer_data_source_imp.dart'
    as _i956;
import 'package:movie_app/features/detailes/data/reposatory/reposatory/detailes_reposatory_imp.dart'
    as _i409;
import 'package:movie_app/features/detailes/data/reposatory/reposatory/similer_reposatory_imp.dart'
    as _i748;
import 'package:movie_app/features/detailes/domain/reposatory/data_source/detailes_data_source%20_intr.dart'
    as _i657;
import 'package:movie_app/features/detailes/domain/reposatory/data_source/similer_data_source_intr.dart'
    as _i473;
import 'package:movie_app/features/detailes/domain/reposatory/reposatory/detailes_reposatory_intr.dart'
    as _i91;
import 'package:movie_app/features/detailes/domain/reposatory/reposatory/similer_reposatory_intr.dart'
    as _i96;
import 'package:movie_app/features/detailes/domain/use_case/detailes_use_case.dart'
    as _i108;
import 'package:movie_app/features/detailes/domain/use_case/similer_use_case.dart'
    as _i600;
import 'package:movie_app/features/detailes/presentation/view_model/detailes/detailes_cubit.dart'
    as _i117;
import 'package:movie_app/features/detailes/presentation/view_model/similer/similer_cubit.dart'
    as _i165
    show SimilarCubit;
import 'package:movie_app/features/populer/data/api/popullar_api.dart' as _i235;
import 'package:movie_app/features/populer/data/repo/data_source_impl/popular_data_source_impl.dart'
    as _i255;
import 'package:movie_app/features/populer/data/repo/repository_impl/popular_repository_impl.dart'
    as _i519;
import 'package:movie_app/features/populer/domain/repositories/data_source/popular_data_source.dart'
    as _i38;
import 'package:movie_app/features/populer/domain/repositories/repo/popular_repo.dart'
    as _i12;
import 'package:movie_app/features/populer/domain/usecase/popular_use_case.dart'
    as _i670;
import 'package:movie_app/features/populer/presentation/bloc/popular/popular_bloc.dart'
    as _i455;
import 'package:movie_app/features/recommend/data/api/recommend_api.dart'
    as _i19;
import 'package:movie_app/features/recommend/data/data_source/recommended_data_source_imp.dart'
    as _i939;
import 'package:movie_app/features/recommend/data/repo/recommended_repository_imp.dart'
    as _i218;
import 'package:movie_app/features/recommend/domain/repo/data_source/recommended_data_source.dart'
    as _i1028;
import 'package:movie_app/features/recommend/domain/repo/repository/recommended_repository.dart'
    as _i700;
import 'package:movie_app/features/recommend/domain/use_case/get_recommended_use_case.dart'
    as _i139;
import 'package:movie_app/features/recommend/persentaion/view_model/recommended_cubit.dart'
    as _i307;
import 'package:movie_app/features/search/data/api/search_api.dart' as _i280;
import 'package:movie_app/features/search/data/repo/data_source_impl/search_data_source_impl.dart'
    as _i651;
import 'package:movie_app/features/search/data/repo/repository_impl/search_repository_impl.dart'
    as _i342;
import 'package:movie_app/features/search/domain/repositories/data_source/search_data_source.dart'
    as _i430;
import 'package:movie_app/features/search/domain/repositories/repo/search_repo.dart'
    as _i233;
import 'package:movie_app/features/search/domain/usecase/search_use_case.dart'
    as _i1040;
import 'package:movie_app/features/search/presentation/bloc/search/search_bloc.dart'
    as _i931;
import 'package:movie_app/features/watchlist/data/repositories/watchlist_repository.dart'
    as _i607;
import 'package:movie_app/features/watchlist/presentation/bloc/watchlist_bloc.dart'
    as _i684;

extension GetItInjectableX on _i174.GetIt {
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i38.DetailsApi>(() => _i38.DetailsApi());
    gh.factory<_i757.SimilarApi>(() => _i757.SimilarApi());
    gh.factory<_i235.PopularApi>(() => _i235.PopularApi());
    gh.factory<_i19.RecommendedApi>(() => _i19.RecommendedApi());
    gh.factory<_i280.SearchApi>(() => _i280.SearchApi());
    gh.lazySingleton<_i607.WatchlistRepository>(
      () => _i607.WatchlistRepository(),
    );
    gh.factory<_i430.SearchDataSource>(
      () => _i651.SearchDataSourceImpl(gh<_i280.SearchApi>()),
    );
    gh.factory<_i473.SimilarDataSource>(
      () => _i956.SimilarDataSourceImp(gh<_i757.SimilarApi>()),
    );
    gh.factory<_i38.PopularDataSource>(
      () => _i255.PopularDataSourceImpl(gh<_i235.PopularApi>()),
    );
    gh.factory<_i233.SearchRepo>(
      () => _i342.SearchRepositoryImpl(gh<_i430.SearchDataSource>()),
    );
    gh.factory<_i684.WatchlistBloc>(
      () => _i684.WatchlistBloc(gh<_i607.WatchlistRepository>()),
    );
    gh.factory<_i96.SimilarRepository>(
      () => _i748.SimilarRepositoryImp(gh<_i473.SimilarDataSource>()),
    );
    gh.factory<_i12.PopularRepo>(
      () => _i519.PopularRepositoryImpl(gh<_i38.PopularDataSource>()),
    );
    gh.factory<_i657.DetailsDataSource>(
      () => _i533.DetailsDataSourceImp(gh<_i38.DetailsApi>()),
    );
    gh.factory<_i1028.RecommendedDataSource>(
      () => _i939.RecommendedDataSourceImp(gh<_i19.RecommendedApi>()),
    );
    gh.factory<_i1040.SearchUseCase>(
      () => _i1040.SearchUseCase(gh<_i233.SearchRepo>()),
    );
    gh.factory<_i600.GetSimilarUseCase>(
      () => _i600.GetSimilarUseCase(gh<_i96.SimilarRepository>()),
    );
    gh.factory<_i91.DetailsRepository>(
      () => _i409.DetailsRepositoryImp(gh<_i657.DetailsDataSource>()),
    );
    gh.factory<_i670.PopularUseCase>(
      () => _i670.PopularUseCase(gh<_i12.PopularRepo>()),
    );
    gh.factory<_i931.SearchBloc>(
      () => _i931.SearchBloc(gh<_i1040.SearchUseCase>()),
    );
    gh.factory<_i455.PopularCubit>(
      () => _i455.PopularCubit(gh<_i670.PopularUseCase>()),
    );
    gh.factory<_i700.RecommendedRepository>(
      () => _i218.RecommendedRepositoryImp(gh<_i1028.RecommendedDataSource>()),
    );
    gh.factory<_i108.GetDetailsUseCase>(
      () => _i108.GetDetailsUseCase(gh<_i91.DetailsRepository>()),
    );
    gh.factory<_i165.SimilarCubit>(
      () => _i165.SimilarCubit(gh<_i600.GetSimilarUseCase>()),
    );
    gh.factory<_i117.DetailsCubit>(
      () => _i117.DetailsCubit(gh<_i108.GetDetailsUseCase>()),
    );
    gh.factory<_i139.GetRecommendedSeriesUseCase>(
      () =>
          _i139.GetRecommendedSeriesUseCase(gh<_i700.RecommendedRepository>()),
    );
    gh.factory<_i307.RecommendedCubit>(
      () => _i307.RecommendedCubit(gh<_i139.GetRecommendedSeriesUseCase>()),
    );
    return this;
  }
}

final getIt = _i174.GetIt.instance;

@_i526.InjectableInit()
void configureDependencies() => getIt.init();
