import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ptint/themes/LightColor.dart';

import '../3/AppData.dart';
import '../themes/AppTheme.dart';
import '../themes/TitleText.dart';

//السلةة

class DemandCartPage extends StatelessWidget {
  Widget _cartItems() {
    return Column(children: AppData.cartList.map((x) => _item(x)).toList());
  }

  Widget _item(Product model) {
    return Row(children: <Widget>[
/*       FlatButton(
          child: Text("submit"),
          onPressed: () {
            FirebaseFirestore.instance.collection('OrderDetails').add({
              'Customer': "userName",
              "address": "controller.text",
              "mobile": "mobileNumber",
              "Grand Total": "getTotals", //  #<--here the total goes...
              "Time": DateTime.now(),
              //  "Item": FieldValue.arrayUnion(yourItemList),
            });
          }), */

      //
      Expanded(
          child: ListTile(
              title:
                  TEXT(txt: model.title, size: 15, fontWeight: FontWeight.w700),
              subtitle: Row(children: <Widget>[
                TEXT(
                  txt: '\$ ',
                  color: LightColor.titleTextColor,
                  size: 12,
                ),
                TEXT(txt: model.price.toString(), size: 14)
              ]),
              trailing: Container(
                  width: 35,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: LightColor.lightGrey.withAlpha(150),
                      borderRadius: BorderRadius.circular(10)),
                  child: TEXT(txt: 'x${model.id}', size: 12)),
              leading: AspectRatio(
                  aspectRatio: 1.2,
                  child: Stack(children: <Widget>[
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                            height: 70,
                            width: 70,
                            child: Stack(children: <Widget>[
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: LightColor.lightGrey,
                                          borderRadius:
                                              BorderRadius.circular(10))))
                            ]))),
                    Positioned(
                      left: -20,
                      bottom: -20,
                      child: Image.asset(model.image),
                    )
                  ]))))
    ]);
  }

  Widget _price() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TEXT(
            txt: '${AppData.cartList.length} Items',
            color: LightColor.grey,
            size: 14,
            fontWeight: FontWeight.w500,
          ),
          TEXT(txt: '\$${getPrice()}', size: 18)
        ]);
  }

  double getPrice() {
    double price = 0;
    AppData.cartList.forEach((x) {
      price += x.price * x.id;
    });
    return price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: AppTheme.padding,
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              _cartItems(),
              Divider(
                thickness: 1,
                height: 70,
              ),
              _price(),
              SizedBox(height: 30)
            ]))));
  }
}
