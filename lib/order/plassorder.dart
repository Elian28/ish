import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:ptint/Screens/Home/hom.dart';
import 'package:ptint/address/provider.dart';
import 'package:ptint/home/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class PaymentPage extends StatefulWidget {
  final String addressId;
  final double totalAmount;

  PaymentPage({Key key, this.addressId, this.totalAmount}) : super(key: key);
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  SharedPreferences sharedPreferences;
  User user;
  FirebaseFirestore firestore;

  String collectionUser = "users";
  String collectionOrders = "orders";
  String userCartList = 'userCart';
  String subCollectionAddress = 'userAddress';

  final String userName = 'name';
  final String userEmail = 'email';
  final String userPhotoUrl = 'photoUrl';
  final String userUID = 'uid';
  final String userAvatarUrl = 'url';

  final String addressID = 'addressID';
  final String totalAmount = 'totalAmount';
  final String productID = 'productIDs';
  final String paymentDetails = 'paymentDetails';
  final String orderTime = 'orderTime';
  final String isSuccess = 'isSuccess';
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightGreenAccent,
              Colors.pink,
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            /*      stops: [0, 1.0],
              tileMode: TileMode.clamp) */
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.asset('images/cash.png'),
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                onPressed: () => addOrderData(),
                textColor: Colors.white,
                splashColor: Colors.deepOrange,
                color: Colors.pink,
                padding: EdgeInsets.all(8),
                child: Text(
                  'Place Order',
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  addOrderData() {
    writeOrderDetailsForUser({
      addressID: widget.addressId,
      totalAmount: widget.totalAmount,
      'orderBy': sharedPreferences.getString(userUID),
      productID: sharedPreferences.getStringList(userCartList),
      paymentDetails: 'Cash  on Delivery',
      orderTime: DateTime.now().microsecond.toString(),
      isSuccess: true,
    });
    writeOrderDetailsForAdmin({
      addressID: widget.addressId,
      totalAmount: widget.totalAmount,
      'orderBy': sharedPreferences.getString(userUID),
      productID: sharedPreferences.getStringList(userCartList),
      paymentDetails: 'Cash  on Delivery',
      orderTime: DateTime.now().hour.toString(),
      isSuccess: true,
    }).whenComplete(() {
      emptyCartNew();
    });
  }

  emptyCartNew() {
    sharedPreferences.setStringList(userCartList, ['garbageValue']);
    List tempList = sharedPreferences.getStringList(userCartList);
    firestore
        .collection(collectionUser)
        .doc(sharedPreferences.getString(userUID))
        .update({
      userCartList: tempList,
    }).then((value) {
      sharedPreferences.setStringList(userCartList, tempList);
      Provider.of<CartItemCounter>(context, listen: false).displayedResult();
      Fluttertoast.showToast(
          msg: 'Congratulations your order has been successfully');
      Route route = MaterialPageRoute(builder: (context) => HomeScreen());
      Navigator.pushReplacement(context, route);
    }).catchError((error) {});
  }

  // ignore: missing_return
  Future writeOrderDetailsForUser(Map<String, dynamic> data) async {
    await firestore
        .collection(collectionUser)
        .doc(sharedPreferences.getString(userUID))
        .collection(collectionOrders)
        .doc(sharedPreferences.getString(userUID) + data['orderTime'])
        .set(data);
  }

  Future writeOrderDetailsForAdmin(Map<String, dynamic> data) async {
    await firestore
        .collection(collectionOrders)
        .doc(sharedPreferences.getString(userUID) + data['orderTime'])
        .set(data);
  }
}
