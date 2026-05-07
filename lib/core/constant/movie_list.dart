import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:movie_app/core/constant/card.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:movie_app/features/search/domain/entities/search_movie_entity.dart';
import 'package:movie_app/features/watchlist/domain/entities/watchlist_movie.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListOfMovies extends StatelessWidget {
  const ListOfMovies({super.key, required this.movie});

  final SearchMovieEntity movie;

  @override
  Widget build(BuildContext context) {
    final bool isSkeleton = Skeletonizer.maybeOf(context)?.enabled ?? false;
    final String year =
        movie.releaseDate.isNotEmpty && movie.releaseDate.length >= 4
        ? movie.releaseDate.substring(0, 4)
        : 'Unknown';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieCard(
          imagePath: movie.posterPath,
          movie: WatchlistMovie.fromSearchEntity(movie),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.primaryTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  if (!isSkeleton) ...[
                    const Icon(
                      CupertinoIcons.star,
                      color: AppColors.rateMovie,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                  ],
                  Text(
                    movie.voteAverage.toStringAsFixed(1),
                    style: const TextStyle(
                      color: AppColors.rateMovie,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  if (!isSkeleton) ...[
                    const Icon(
                      CupertinoIcons.film,
                      color: AppColors.infoMovie,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                  ],
                  Text(
                    movie.genre.isNotEmpty ? movie.genre : 'Unknown',
                    style: const TextStyle(
                      color: AppColors.infoMovie,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  if (!isSkeleton) ...[
                    const Icon(
                      CupertinoIcons.calendar,
                      color: AppColors.infoMovie,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                  ],
                  Text(
                    year,
                    style: const TextStyle(
                      color: AppColors.infoMovie,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  if (!isSkeleton) ...[
                    const Icon(
                      CupertinoIcons.time,
                      color: AppColors.infoMovie,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                  ],
                  Text(
                    movie.runtime > 0
                        ? '${movie.runtime} minutes'
                        : 'Unknown minutes',
                    style: const TextStyle(
                      color: AppColors.infoMovie,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
