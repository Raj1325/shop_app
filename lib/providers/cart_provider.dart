import 'package:flutter/cupertino.dart';
import 'package:shop_app/providers/product.dart';

class CartItem {
  String id;
  Product item;
  int quantity;

  CartItem({this.id, this.item, this.quantity});
}

class Cart with ChangeNotifier {
  List<CartItem> _items = [];

  void addItem({Product product, int quantity = 1}) {
    _items.add(CartItem(
      id: DateTime.now().toString(),
      item: product,
      quantity: quantity,
    ));
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((cartItem) => cartItem.id == id);
    notifyListeners();
  }

  int itemCount() {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((cartItem) {
      total += cartItem.item.price * cartItem.quantity;
    });

    return total;
  }

  CartItem getItemByIndex(int index) {
    return _items[index];
  }
}
