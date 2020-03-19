import 'package:flutter/cupertino.dart';

class Node with ChangeNotifier {
  final String url;
  bool isSelected;
  final String route;
  Node({this.url, this.isSelected = false, this.route});
  // void selectElement() {
  //   isSelected = !isSelected;
  //   notifyListeners();
  // }
}

class AppBarElements with ChangeNotifier {
  List<Node> _items = [
    Node(url: 'assets/images/planebottom.png', route: 'plane'),
    Node(url: 'assets/images/hotelbottom.png', route: 'hotel'),
    Node(url: 'assets/images/tramvaibottom.png', route: 'holiday'),
    Node(url: 'assets/images/busbottom.png', route: 'bus'),
    Node(url: 'assets/images/carbottom.png', route: 'car'),
    Node(url: 'assets/images/trainbottom.png', route: 'train'),
  ];

  List<Node> get items {
    return [..._items];
  }

  void selectElement(String cont) {
    _items.where((val) {
      if (val.route == cont) {
        val.isSelected = true;
      } else {
        val.isSelected = false;
      }
      notifyListeners();
      return true;
    }).toList();
  }
}
