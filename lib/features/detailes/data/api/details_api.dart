import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/detailes_api_result.dart';
import 'package:movie_app/features/detailes/data/model/details_dto.dart';

@injectable
class DetailsApi {
  static const String apiKey = "9d7f94be913eddf2db40e317d2f12f36";
  static const String baseUrl = "https://api.themoviedb.org";
  static const String imageBaseUrl = "https://image.tmdb.org/t/p/";
  static const String posterSize = 'w500';

  Future<DetailsResultApi<DetailsDto>> getDetailsApi(int movieId) async {
    final String url = '$baseUrl/3/movie/$movieId?api_key=$apiKey';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        var json = jsonDecode(response.body);
        final detailsDto = DetailsDto.fromJson(json);
        return SuccessApi<DetailsDto>(data: detailsDto);
      } else {
        return ErrorApi<DetailsDto>(
          'Failed to fetch details: ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      return ErrorApi<DetailsDto>('Failed to fetch details: $e');
    }
  }
}
