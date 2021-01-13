import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';

class CartItemList extends StatelessWidget {
  final CartItem cartItem;

  CartItemList(this.cartItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Dismissible(
        key: ValueKey(cartItem.id),
        background: Container(
          color: Theme.of(context).errorColor,
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(
            vertical: 4,
          ),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          Provider.of<Cart>(context, listen: false).removeItem(cartItem.id);
        },
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text("\$${cartItem.item.price * cartItem.quantity}"),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              title: Text("${cartItem.item.title}"),
              subtitle: Text("Price : ${cartItem.item.price}"),
              trailing: Text("Quantity : ${cartItem.quantity}"),
            ),
          ),
        ),
      ),
    );
  }
}
