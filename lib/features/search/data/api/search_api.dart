import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/result_api.dart';
import '../models/search_movie_dto.dart';

@injectable
class SearchApi {
  static const String baseUrl = 'https://api.themoviedb.org';
  static const String apiKey = '9d7f94be913eddf2db40e317d2f12f36';

  Future<ResultApi<SearchMoviesDto>> searchMovies(String query) async {
    final Uri url = Uri.parse('$baseUrl/search/movie').replace(
      queryParameters: <String, String>{'api_key': apiKey, 'query': query},
    );

    try {
      final http.Response response = await http.get(url);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final Map<String, dynamic> jsonMap =
            jsonDecode(response.body) as Map<String, dynamic>;
        final SearchMoviesDto dto = SearchMoviesDto.fromJson(jsonMap);
        return Success<SearchMoviesDto>(dto);
      } else {
        return Failure<SearchMoviesDto>(
          message: 'Failed to search movies: ${response.statusCode}',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return Failure<SearchMoviesDto>(message: 'Failed to search movies: $e');
    }
  }

  Future<ResultApi<MovieDetailsDto>> getMovieDetails(int id) async {
    final Uri url = Uri.parse(
      '$baseUrl/movie/$id',
    ).replace(queryParameters: <String, String>{'api_key': apiKey});

    try {
      final http.Response response = await http.get(url);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final Map<String, dynamic> jsonMap =
            jsonDecode(response.body) as Map<String, dynamic>;
        final MovieDetailsDto dto = MovieDetailsDto.fromJson(jsonMap);
        return Success<MovieDetailsDto>(dto);
      } else {
        return Failure<MovieDetailsDto>(
          message: 'Failed to load movie details: ${response.statusCode}',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return Failure<MovieDetailsDto>(
        message: 'Failed to load movie details: $e',
      );
    }
  }
}
