import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ptint/login/sized.dart';
import 'package:ptint/model/prodcut.dart';
import 'package:ptint/scroller/productCar.dart';
import 'package:ptint/veiwallproducts/viewall.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PopularProducts extends StatefulWidget {
  @override
  _PopularProductsState createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
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
  final String userAvatarUrl = 'url';
  final String addressID = 'addressID';
  final String totalAmount = 'totalAmount';
  final String productID = 'productIDs';
  final String paymentDetails = 'paymentDetails';
  final String orderTime = 'orderTime';
  final String isSuccess = 'isSuccess';
  @override
  Widget build(BuildContext context) {
    return Container(
        height: getProportionateScreenHeight(950),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenHeight(10)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenHeight(10)),
            child: textSelect(
                title: "تميزوا هذا الاسبوع",
                press: () {
                  Navigator.pushNamed(context, ViewAllPro.routeName);
                }),
          ),
          Flexible(child: _drawProducts()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: textSelect(
                title: "انضموا مؤخرا",
                press: () {
                  Navigator.pushNamed(context, ViewAllPro.routeName);
                }),
          ),
          Flexible(child: _drawroducts()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: textSelect(
                title: "متاحين ٢٤ ساعة",
                press: () {
                  Navigator.pushNamed(context, ViewAllPro.routeName);
                }),
          ),
          Flexible(child: _rawroducts()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: textSelect(
                title: "تجربة العملاء ",
                press: () {
                  Navigator.pushNamed(context, ViewAllPro.routeName);
                }),
          ),
          Flexible(child: _rawroducts())
        ]));
  }

  Widget _drawProducts() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('homeScreen1').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Center(
              child: CircularProgressIndicator(),
            );
          default:
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  //print("dddddddddddddd${sharedPreferences.getDouble("tot")}");
                  ItemModel model =
                      ItemModel.fromJson(snapshot.data.docs[index].data());
                  print(model.images);
                  return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(children: [
                        ProductCar(product: model),
                        // here by default width and height is 0
                      ]));
                });
        }
      },
    );
  }

  Widget _drawroducts() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('homeScreen2').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Center(
              child: CircularProgressIndicator(),
            );
          default:
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  ItemModel model =
                      ItemModel.fromJson(snapshot.data.docs[index].data());
                  print("aaaaaaaaaaaa${model.images}");
                  return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(children: [
                        ProductCar(product: model),
                        // here by default width and height is 0
                      ]));
                });
        }
      },
    );
  }

  Widget _rawroducts() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('homeScreen3').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Center(
              child: CircularProgressIndicator(),
            );
          default:
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  ItemModel model =
                      ItemModel.fromJson(snapshot.data.docs[index].data());
                  print("111111111111111111111111111aaaaa${model.images}");
                  return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(children: [
                        ProductCar(product: model),
                        // here by default width and height is 0
                      ]));
                });
        }
      },
    );
  }

  Widget textSelect({String title, Function press}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(16),
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            "المزيد",
            style: TextStyle(color: Color(0xFFBBBBBB)),
          ),
        ),
      ],
    );
  }
}
