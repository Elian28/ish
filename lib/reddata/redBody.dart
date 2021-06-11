import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:ptint/address/provider.dart';
import 'package:ptint/login/sized.dart';
import 'package:ptint/model/prodcut.dart';
import 'package:ptint/reddata/selsctcolore.dart';
import 'package:ptint/reddata/topreadbody.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'botum.dart';
import 'dielogradebody.dart';
import 'imageread.dart';

class ReadData extends StatefulWidget {
  final ItemModel product;
  final bool them;
  const ReadData({Key key, @required this.product, this.them})
      : super(key: key);

  @override
  _ReadDataState createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  bool stet = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: widget.product),
          TopRoundedContainer(
            color: widget.them ? Colors.white : Color(0xFF16242e),
            child: Column(
              children: [
                ProductDescription(
                  stet: stet,
                  product: widget.product,
                  pressOnSeeMore: () {
                    setState(() {
                      stet = stet ? false : true;
                    });
                    if (stet == true) {
                      Fluttertoast.showToast(msg: "لقد تم اضافة تقيمك");
                    } else {
                      Fluttertoast.showToast(msg: "لقد تم حذف التقيم");
                    }
                    print("dddddddsdsd");
                  },
                ),
                TopRoundedContainer(
                  color: widget.them ? Color(0xFFF6F7F9) : Color(0xFF26242e),
                  child: Column(
                    children: [
                      ColorDots(product: widget.product),
                      TopRoundedContainer(
                        color: widget.them ? Colors.white : Color(0xFF16242e),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.15,
                            right: MediaQuery.of(context).size.width * 0.15,
                            bottom: getProportionateScreenWidth(40),
                            top: getProportionateScreenWidth(15),
                          ),
                          child: DefaultButton(
                            text: "أضف إلى السلة",
                            press: () {
                              checkItemInCart(
                                  widget.product.description, context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static const String appName = 'e-Shop';

  static SharedPreferences sharedPreferences;

  static String collectionUser = "users";
  static String userCartList = 'userCart';

  var idUser = FirebaseAuth.instance.currentUser;

  void checkItemInCart(String productID, BuildContext context) {
    sharedPreferences.getStringList(userCartList).contains(productID)
        ? Fluttertoast.showToast(msg: 'هذه المنتج تم اضافة مسبقا في السلة')
        : addItemTotheCart(productID, context);
  }

  addItemTotheCart(String productID, BuildContext context) {
    List teampCartList = sharedPreferences.getStringList(userCartList);
    teampCartList.add(productID);
    var firebaseUser = FirebaseAuth.instance;

    if (firebaseUser.currentUser == null) {
      FirebaseFirestore.instance
          .collection(collectionUser)
          .doc(sharedPreferences.getString(idUser.uid))
          .update({'userCart': teampCartList}).then((v) async {
        Fluttertoast.showToast(msg: 'تم اضافة المنتج بنجاح');
        sharedPreferences.setStringList(userCartList, teampCartList);
        // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
        Provider.of<CartItemCounter>(context, listen: false).displayedResult();
        setState(() {});
      });
    }
  }
}
