/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ptint/model/prodcut.dart';
import 'package:ptint/tools/totelamont.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cart.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double totalAmount;
  @override
  void initState() {
    super.initState();
    totalAmount = 0;
    Provider.of<TotalAmount>(context, listen: false).disPley(0);
  }

//
  String appName = 'e-Shop';

  SharedPreferences sharedPreferences;
  User user;
  FirebaseFirestore firestore;

  String collectionUser = "users";
  String collectionOrders = "orders";
  String userCartList = 'userCart';
  String subCollectionAddress = 'userAddress';

  String userName = 'name';
  String userEmail = 'email';
  String userPhotoUrl = 'photoUrl';
  String userAvatarUrl = 'url';

  String addressID = 'addressID';
  String productID = 'productIDs';
  String paymentDetails = 'paymentDetails';
  String orderTime = 'orderTime';
  String isSuccess = 'isSuccess';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: StreamBuilder<QuerySnapshot>(
          stream: firestore
              .collection('all')
              .where('shortInfo',
                  whereIn: sharedPreferences.getStringList(userCartList))
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return new Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      ItemModel mode =
                          ItemModel.fromJson(snapshot.data.docs[index].data());
                      if (index == 0) {
                        totalAmount = 0;
                        totalAmount = mode.price + totalAmount;
                      } else {
                        totalAmount = mode.price + totalAmount;
                      }
                      if (snapshot.data.docs.length - 1 == index) {
                        WidgetsBinding.instance.addPostFrameCallback((t) {
                          sharedPreferences.setDouble("tot", totalAmount);
                          Provider.of<TotalAmount>(context, listen: false)
                              .disPley(totalAmount);
                        });
                      }
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: CartCard(cart: mode),
                      );
                    });
            }
          }),
    );
  }

  beginbuilng() {
    return Center(
      child: SliverToBoxAdapter(
        child: Card(
          color: Theme.of(context).primaryColor.withOpacity(0.5),
          child: Container(
            height: 100.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.insert_emoticon,
                  color: Colors.white,
                ),
                Text('Cart is empty .'),
                Text('Start adding items to your Cart '),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 */
