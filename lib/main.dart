import 'package:flutter/material.dart';
import 'package:movie_app/bottom_nav_bar/bottom_nav_bar_widget.dart';

void main() {
  runApp(MovieApp());
}

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  int stackIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //  bottomNavigationBar: BottomNavBarWidget,
      ),
    );
  }
}
