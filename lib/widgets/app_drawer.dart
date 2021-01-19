import 'package:flutter/material.dart';
import 'package:shop_app/screens/order_details_screen.dart';
import 'package:shop_app/screens/product_overview_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("Welcome"),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            title: Text("Shop"),
            leading: Icon(Icons.shop),
            onTap: () => Navigator.of(context).pushReplacementNamed("/"),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text("Orders"),
            leading: Icon(Icons.shopping_bag),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(OrderDetailsScreen.SCREEN),
          ),
        ],
      ),
    );
  }
}
