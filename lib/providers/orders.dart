import 'package:flutter/foundation.dart';
import '../urls.dart';
import './cart.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  final String authToken;
  final String userID;

  Orders(this.authToken, this.userID, this._orders);

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fetchAndSetOrders() async {
    try {
      final response =
          await http.get(ordersUrl + "$userID.json" + "?auth=$authToken");
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) return;
      final List<OrderItem> _tmpOrders = [];
      extractedData.forEach((orderID, orderData) {
        _tmpOrders.add(
          OrderItem(
            id: orderID,
            amount: orderData['amount'],
            dateTime: DateTime.parse(orderData['dateTime']),
            products: (orderData['products'] as List<dynamic>)
                .map(
                  (item) => CartItem(
                    id: item['id'],
                    price: item['price'],
                    quantity: item['quantity'],
                    title: item['title'],
                  ),
                )
                .toList(),
          ),
        );
      });
      _orders = _tmpOrders;
    } catch (error) {
      print(error);
    } finally {
      notifyListeners();
    }
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final datetime = DateTime.now();
    final response =
        await http.post(ordersUrl + "$userID.json" + "?auth=$authToken",
            body: json.encode({
              'amount': total,
              'dateTime': datetime.toIso8601String(),
              'products': cartProducts
                  .map((ct) => {
                        'id': ct.id,
                        'title': ct.title,
                        'quantity': ct.quantity,
                        'price': ct.price,
                      })
                  .toList(),
            }));
    _orders.insert(
      0,
      OrderItem(
        id: json.decode(response.body)['name'],
        amount: total,
        dateTime: datetime,
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
