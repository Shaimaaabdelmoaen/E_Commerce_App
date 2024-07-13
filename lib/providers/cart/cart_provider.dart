import 'package:flutter/material.dart';
import 'package:flutter_app/models/card.dart';

class CartProvider with ChangeNotifier {
  final Cart _cart = Cart();

  Cart get cart => _cart;

  double get totalAmount {
    return _cart.totalAmount;
  }

  void addItem(String productId, String title, double price) {
    _cart.addItem(productId, title, price);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    _cart.removeSingleItem(productId);
    notifyListeners();
  }

  void removeItem(String productId) {
    _cart.removeItem(productId);
    notifyListeners();
  }

  void clear() {
    _cart.clear();
    notifyListeners();
  }
}
