import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ptint/address/serclprogres.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ordercart.dart';

class MyOrders extends StatefulWidget {
  static String routeName = "/myOrders";
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  SharedPreferences sharedPreferences;
  User user;
  FirebaseFirestore firestore;

  String userCartList = 'userCart';
  String subCollectionAddress = 'userAddress';

  String userName = 'name';
  String userEmail = 'email';
  String userPhotoUrl = 'photoUrl';
  String userAvatarUrl = 'url';

  String addressID = 'addressID';
  String totalAmount = 'totalAmount';
  String productID = 'productIDs';
  String paymentDetails = 'paymentDetails';
  String orderTime = 'orderTime';
  String isSuccess = 'isSuccess';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
/*        drawer: MyDrawer(),*/
            appBar: AppBar(),
            body: StreamBuilder<QuerySnapshot>(
                /*  */
                stream: FirebaseFirestore.instance
                    .collection("Contents")
                    .doc(/* sharedPreferences.getString("") */)
                    .collection("offers")
                    .snapshots(),
                builder: (context, snapShots) {
                  return snapShots.hasData
                      ? ListView.builder(
                          itemCount: snapShots.data.docs.length,
                          itemBuilder: (context, index) {
                            return FutureBuilder<QuerySnapshot>(
                                future: FirebaseFirestore.instance
                                    .collection('all')
                                    .where('shortInfo',
                                        whereIn: snapShots.data.docs[index]
                                            .data()[productID])
                                    .get(),
                                builder: (context, snap) {
                                  return snap.hasData
                                      ? OrderCard(
                                          itemCount: snap.data.docs.length,
                                          data: snap.data.docs,
                                          orderId:
                                              snapShots.data.docs[index].id,
                                        )
                                      : Center(
                                          child: circularProgress(),
                                        );
                                });
                          })
                      : Center(child: circularProgress());
                })));
  }
}
