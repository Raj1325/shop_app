import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/order_provider.dart';
import 'package:shop_app/providers/products_list_provider.dart';
import 'package:shop_app/screens/cart_details_screen.dart';
import 'package:shop_app/screens/order_details_screen.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/product_overview_screen.dart';

void main(List<String> args) {
  runApp(MyApp("Shop App"));
}

class MyApp extends StatelessWidget {
  final String title;
  MyApp(this.title);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => Order()),
      ],
      child: MaterialApp(
        title: this.title,
        theme: ThemeData(
          primaryColor: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.SCREEN: (ctx) => ProductDetailScreen(),
          CartDetailScreen.SCREEN: (ctx) => CartDetailScreen(),
          OrderDetailsScreen.SCREEN: (ctx) => OrderDetailsScreen(),
        },
      ),
    );
  }
}
