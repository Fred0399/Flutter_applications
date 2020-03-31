import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/api_models.dart';
import '../urls.dart';

class PlayerApiProvider {
  Future<List<Players>> fetchPlayersByCountry(String countryID) async {
    final response = await http.get(baseUrl + "country=" + countryID);

    if (response.statusCode >= 400) {
      throw Exception('Failed to load players');
    } else {
      final result = jsonDecode(response.body);
      return ApiResult.fromJson(result).items;
    }
  }
}
