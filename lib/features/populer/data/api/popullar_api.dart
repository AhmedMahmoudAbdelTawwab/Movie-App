import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/result_api.dart';

import '../models/popular_responce_dto.dart';

@injectable
class PopularApi {
  static const String apiKey = "9d7f94be913eddf2db40e317d2f12f36";
  static const String endPoint = "/3/movie/popular";
  static const String baseaseUrl = 'https://themoviedb.org';
  Future<ResultApi<PopularDto>> getPopular() async {
    final Uri url = Uri.parse('$baseaseUrl$endPoint?api_key=$apiKey');
    try {
      final http.Response response = await http.get(url);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final Map<String, dynamic> jsonMap =
            jsonDecode(response.body) as Map<String, dynamic>;
        final PopularDto dto = PopularDto.fromJson(jsonMap);
        return Success<PopularDto>(dto);
      } else {
        return Failure<PopularDto>(
          message: 'Failed to load popular movies: ${response.statusCode}',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return Failure<PopularDto>(message: 'Failed to load popular movies: $e');
    }
  }
}
