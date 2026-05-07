import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import '../model/recommended_dto.dart';
import '../../network/statess.dart';

@injectable
class RecommendedApi {
  static const String apiKey = "9d7f94be913eddf2db40e317d2f12f36";
  static const String baseUrl = "https://api.themoviedb.or";

  Future<RecommendedResultApi<RecommendedDto>> getRecommended() async {
    try {
      Uri url = Uri.parse('$baseUrl?api_key=$apiKey');

      var response = await http.get(url);
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        var json = jsonDecode(response.body);
        var recommendedApi = RecommendedDto.fromJson(json);
        return SuccesApi<RecommendedDto>(data: recommendedApi);
      } else {
        print("status code is the reason");
        return ErrorApi<RecommendedDto>("Error happend");
      }
    } catch (e) {
      print(e);
      return ErrorApi<RecommendedDto>(e.toString());
    }
  }
}
