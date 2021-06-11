import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:ptint/Screens/Home/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../AddressModel.dart';
import '../provider.dart';

class PaymentPage extends StatefulWidget {
  final String addressId;
  final double totalAmount;
  final AddressModel model;
  PaymentPage({Key key, this.addressId, this.totalAmount, this.model})
      : super(key: key);
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String productId = DateTime.now().microsecondsSinceEpoch.toString();
  String appName = 'e-Shop';

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
  var idUser = FirebaseAuth.instance.currentUser;
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.asset('assets/asset/m100.png'),
              ),
              SizedBox(
                height: 10.0,
              ),
              InkWell(
                onTap: () => addOrderData(),
                child: Container(
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      'ارسال الطلب',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
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
      totalAmount: sharedPreferences.getDouble("tot"),
      'orderBy': sharedPreferences.getString(idUser.uid),
      productID: sharedPreferences.getStringList(userCartList),
      orderTime: DateTime.now().microsecond.toString(),
    });
    writeOrderDetailsForAdmin({
      totalAmount: widget.totalAmount.toString(),
      'orderBy': sharedPreferences.getString(idUser.uid),
      productID: sharedPreferences.getStringList(userCartList),
      orderTime: DateTime.now().hour.toString(),
      "dele": productId,
      "state": widget.model.state,
      "homeId": widget.model.flatNumber,
      "pincode": widget.model.pincode,
      "ctey": widget.model.city,
      "phone": widget.model.phoneNumber,
      "name": widget.model.name,
      "email": sharedPreferences.getString(userEmail),
      "cont":
          sharedPreferences.getStringList(userCartList.toString()).length - 1,
    }).whenComplete(() {
      emptyCartNew();
    });
  }

  emptyCartNew() {
    sharedPreferences.setStringList(userCartList, ['garbageValue']);
    List tempList = sharedPreferences.getStringList(userCartList);
    firestore
        .collection(collectionUser)
        .doc(sharedPreferences.getString(idUser.uid))
        .update({
      userCartList: tempList,
    }).then((value) {
      sharedPreferences.setStringList(userCartList, tempList);
      Provider.of<CartItemCounter>(context, listen: false).displayedResult();
      Fluttertoast.showToast(msg: 'لقد تم ارسال طلبك بنجاح سوف ');
      Route route = MaterialPageRoute(builder: (context) => HomeScreen100());
      Navigator.pushReplacement(context, route);
    }).catchError((error) {});
  }

  // ignore: missing_return
  Future writeOrderDetailsForUser(Map<String, dynamic> data) async {
    await firestore
        .collection(collectionUser)
        .doc(sharedPreferences.getString(idUser.uid))
        .collection(collectionOrders)
        .doc(sharedPreferences.getString(idUser.uid) + data['orderTime'])
        .set(data);
  }

  Future writeOrderDetailsForAdmin(Map<String, dynamic> data) async {
    await firestore.collection(collectionOrders).doc(productId).set(data);
  }
}
