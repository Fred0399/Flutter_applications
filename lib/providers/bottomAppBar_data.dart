import 'package:flutter/cupertino.dart';

class Node with ChangeNotifier {
  final String url;
  bool isSelected;
  Node({this.url, this.isSelected = false});
  void selectElement() {
    isSelected = !isSelected;
    notifyListeners();
  }
}

class AppBarElements with ChangeNotifier {
  List<Node> _items = [
    Node(url: 'assets/images/planebottom.png'),
    Node(url: 'assets/images/hotelbottom.png', isSelected: true),
    Node(url: 'assets/images/tramvaibottom.png'),
    Node(url: 'assets/images/busbottom.png'),
    Node(url: 'assets/images/carbottom.png'),
    Node(url: 'assets/images/trainbottom.png'),
  ];

  List<Node> get items {
    return [..._items];
  }

  void selectElement(int index) {
    for (var i = 0; i < _items.length; i++) {
      if (i != index) {
        _items[i].isSelected = false;
      } else {
        _items[i].isSelected = true;
      }
    }
    notifyListeners();
  }
}
