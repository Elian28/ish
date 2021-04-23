import 'dart:math';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:collection/collection.dart';
import 'package:provider/provider.dart';
import 'package:ptint/themes/LightColor.dart';

class Product {
  String name;
  int price;
  bool isCheck;
  Product({this.name, this.price, this.isCheck});
}

class Cart extends ChangeNotifier {
  List<Product> _items = [];
  double _totaPrice = 0.0;

  void add(Product items) {
    _items.add(items);
    _totaPrice += items.price;
    notifyListeners();
  }

  List<Product> get basketItems {
    return _items;
  }
}

class HomeProduct extends StatelessWidget {
  List<Product> items = List.generate(100, (i) {
    return Product(
        name: 'Product $i', price: Random().nextInt(5000), isCheck: false);
  });

  @override
  Widget build(BuildContext context) {
    ShoppingCart cart = ShoppingCart.of(context);
    return StatefulBuilder(builder: (context, StateSetter setState) {
      return Scaffold(
          appBar: AppBar(
              elevation: 0,
              title: Text('Shopping Cart'),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                      child: Badge(
                    badgeColor: LightColor.iconColor,
                    badgeContent: Text(
                      '${cart.providers.length}',
                      style: TextStyle(color: Colors.white),
                    ),
                    child: IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => CartDet()));
                        }),
                  )),
                )
              ]),
          body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, i) {
                return Card(
                    child: ListTile(
                        title: Row(children: <Widget>[
                          Expanded(child: Text(items[i].name)),
                          Checkbox(
                            value: items[i].isCheck,
                            onChanged: (bool value) {
                              setState(() {
                                items[i].isCheck = !items[i].isCheck;
                                if (items[i].isCheck) {
                                  cart.providers.add(items[i]);
                                } else {
                                  cart.providers.remove(items[i]);
                                }
                              });
                            },
                          )
                        ]),
                        subtitle: Text(items[i].price.toString() + "Rs")));
              }));
    });
  }
}

class CartDet extends StatefulWidget {
  @override
  _CartDetState createState() => _CartDetState();
}

class _CartDetState extends State<CartDet> {
  @override
  Widget build(BuildContext context) {
    var cart = ShoppingCart.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("السعر [\RS ${cart.providers}]"),
      ),
      body: ListView.builder(
        itemCount: cart.providers.length,
        itemBuilder: (BuildContext context, int i) {
          return ListTile(
            title: Text(cart.providers[i].name),
            subtitle: Text(cart.providers[i].price.toString()),
            trailing: InkWell(
                onTap: () {
                  setState(() {
                    cart.providers[i].isCheck = !cart.providers[i].isCheck;
                    if (cart.providers[i].isCheck) {
                      cart.providers.remove(cart.providers[i]);
                    }
                  });
                },
                child: Icon(Icons.delete)),
          );
        },
      ),
      /* Center( */
      /* child: Text("${cart.providers.length}  selected", */
      /*   style: Theme.of(context).textTheme.display1)) */
    );
  }
}

class ShoppingCart extends InheritedWidget {
  List<Product> providers = [];
  Widget child;
  ShoppingCart({this.child});
  @override
  bool updateShouldNotify(ShoppingCart oldWidget) {
    return !IterableEquality().equals(providers, oldWidget.providers);
  }

  static ShoppingCart of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();
}
