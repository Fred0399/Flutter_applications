import 'package:flutter/foundation.dart';

class Choice {
  final String name;
  final int count;
  final String status;
  final double price;
  Choice({this.name, this.count, this.status, this.price});
}

class TravelChoices with ChangeNotifier {
  List<Choice> _items = [
    Choice(name: 'Lufthansa Airline', status: 'Onwards', count: 10, price: 500),
    Choice(name: 'Emirates Airline', status: 'Onwards', count: 9, price: 550),
    Choice(name: 'Air China', status: 'Onwards', count: 12, price: 580),
    Choice(name: 'FlyDubai', status: 'Onwards', count: 6, price: 590),
    Choice(name: 'Lufthansa Airline', status: 'Onwards', count: 10, price: 500),
    Choice(name: 'Emirates Airline', status: 'Onwards', count: 9, price: 550),
    Choice(name: 'Air China', status: 'Onwards', count: 12, price: 580),
    Choice(name: 'FlyDubai', status: 'Onwards', count: 6, price: 590),
    Choice(name: 'Lufthansa Airline', status: 'Onwards', count: 10, price: 500),
    Choice(name: 'Emirates Airline', status: 'Onwards', count: 9, price: 550),
    Choice(name: 'Air China', status: 'Onwards', count: 12, price: 580),
    Choice(name: 'FlyDubai', status: 'Onwards', count: 6, price: 590),
    Choice(name: 'Lufthansa Airline', status: 'Onwards', count: 10, price: 500),
    Choice(name: 'Emirates Airline', status: 'Onwards', count: 9, price: 550),
    Choice(name: 'Air China', status: 'Onwards', count: 12, price: 580),
    Choice(name: 'FlyDubai', status: 'Onwards', count: 6, price: 590),
  ];

  List<Choice> get items {
    return [..._items];
  }
}
