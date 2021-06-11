import 'package:ptint/3/EducationalService.dart';
import 'package:ptint/3/app.dart';
import 'package:ptint/Books2/Bookas.dart';
import 'package:ptint/Hype/Cards/cart.dart';

import 'package:ptint/themes/AppTheme.dart';
import 'package:ptint/themes/LightColor.dart';
import 'package:ptint/yes/ListUsers.dart';

import 'package:flutter/material.dart';
import 'package:ptint/7/u2.dart';

import 'PrintAdvertising.dart';
import 'PrintCompanies.dart';
import 'PrintRestaurants.dart';
import 'printBags.dart';

class ArrayHome extends StatefulWidget {
  @override
  _ArrayHomeState createState() => _ArrayHomeState();
}

class _ArrayHomeState extends State<ArrayHome> {
  List list = [
    'التصميم',
    'الطباعة',
    // "لوحات فنية"
    "الخدمة التعليمية",
    "حراج الكتب",
    "القرطاسيات",
    "كروت ",
    "مطبوعات الشركات",
    "مطبوعات المطاعم",
    "مطبوعات دعاية",
    "اكياس والشنط",
  ];
  List img = [
    "assets/icon/app@60x60x1.png",
    "assets/icon/app@60x60x1.png",
    "assets/icon/app@60x60x1.png",
    "assets/icon/app@60x60x1.png",
    "assets/icon/app@60x60x1.png",
    "assets/icon/app@60x60x1.png",
    "assets/icon/app@60x60x1.png",
    "assets/icon/app@60x60x1.png",
    "assets/icon/app@60x60x1.png",
    "assets/icon/app@60x60x1.png",
    //  "assets/icon/app@60x60x1.png",
  ];
  List<Widget> onTap = [
    UploadFile(),
    UploadFile(),
    EducationalService(),
    Booksa(),
    ListUsers(),
    Carts(),
    PrintCompanies(),
    PrintRestaurants(),
    PrintAdvertising(),
    PrintBags()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: AppDrawer1(),
        appBar: AppBar(
          elevation: 0,
          title: _search(),
        ),
        body: viewbook());
  }

  Widget viewbook() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                  elevation: 0,
                  child: Stack(children: <Widget>[
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                                  padding: EdgeInsets.all(9),
                                  /*    decoration: BoxDecoration(
                                   color: LightColor.titleTextColor,
                                   borderRadius: BorderRadius.circular(24)), */
                                  child: Image.asset(img[index],
                                      width: AppTheme.fullWidth(context),
                                      height: AppTheme.fullHeight(context),
                                      fit: BoxFit.fill))),
                          /*  Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: 9 / 4),
                          child: Text(
                            // products is out demo list
                            list[index].toString(),
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                         Text(
                              document["price"].toString() ,
                             style: TextStyle(fontWeight: FontWeight.bold),
                           ) */
                          Row(children: <Widget>[
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: list[index].toString().toString(),
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              TextSpan(
                                  text: "   ",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold))
                            ])),
                            SizedBox(width: 3)
                          ])
                        ]),
                    //8
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => onTap[index]));
                        },
                        /*onTap: () {
                           Navigator.of(context).push(MaterialPageRoute(
                               builder: (BuildContext context) =>
                                   DoctorsInfo(
                                     idBook: snapshot.data.docs[index].id,
                                     authorName:
                                         snapshot.data.docs[index].data()["authorName"],
                                   )));},*/
                        child: Container(
                            width: 150,
                            margin: EdgeInsets.only(right: 16),
                            padding:
                                EdgeInsets.only(top: 16, right: 16, left: 16),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[])))
                  ]));
            }));
  }

  //البحث
  Widget _search() {
    return Container(
        margin: AppTheme.padding,
        child: Row(children: <Widget>[
          Expanded(
              child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: LightColor.lightGrey.withAlpha(100),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: InkWell(
                      onTap: () {
                        //  startSearch();
                      },
                      child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "المنتج بالاسم او الكود ",
                              hintStyle: TextStyle(fontSize: 12),
                              contentPadding: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 0, top: 5),
                              prefixIcon: Icon(Icons.search,
                                  color: Colors.black54)))))),
          SizedBox(width: 20)
          /*
          InkWell( onTap: () {},
            child: InkWell(
                  onTap: _showPopupMenu,
                  child: _icon(Icons.filter_list, color: Colors.black54)))
                   */
        ]));
  }
}
