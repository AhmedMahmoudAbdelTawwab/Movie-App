import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constant/movie_list.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:movie_app/core/utils/images.dart';
import 'package:movie_app/features/watchlist/presentation/bloc/watchlist_bloc.dart';
import 'package:movie_app/features/watchlist/presentation/bloc/watchlist_event.dart';
import 'package:movie_app/features/watchlist/presentation/bloc/watchlist_state.dart';

class WatchListHome extends StatelessWidget {
  static const String routeName = 'WatchListScreen';
  const WatchListHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: AppColors.backGroundColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (modalContext) {
                          return Container(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Clear Watchlist',
                                  style: TextStyle(
                                    color: AppColors.primaryTextColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'Are you sure you want to delete all movies from your watchlist?',
                                  style: TextStyle(color: AppColors.infoMovie),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextButton(
                                        onPressed: () =>
                                            Navigator.pop(modalContext),
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(
                                            color: AppColors.primaryTextColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          context.read<WatchlistBloc>().add(
                                            ClearWatchlistEvent(),
                                          );
                                          Navigator.pop(modalContext);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.redText,
                                          foregroundColor:
                                              AppColors.primaryTextColor,
                                        ),
                                        child: const Text('Delete All'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      CupertinoIcons.line_horizontal_3,
                      color: AppColors.infoMovie,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Watch List',
                      style: TextStyle(
                        color: AppColors.primaryTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<WatchlistBloc, WatchlistState>(
                builder: (context, state) {
                  if (state is WatchlistLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is WatchlistError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(
                          color: AppColors.primaryTextColor,
                        ),
                      ),
                    );
                  }
                  if (state is WatchlistLoaded) {
                    if (state.movies.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.emptyWatchListImage,
                              width: 120,
                              height: 120,
                            ),
                            const Text(
                              'There is no movie yet!',
                              style: TextStyle(
                                color: AppColors.primaryTextColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Find your movie by Type title,\n categories, years, etc ',
                              style: TextStyle(
                                color: AppColors.secoundryTextColor,
                                fontSize: 12,
                              ),
                              textAlign: .center,
                            ),
                          ],
                        ),
                      );
                    }
                    return ListView.separated(
                      padding: const EdgeInsets.only(bottom: 100),
                      itemCount: state.movies.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        return ListOfMovies(
                          movie: state.movies[index].toSearchEntity(),
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
