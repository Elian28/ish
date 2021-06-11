import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:ptint/Screens/Home/hom.dart';
import 'package:ptint/address/AddressModel.dart';
import 'package:ptint/address/address.dart';
import 'package:ptint/address/serclprogres.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ordercart.dart';

String getOrderId = "";

class OrderDetails extends StatelessWidget {
  static const String appName = 'e-Shop';

  static SharedPreferences sharedPreferences;
  static User user;
  static FirebaseAuth auth;
  static FirebaseFirestore firestore;

  static String collectionUser = "users";
  static String collectionOrders = "orders";
  static String userCartList = 'userCart';
  static String subCollectionAddress = 'userAddress';

  static final String userName = 'name';
  static final String userEmail = 'email';
  static final String userPhotoUrl = 'photoUrl';
  static final String userUID = 'uid';
  static final String userAvatarUrl = 'url';

  static final String addressID = 'addressID';
  static final String totalAmount = 'totalAmount';
  static final String productID = 'productIDs';
  static final String paymentDetails = 'paymentDetails';
  static final String orderTime = 'orderTime';
  static final String isSuccess = 'isSuccess';

  final String orderId;

  const OrderDetails({Key key, this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getOrderId = orderId;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection(collectionUser)
                .doc(sharedPreferences.getString(userUID))
                .collection(collectionOrders)
                .doc(orderId)
                .get(),
            // ignore: missing_return
            builder: (context, snapShot) {
              Map dataMap;
              if (snapShot.hasData) {
                dataMap = snapShot.data.data();
                print(dataMap);
              }
              return snapShot.hasData
                  ? Container(
                      child: Column(
                        children: [
                          StatusBanner(
                            states: dataMap[isSuccess],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                r"QAR" + dataMap[totalAmount].toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text("Order Id : " + getOrderId),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              'Order It:' +
                                  DateFormat("dd MMMM , yyyy-hh:mm aa").format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          int.parse(dataMap['orderTime']))),
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ),
                          Divider(
                            height: 2.0,
                          ),
                          FutureBuilder<QuerySnapshot>(
                              future: firestore
                                  .collection('all')
                                  .where('shortInfo',
                                      whereIn: dataMap[productID])
                                  .getDocuments(),
                              // ignore: missing_return
                              builder: (context, dataSnapShot) {
                                return dataSnapShot.hasData
                                    ? OrderCard(
                                        itemCount:
                                            dataSnapShot.data.documents.length,
                                        data: dataSnapShot.data.documents,
                                      )
                                    : Center(
                                        child: circularProgress(),
                                      );
                              }),
                          Divider(
                            height: 10.0,
                          ),
                          Container(
                            child: FutureBuilder<DocumentSnapshot>(
                                future: firestore
                                    .collection(collectionUser)
                                    .document(
                                        sharedPreferences.getString(userUID))
                                    .collection(subCollectionAddress)
                                    .document(dataMap[addressID])
                                    .get(),
                                builder: (context, snap) {
                                  return snap.hasData
                                      ? ShippingDetails(
                                          model: AddressModel.fromJson(
                                              snap.data.data()),
                                        )
                                      : Center(
                                          child: circularProgress(),
                                        );
                                }),
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: circularProgress(),
                    );
            },
          ),
        ),
      ),
    );
  }
}

class StatusBanner extends StatelessWidget {
  final bool states;

  const StatusBanner({Key key, this.states}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String msg;
    IconData iconData;
    states ? iconData = Icons.done : iconData = Icons.cancel;
    states ? msg = 'Successful' : iconData = Icons.cancel;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.lightGreenAccent,
            Colors.pink,
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          /*    stops: [0, 1.0],
            tileMode: TileMode.clamp */
        ),
      ),
      height: 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => SystemNavigator.pop(),
            child: Icon(
              Icons.arrow_drop_down_circle,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "الطلب" + msg,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 2.0,
          ),
          CircleAvatar(
            backgroundColor: Colors.grey,
            child: Center(
              child: Icon(
                iconData,
                color: Colors.white,
                size: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShippingDetails extends StatelessWidget {
  //!
  final AddressModel model;

  const ShippingDetails({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Text(
            'تفاصيل الشحنة',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 90,
            vertical: 5,
          ),
          width: screenWidth,
          child: Table(
            children: [
              TableRow(
                children: [
                  KeyText(
                    mas: 'اسم المستلم',
                  ),
                  Text(model.name),
                ],
              ),
              TableRow(
                children: [
                  KeyText(
                    mas: 'رقم الهاتف',
                  ),
                  Text(model.phoneNumber),
                ],
              ),
              TableRow(
                children: [
                  KeyText(
                    mas: 'المنطقه',
                  ),
                  Text(model.city),
                ],
              ),
              TableRow(
                children: [
                  KeyText(
                    mas: 'الرمز البريد',
                  ),
                  Text(model.pincode),
                ],
              ),
              TableRow(
                children: [
                  KeyText(
                    mas: 'رقم الدار',
                  ),
                  Text(model.flatNumber),
                ],
              ),
              TableRow(
                children: [
                  KeyText(
                    mas: 'الشارع',
                  ),
                  Text(model.state),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: InkWell(
              onTap: () {
                confomUserDelet(context, getOrderId);
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.lightGreenAccent,
                      Colors.pink,
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    /*   stops: [0, 1.0],
                      tileMode: TileMode.clamp */
                  ),
                ),
                width: screenWidth - 40,
                height: 50.0,
                child: Center(
                  child: Text(
                    'تم استم الطلب',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  confomUserDelet(BuildContext context, String morder) {
    SharedPreferences sharedPreferences;

    String collectionUser = "users";
    String collectionOrders = "orders";

    final String userUID = 'uid';

    FirebaseFirestore.instance
        .collection(collectionUser)
        .doc(sharedPreferences.getString(userUID))
        .collection(collectionOrders)
        .doc(morder)
        .delete();
    getOrderId = "";
    Route route = MaterialPageRoute(builder: (c) => HomeScreen());
    Navigator.pushReplacement(context, route);
    Fluttertoast.showToast(msg: 'لقد تم استلم الطلب');
  }
}
