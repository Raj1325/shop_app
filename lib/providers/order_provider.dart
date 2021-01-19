import 'package:flutter/foundation.dart';
import 'package:shop_app/providers/cart_provider.dart';

class Order with ChangeNotifier {
  List<CartItem> _products = [];

  Order();

  List<CartItem> get products {
    return [..._products];
  }

  int get totalItems {
    return _products.length;
  }

  void addOrders(List<CartItem> orders) {
    this._products = orders;
  }
}
