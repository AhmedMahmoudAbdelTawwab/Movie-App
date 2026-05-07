import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constant/movie_list.dart';
import 'package:movie_app/core/constant/service_locator.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:movie_app/core/utils/images.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../domain/entities/search_movie_entity.dart';
import '../search/search_bloc.dart';
import '../search/search_event.dart';
import '../search/search_state.dart';

class SearchPage extends StatefulWidget {
  static const String routeName = 'SearchPage';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (_) => getIt<SearchBloc>(),
      child: Builder(
        builder: (BuildContext context) {
          return SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    style: const TextStyle(color: AppColors.primaryTextColor),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: const TextStyle(color: AppColors.infoMovie),
                      filled: true,
                      fillColor: AppColors.secoundryColor,
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: AppColors.infoMovie,
                        ),
                        onPressed: () {
                          context.read<SearchBloc>().add(
                            ExecuteSearch(_controller.text),
                          );
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    textInputAction: TextInputAction.search,
                    onChanged: (String value) {
                      context.read<SearchBloc>().add(ExecuteSearch(value));
                    },
                    onSubmitted: (String value) {
                      context.read<SearchBloc>().add(ExecuteSearch(value));
                    },
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: BlocBuilder<SearchBloc, SearchState>(
                      builder: (BuildContext context, SearchState state) {
                        final bool isLoading = state is SearchLoading;
                        final List<SearchMovieEntity> movies =
                            state is SearchLoaded
                            ? state.movies
                            : List.generate(
                                5,
                                (index) => SearchMovieEntity(
                                  id: index,
                                  title: 'Loading Movie Title',
                                  posterPath: '',
                                  releaseDate: '2024',
                                  voteAverage: 8.5,
                                  genre: 'Action',
                                  runtime: 120,
                                ),
                              );

                        if (state is SearchInitial) {
                          return const _SearchEmptyView();
                        }

                        if (state is SearchError) {
                          return Center(
                            child: Text(
                              state.message,
                              style: const TextStyle(
                                color: AppColors.primaryTextColor,
                              ),
                            ),
                          );
                        }

                        if (state is SearchEmpty ||
                            (movies.isEmpty && !isLoading)) {
                          return const _SearchEmptyView();
                        }

                        return SkeletonizerConfig(
                          data: const SkeletonizerConfigData(
                            effect: ShimmerEffect(
                              baseColor: Color(0xFF0A0A0A),
                              highlightColor: Color(0xFF1A1A1A),
                            ),
                          ),
                          child: Skeletonizer(
                            enabled: isLoading,
                            child: ListView.separated(
                              padding: const EdgeInsets.only(bottom: 100),
                              itemCount: movies.length,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(height: 16),
                              itemBuilder: (BuildContext context, int index) {
                                return ListOfMovies(movie: movies[index]);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SearchEmptyView extends StatelessWidget {
  const _SearchEmptyView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.emptySearchImage, width: 160, height: 160),
          const SizedBox(height: 16),
          const Text(
            'We are sorry, we can not find the movie :(',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Find your movie by type title, categories, years, etc.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.infoMovie, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
