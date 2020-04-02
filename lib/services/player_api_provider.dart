import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/api_models.dart';
import '../urls.dart';

class PlayerApiProvider {
  Future<List<Players>> fetchPlayersByCountry(String countryID) async {
    final response = await http.get(baseUrl + "country=" + countryID);
    return parseResponse(response);
  }

  Future<List<Players>> fetchPlayersByName(String name) async {
    final response = await http.get(baseUrl + "name=" + name);
    return parseResponse(response);
  }

  List<Players> parseResponse(http.Response response) {
    if (response.statusCode >= 400) {
      throw Exception('Failed to load players');
    } else {
      final result = jsonDecode(response.body);
      return ApiResult.fromJson(result).items;
    }
  }
}
