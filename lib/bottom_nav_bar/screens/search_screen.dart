import 'package:flutter/material.dart';
import 'package:movie_app/features/search/presentation/bloc/page/search_screen.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = 'SearchScreen';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchPage();
  }
}
