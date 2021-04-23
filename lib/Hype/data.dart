import 'package:flutter/material.dart';

class Item {
  final String id;

  final String title;
  final double price;
  final int quantity;

  //final String number;
  final String img;
  final int index;
  final Function() ontap;
  Item(
      {this.id,
      this.img,
      //this.number,
      this.index,
      this.ontap,
      this.title,
      this.price,
      this.quantity});
}

/* //!
class Cart extends ChangeNotifier {
  List<Item> _items = [];
  double _totaPrice = 0.0;

  void add(Item items) {
    _items.add(items);
    _totaPrice += items.price;
    notifyListeners();
  }

  void remove(Item items) {
    _totaPrice -= items.price;
    _items.remove(items);
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totaPrice {
    return totaPrice;
  }

  List<Item> get basketItems {
    return _items;
  }
} */

//

class Cart with ChangeNotifier {
  Map<String, Item> _items = {};

  Map<String, Item> get items {
    return {..._items};
  }

  int get basketItems {
    return _items.length;
  }

  void add(String pdtid, String name, double price) {
    if (_items.containsKey(pdtid)) {
      _items.update(
          pdtid,
          (existingCartItem) => Item(
              id: DateTime.now().toString(),
              title: existingCartItem.title,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price));
    } else {
      _items.putIfAbsent(
          pdtid,
          () => Item(
                title: name,
                id: DateTime.now().toString(),
                quantity: 1,
                price: price,
              ));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if (!_items.containsKey(id)) {
      return;
    }
    if (_items[id].quantity > 1) {
      _items.update(
          id,
          (existingCartItem) => Item(
              id: DateTime.now().toString(),
              title: existingCartItem.title,
              quantity: existingCartItem.quantity - 1,
              price: existingCartItem.price));
    }
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
