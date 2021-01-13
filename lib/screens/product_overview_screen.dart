import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/screens/cart_details_screen.dart';
import 'package:shop_app/widgets/badge_icon_button.dart';
import 'package:shop_app/widgets/products_grid_container.dart';

enum PopUpMenuItems {
  FavouriteOnly,
  ShowAll,
}

class ProductsOverviewScreen extends StatefulWidget {
  static final SCREEN = "ProductsOverviewScreen";

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool showFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
        actions: [
          Consumer<Cart>(
            builder: (ctx, cart, ch) {
              return BadgeIcon(
                child: ch,
                quantity: cart.itemCount().toString(),
              );
            },
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, CartDetailScreen.SCREEN);
              },
            ),
          ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text(
                  "Only Favourite",
                ),
                value: PopUpMenuItems.FavouriteOnly,
              ),
              PopupMenuItem(
                child: Text(
                  "Show All",
                ),
                value: PopUpMenuItems.ShowAll,
              ),
            ],
            onSelected: (value) {
              setState(() {
                if (value == PopUpMenuItems.FavouriteOnly) {
                  this.showFav = true;
                } else {
                  this.showFav = false;
                }
              });
            },
          )
        ],
      ),
      body: ProductsGrid(showFav),
    );
  }
}
