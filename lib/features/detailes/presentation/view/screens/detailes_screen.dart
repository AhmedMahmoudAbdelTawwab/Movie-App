import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constant/card.dart';
import 'package:movie_app/core/constant/service_locator.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:movie_app/features/detailes/presentation/view_model/detailes/detailes_cubit.dart';
import 'package:movie_app/features/detailes/presentation/view_model/detailes/detailes_state.dart';
import 'package:movie_app/features/detailes/presentation/view_model/similer/similer_cubit.dart';
import 'package:movie_app/features/detailes/presentation/view_model/similer/similer_state.dart';
import 'package:movie_app/features/watchlist/domain/entities/watchlist_movie.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = 'DetailsScreen';
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/';
  static const String dropSize = 'w1280';
  static const String posterSize = 'w500';

  @override
  Widget build(BuildContext context) {
    final int args =
        (ModalRoute.of(context)?.settings.arguments as int?) ?? 24428;
    return BlocProvider(
      create: (context) => getIt<DetailsCubit>()..loadDetails(args),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.infoMovie),
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: Text(
            "Detail",
            style: TextStyle(
              color: AppColors.infoMovie,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        body: BlocBuilder<DetailsCubit, DetailsStates>(
          builder: (context, state) {
            if (state is DetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is DetailsSuccess) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.network(
                          "$imageBaseUrl$dropSize${state.movies.backdropPath}",
                          height: 400,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.secoundryTextColor,
                            ),
                            height: 35,
                            width: 70,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.star,
                                  color: AppColors.rateMovie,
                                ),
                                Text(
                                  "${state.movies.voteAverage.toStringAsFixed(1)}",
                                  style: TextStyle(color: AppColors.infoMovie),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 30,
                          bottom: -75,
                          child: Row(
                            children: [
                              Container(
                                height: 170,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Image.network(
                                  "$imageBaseUrl$posterSize${state.movies.posterPath}",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 150, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              state.movies.title,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColors.infoMovie,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo',
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton.icon(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => Container(
                                  height: 300,
                                  decoration: BoxDecoration(
                                    color: AppColors.backGroundColor,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Center(child: Text("Comming Soon")),
                                ),
                              );
                            },
                            icon: const Icon(
                              CupertinoIcons.play_circle_fill,
                              size: 20,
                            ),
                            label: const Text(
                              "مشاهدة",
                              style: TextStyle(fontFamily: 'Cairo'),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.rateMovie,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildInfoItem(
                            CupertinoIcons.calendar,
                            state.movies.releaseDate,
                          ),
                          const Text(
                            "|",
                            style: TextStyle(color: AppColors.secoundryColor),
                          ),
                          _buildInfoItem(
                            CupertinoIcons.time,
                            "${state.movies.runtime} Minutes",
                          ),
                          const Text(
                            "|",
                            style: TextStyle(
                              color: AppColors.secoundryTextColor,
                            ),
                          ),
                          _buildInfoItem(
                            CupertinoIcons.ticket,
                            state.movies.genres.isNotEmpty
                                ? state.movies.genres.first.name
                                : 'N/A',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15, left: 12, right: 12),
                      child: Column(
                        children: [
                          Text(
                            state.movies.overview,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: AppColors.infoMovie),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: BlocProvider(
                              create: (context) => getIt<SimilarCubit>()
                                ..loadSimilarMovies(args, GetSimilarMovies()),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: .topLeft,
                                    child: Text(
                                      "similar",
                                      style: TextStyle(
                                        color: AppColors.infoMovie,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  BlocBuilder<SimilarCubit, SimilarStates>(
                                    builder: (context, state) {
                                      if (state is SimilarLoading) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      if (state is SimilarSuccess) {
                                        final similarMovies =
                                            state.similarEntity;
                                        return SizedBox(
                                          height: 220,
                                          child: ListView.separated(
                                            scrollDirection: Axis.horizontal,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                            ),
                                            itemCount: similarMovies.length,
                                            separatorBuilder:
                                                (context, index) =>
                                                    const SizedBox(width: 12),
                                            itemBuilder: (context, index) {
                                              final movie =
                                                  similarMovies[index];
                                              return MovieCard(
                                                imagePath: movie.posterPath,
                                                titleMovie: movie.title,
                                                id: movie.id,
                                                movie: WatchlistMovie(
                                                  id: movie.id,
                                                  title: movie.title,
                                                  posterPath: movie.posterPath,
                                                  releaseDate:
                                                      movie.releaseDate,
                                                  voteAverage:
                                                      movie.voteAverage,
                                                  genre: "",
                                                  runtime: 0,
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      }
                                      if (state is SimilarError) {
                                        return Center(
                                          child: Text(
                                            state.message,
                                            style: const TextStyle(
                                              color: AppColors.infoMovie,
                                            ),
                                          ),
                                        );
                                      }
                                      return const SizedBox();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is DetailsError) {
              return Text(
                state.message,
                style: TextStyle(color: Color(0xFFFFFFFF)),
              );
            } else {
              return Text(
                "Error happend",
                style: TextStyle(color: Color(0xFFFFFFFF)),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.infoMovie, size: 16),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: AppColors.infoMovie, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
