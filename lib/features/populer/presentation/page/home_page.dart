import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constant/card.dart';
import 'package:movie_app/core/constant/skelton_list.dart';
import 'package:movie_app/core/constant/service_locator.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:movie_app/features/watchlist/domain/entities/watchlist_movie.dart';
import '../bloc/popular/popular_bloc.dart';
import '../bloc/popular/popular_state.dart';

class PopulerSection extends StatelessWidget {
  const PopulerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PopularCubit>(
      create: (context) => getIt<PopularCubit>()..loadPopular(),
      child: BlocBuilder<PopularCubit, PopularState>(
        builder: (BuildContext context, PopularState state) {
          if (state is PopularLoading) {
            return const MovieSkeletonList(title: 'Popular');
          }

          if (state is PopularError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: AppColors.primaryTextColor),
              ),
            );
          }

          if (state is PopularLoaded) {
            final movies = state.movies;
            if (movies.isEmpty) {
              return const Center(
                child: Text(
                  'No  movies  found',
                  style: TextStyle(color: AppColors.primaryTextColor),
                ),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Popular',
                    style: TextStyle(
                      color: AppColors.primaryTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 220,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      final item = movies[index];
                      return MovieCard(
                        id: item.id,
                        imagePath: item.posterPath,
                        titleMovie: item.title,
                        movie: WatchlistMovie(
                          id: item.id,
                          title: item.title,
                          posterPath: item.posterPath,
                          releaseDate: item.releaseDate,
                          voteAverage: item.voteAverage,
                          genre: '',
                          runtime: 0,
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
