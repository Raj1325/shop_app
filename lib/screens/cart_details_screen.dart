import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/widgets/cart_container.dart';

class CartDetailScreen extends StatelessWidget {
  static final String SCREEN = "CartDetailScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Details"),
      ),
      body: Center(
        child: CartItemsContainer(),
      ),
    );
  }
}
