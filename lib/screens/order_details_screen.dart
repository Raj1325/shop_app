import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/order_provider.dart';
import 'package:shop_app/widgets/app_drawer.dart';

class OrderDetailsScreen extends StatefulWidget {
  static final String SCREEN = "OrderDetailsScreen";
  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final Order orders = Provider.of<Order>(context);
    final List<CartItem> purchases = orders.products;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Order Details"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.shopping_bag,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                "Order",
                style: TextStyle(fontSize: 20),
              ),
              trailing: IconButton(
                icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    this.isExpanded = !this.isExpanded;
                  });
                },
              ),
            ),
            if (isExpanded)
              Expanded(
                  child: ListView.builder(
                      itemCount: orders.totalItems,
                      itemBuilder: (ctx, index) {
                        return Card(
                          margin: EdgeInsets.all(10),
                          child: ListTile(
                            title: Text(
                              "${purchases[index].item.title}",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).primaryColor),
                            ),
                            trailing: Text(
                              "${purchases[index].quantity}x${purchases[index].item.price}",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).accentColor),
                            ),
                          ),
                        );
                      }))
          ],
        ),
      ),
    );
  }
}
