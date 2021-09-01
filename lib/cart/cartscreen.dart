import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ptint/address/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bodycartscreen.dart';
import 'botemonev.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      //body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    SharedPreferences sharedPreferences;
    String userCartList = 'userCart';
    return AppBar(
      title: Column(
        children: [
          Text(
            "عربتك",
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                height: 1),
          ),
/*           Consumer<CartItemCounter>(builder: (context, counter, _) {
            return Text(
              " منتج ${sharedPreferences.getStringList(userCartList).length - 1}",
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  height: 1),
            );
          }), */
        ],
      ),
    );
  }
}
