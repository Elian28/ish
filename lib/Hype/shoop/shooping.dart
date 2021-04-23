/* //
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data.dart';

class MarketingCart extends StatefulWidget {
  @override
  _MarketingCartState createState() => _MarketingCartState();
}

class _MarketingCartState extends State<MarketingCart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Scaffold(
          appBar: AppBar(
              //  title: Text("السعر [\RS ${cart._totaPrice}]"),
              ),
          body: cart.basketItems.length == 0
              ? Text("لم يتم الشراء")
              : ListView.builder(
                  itemCount: cart.basketItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Text(cart.basketItems[].title),
                        Text(cart.basketItems[index].quantity.toString()),
                        Text(cart.basketItems[index].index.toString()),
                        Text(cart.basketItems[index].price.toString()),
                        // Text(cart.basketItems[index].number.toString()),
                        InkWell(
                            onTap: () {
                              cart.remove(cart.basketItems[index]);
                            },
                            child: Icon(Icons.delete)),

                        /*        ListTile(
                          title: Text(cart.basketItems[index].title),
                          subtitle: Text(cart.basketItems[index].number),
                          trailing: InkWell(
                              onTap: () {
                                cart.remove(cart.basketItems[index]);
                              },
                              child: Icon(Icons.--0-delete)),
                        ), */
                      ],
                    );
                  },
                ),
        );
      },
    );
  }
}
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ptint/Hype/data.dart';
/* 
class MarketingCart extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String name;

  MarketingCart(this.id, this.productId, this.price, this.quantity, this.name);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(child: Text('\$$price')),
          ),
          title: Text(name),
          subtitle: Text('Total: \$${(price * quantity)}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
} */

class CartPdt extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String name;

  CartPdt(this.id, this.productId, this.price, this.quantity, this.name);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(child: Text('\$$price')),
          ),
          title: Text(name),
          subtitle: Text('Total: \$${(price * quantity)}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
