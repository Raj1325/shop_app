import 'package:flutter/foundation.dart';
import 'package:shop_app/dummyData/dummy_data.dart';
import 'package:shop_app/providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _productsList = DUMMY_PRODUCTS;

  List<Product> get productList {
    return [..._productsList];
  }

  void add(Product newProduct) {
    _productsList.add(newProduct);
    notifyListeners();
  }

  Product findByID(String id) {
    return _productsList.firstWhere((element) => element.id == id);
  }

  List<Product> get favItems {
    return _productsList.where((element) => element.isFavourite).toList();
  }
}
