import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/http_exception.dart';
import './product.dart';
import '../urls.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];
  final _authToken;
  final _userID;
  Products(this._authToken, this._userID, this._items);

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> fetchAndSetProducts([bool filteruserById = false]) async {
    var filterString = "";
    if (filteruserById) {
      filterString = 'orderBy="creatorId"&equalTo="$_userID"';
    }
    try {
      final response =
          await http.get(productsUrl + "?auth=$_authToken&$filterString");
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final favorites = await http
          .get(baseUrl + "userFavorites/$_userID.json?auth=$_authToken");
      final responseFavs = json.decode(favorites.body);
      final List<Product> tmpList = [];
      extractedData.forEach((prodId, prodData) {
        tmpList.insert(
          0,
          Product(
            id: prodId,
            title: prodData['title'],
            description: prodData['description'],
            imageUrl: prodData['imageUrl'],
            price: prodData['price'],
            isFavorite:
                responseFavs == null ? false : responseFavs[prodId] ?? false,
          ),
        );
      });
      _items = tmpList;
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> addProduct(Product product) async {
    try {
      final response = await http.post(
        productsUrl + "?auth=$_authToken",
        body: json.encode(
          {
            'title': product.title,
            'description': product.description,
            'price': product.price,
            'imageUrl': product.imageUrl,
            'creatorId': _userID,
          },
        ),
      );
      final newProduct = Product(
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        id: json.decode(response.body)['name'],
      );
      _items.add(newProduct);
      // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      try {
        await http.patch(
          baseUrl + "products/$id.json" + "?auth=$_authToken",
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'price': newProduct.price,
            'imageUrl': newProduct.imageUrl,
          }),
        );
        _items[prodIndex] = newProduct;
        notifyListeners();
      } catch (error) {
        print(error);
      }
    } else {
      print('...');
    }
  }

  Future<void> deleteProduct(String id) async {
    final _existingItemIndex = _items.indexWhere((prod) => prod.id == id);
    final _existingItem = _items[_existingItemIndex];
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
    final response =
        await http.delete(baseUrl + "products/$id.json" + "?auth=$_authToken");
    if (response.statusCode >= 400) {
      _items.insert(_existingItemIndex, _existingItem);
      notifyListeners();
      throw HttpException("Deleting failed!");
    }
  }
}
