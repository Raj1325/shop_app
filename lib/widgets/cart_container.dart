import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/order_provider.dart';
import 'package:shop_app/widgets/cart_item_container.dart';

class CartItemsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);
    return Column(
      children: [
        Card(
          elevation: 10,
          margin: EdgeInsets.all(15),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Chip(
                  label: Text('${cart.totalAmount}'),
                  backgroundColor: Theme.of(context).accentColor,
                ),
                FlatButton(
                  onPressed: () {
                    Provider.of<Order>(context, listen: false)
                        .addOrders(cart.getItems());
                    cart.clear();
                  },
                  child: Text("Order Now"),
                  textColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (ctx, index) {
            return CartItemList(cart.getItemByIndex(index));
          },
          itemCount: cart.itemCount(),
        ))
      ],
    );
  }
}
