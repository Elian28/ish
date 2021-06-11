import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:ptint/address/address.dart';
import 'package:ptint/address/provider.dart';
import 'package:ptint/tools/totelamont.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../themePprovider.dart';
import 'botumcart.dart';

class CheckoutCard extends StatefulWidget {
  const CheckoutCard({
    Key key,
  }) : super(key: key);
  @override
  _CheckoutCardState createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  double totalAmount;
  TextEditingController _controller = TextEditingController();
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
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset("assets/icon/app@60x60x1.png"),
                  ),
                  Spacer(),
                  Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(),
                      child: TextFormField(
                        controller: _controller,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "أضف رمز القسيمة",
                            hintStyle: TextStyle(color: Colors.red)),
                      )),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: kTextColor,
                  ),
                ],
              ),
              SizedBox(height: 20),
              /*       Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer2<TotalAmount, CartItemCounter>(
                    builder: (context, amountProvider, cartProvider, c) {
                      return Text.rich(
                        TextSpan(
                          text: "مجموع:\n",
                          children: [
                            TextSpan(
                              text: sharedPreferences
                                          .getStringList(userCartList)
                                          .length ==
                                      1
                                  ? ""
                                  : "${amountProvider.total.toString()}",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 190,
                    child: DefaultButton(
                      text: "تمام الطلب",
                      press: () {
                        if (sharedPreferences
                                .getStringList(userCartList)
                                .length ==
                            1) {
                          Fluttertoast.showToast(msg: 'عربة التسوق فارغة');
                        } else {
                          Route route = MaterialPageRoute(
                              builder: (context) => Address(
                                    totalAmount:
                                        sharedPreferences.getDouble("tot"),
                                  ));
                          Navigator.push(context, route);
                        }
                      },
                    ),
                  ),
                ],
              ),
         */
            ],
          ),
        ),
      ),
    );
  }
}
