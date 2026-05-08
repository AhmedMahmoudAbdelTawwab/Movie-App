import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/core/constant/service_locator.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:movie_app/core/utils/images.dart';
import 'package:movie_app/features/detailes/presentation/view/screens/detailes_screen.dart';
import 'package:movie_app/features/detailes/presentation/view_model/detailes/detailes_cubit.dart';
import 'package:movie_app/features/watchlist/domain/entities/watchlist_movie.dart';
import 'package:movie_app/features/watchlist/presentation/bloc/watchlist_bloc.dart';
import 'package:movie_app/features/watchlist/presentation/bloc/watchlist_event.dart';
import 'package:movie_app/features/watchlist/presentation/bloc/watchlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    this.large = false,
    required this.imagePath,
    this.titleMovie,
    this.isWatchlisted,
    this.onWatchlistTap,
    this.movie,
    this.id,
  });
  final String imagePath;
  final String? titleMovie;
  final int? id;
  final bool large;
  final bool? isWatchlisted;
  final VoidCallback? onWatchlistTap;
  final WatchlistMovie? movie;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<DetailsCubit>()..loadDetails(id ?? movie?.id ?? 24428),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          DetailsScreen.routeName,
          arguments: id ?? movie?.id,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: large ? 150 : 120,
              height: large ? 225 : 180,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    Container(
                      color: AppColors.backGroundColor,
                      alignment: Alignment.center,
                      child: Skeletonizer.maybeOf(context)?.enabled ?? false
                          ? const SizedBox.shrink()
                          : Icon(
                              CupertinoIcons.film,
                              color: AppColors.secoundryColor,
                              size: large ? 40 : 30,
                            ),
                    ),
                    Image.network(
                      getPosterUrl(imagePath),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const SizedBox.shrink();
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppColors.backGroundColor,
                          child: Center(
                            child:
                                Skeletonizer.maybeOf(context)?.enabled ?? false
                                ? const SizedBox.shrink()
                                : Image.asset(
                                    AppImages.erorrImage,
                                    width: large ? 40 : 30,
                                  ),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () {
                          if (onWatchlistTap != null) {
                            onWatchlistTap!();
                          } else if (movie != null) {
                            context.read<WatchlistBloc>().add(
                              ToggleWatchlistEvent(movie!),
                            );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: AppColors.backGroundColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff000000),
                                blurRadius: 4,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: BlocBuilder<WatchlistBloc, WatchlistState>(
                            builder: (context, state) {
                              bool watchlisted = isWatchlisted ?? false;
                              if (state is WatchlistLoaded && movie != null) {
                                watchlisted = state.movies.any(
                                  (m) => m.id == movie!.id,
                                );
                              }
                              return Icon(
                                watchlisted
                                    ? CupertinoIcons.bookmark_fill
                                    : CupertinoIcons.bookmark,
                                color: watchlisted
                                    ? AppColors.primaryColor
                                    : AppColors.primaryTextColor,
                                size: large ? 24 : 20,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (titleMovie != null) ...[
              const SizedBox(height: 4),
              SizedBox(
                width: large ? 150 : 120,
                child: Text(
                  titleMovie!,
                  style: const TextStyle(
                    color: AppColors.infoMovie,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

String getPosterUrl(String? path) {
  String imageBaseUrl = 'https://image.tmdb.org/t/p/';
  String posterSize = 'w500';
  if (path == null || path.isEmpty) return '';
  if (path.startsWith('http')) return path;
  return '$imageBaseUrl$posterSize$path';
}
