import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../urls.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  Future<void> toggleFavoriteStatus(String _authToken, String userID) async {
    isFavorite = !isFavorite;
    try {
      await http.put(
        baseUrl + "userFavorites/$userID/$id.json?auth=$_authToken",
        body: json.encode(
          isFavorite,
        ),
      );
    } catch (error) {
      isFavorite = !isFavorite;
      print(error);
    } finally {
      notifyListeners();
    }
  }
}
