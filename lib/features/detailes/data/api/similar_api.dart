import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/similer_api_result.dart';
import 'package:movie_app/features/detailes/data/model/similer_dto.dart';

@injectable
class SimilarApi {
  static const String apiKey = "9d7f94be913eddf2db40e317d2f12f36";
  static const String baseUrl = "https://api.themoviedb.org";

  Future<SimilarApiResultStates<SimilarDto>> getSimilarApi(int id) async {
    final String url = '$baseUrl/3/movie/$id/similar?api_key=$apiKey';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        var json = jsonDecode(response.body);
        final similarDto = SimilarDto.fromJson(json);
        return SuccessSimilarApi<SimilarDto>(data: similarDto);
      } else {
        return ErrorSimilarApi<SimilarDto>(
          'Failed to fetch details: ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      return ErrorSimilarApi<SimilarDto>('Failed to fetch details: $e');
    }
  }
}
