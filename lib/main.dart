import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:movie_app/bottom_nav_bar/screens/home_screen.dart';
import 'package:movie_app/bottom_nav_bar/screens/search_screen.dart';
import 'package:movie_app/bottom_nav_bar/screens/watch_screen.dart';
import 'package:movie_app/core/constant/service_locator.dart';
import 'package:movie_app/features/detailes/presentation/view/screens/detailes_screen.dart';
import 'package:movie_app/features/watchlist/presentation/bloc/watchlist_bloc.dart';
import 'package:movie_app/features/watchlist/presentation/bloc/watchlist_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    int pageindex = 0;
    return BlocProvider(
      create: (context) => getIt<WatchlistBloc>()..add(LoadWatchlistEvent()),
      child: MaterialApp(
        title: 'Cinema',
        home: Scaffold(
          body: IndexedStack(
            index: pageindex,
            children: [HomeScreen(), SearchScreen(), WatchListScreen()],
          ),
          bottomNavigationBar: BottomNavBarWidget(
            onTap: (index) {
              index = pageindex;
            },
            selectedIndex: pageindex,
          ),
        ),
        routes: {DetailsScreen.routeName: (context) => const DetailsScreen()},
      ),
    );
  }
}
