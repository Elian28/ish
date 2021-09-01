/* // ignore: must_be_immutable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'bookData.dart';

class DoctorsInfo extends StatefulWidget {
  DoctorsInfo({this.idBook, this.authorName});
  String idBook;
  String authorName;
  var category;
  @override
  _DoctorsInfoState createState() => _DoctorsInfoState();
}

class _DoctorsInfoState extends State<DoctorsInfo> {
  int numberAdd = 0;
  bool _colorChange = true;
  void numbersAdd() {
    setState(() {
      if (_colorChange) {
        numberAdd++;
        _colorChange = false;
      } else {
        numberAdd--;
        _colorChange = true;
      }
    });
  }

  // نقص العدد
  int numberMinusInt = 0;
  bool _colorChangeMinus = true;
  void numberMinus() {
    setState(() {
      if (_colorChangeMinus) {
        _colorChangeMinus = false;
        numberMinusInt++;
      } else {
        _colorChangeMinus = true;
        numberMinusInt--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.black87),
        ),
        body: bookDetails()
        );
  }

  Widget bookDetails() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(
                'Book') /* .where("sellerId",isEqualTo: widget.sellerId) */ .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                  child: CircularProgressIndicator(
                semanticsLabel: "جاري التحميل...",
              ));
            default:
              return Stack(
                children: [
                  ListView(
                      children: snapshot.data.docs.map((DocumentSnapshot document) {
                    return SingleChildScrollView(
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Row(children: <Widget>[
                                        Image.network(
                                          document["image"].toString(),
                                          height: 160,
                                          fit: BoxFit.fitHeight,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                            width:
                                                MediaQuery.of(context).size.width -
                                                    222,
                                            height: 220,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    document["nameBook"],
                                                    style: TextStyle(fontSize: 32),
                                                  ),
                                                  Row(children: <Widget>[
                                                    RichText(
                                                        text: TextSpan(children: [
                                                      TextSpan(
                                                          text: "Price",
                                                          style: TextStyle(
                                                              color: Colors.red,
                                                              fontWeight:
                                                                  FontWeight.bold)),
                                                      TextSpan(
                                                        text: document["price"]
                                                            .toString(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline4
                                                            .copyWith(
                                                                color: Colors.black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      )
                                                    ])),
                                                    SizedBox(width: 3)
                                                  ]),
                                                  /*   Text(
                                            document["price"].toString(),

                                          style: TextStyle(
                                              fontSize: 19, color: Colors.grey),
                                        ), */
                                                  SizedBox(
                                                    height: 40,
                                                  ),
                                                  Row(children: <Widget>[
                                                  /*   IconTile(
                                                      backColor: Color(0xffFFECDD),
                                                      imgAssetPath:
                                                          "https://img.favpng.com/22/22/0/computer-icons-gmail-portable-network-graphics-email-download-png-favpng-wpF3BYjuvSNLqtVN5LCyamdJn.jpg",
                                                    ),
                                                    IconTile(
                                                      backColor: Color(0xffFEF2F0),
                                                      imgAssetPath:
                                                          "https://img.favpng.com/22/22/0/computer-icons-gmail-portable-network-graphics-email-download-png-favpng-wpF3BYjuvSNLqtVN5LCyamdJn.jpg",
                                                    ),
                                                    IconTile(
                                                      backColor: Color(0xffEBECEF),
                                                      imgAssetPath:
                                                          "https://img.favpng.com/22/22/0/computer-icons-gmail-portable-network-graphics-email-download-png-favpng-wpF3BYjuvSNLqtVN5LCyamdJn.jpg",
                                                    ) */
                                                  ])
                                                ]))
                                      ])),
                                  SizedBox(
                                    height: 26,
                                  ),
                                  Text("الوصف", style: TextStyle(fontSize: 22)),
                                  SizedBox(height: 16),
                                  Text(
                                    document["description"],
                                    style:
                                        TextStyle(color: Colors.grey, fontSize: 16),
                                  ),
                                  SizedBox(height: 24),
                                  Row(children: <Widget>[
                                    Column(children: <Widget>[
                                      Row(children: <Widget>[
                                        Image.network(
                                          "https://img.favpng.com/22/22/0/computer-icons-gmail-portable-network-graphics-email-download-png-favpng-wpF3BYjuvSNLqtVN5LCyamdJn.jpg",
                                          width: 150,
                                        ),
                                        SizedBox(width: 20),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text("تفاصيل الكتاب",
                                                  style: TextStyle(
                                                      color: Colors.black87
                                                          .withOpacity(0.7),
                                                      fontSize: 20)),
                                              SizedBox(height: 3),
                                              /*        ListTile(
                            title: Text(
                              "اسم الكتاب :    " +
                                  document["nameBook"] +
                                  " \n" +
                                  "اسم المؤلف :    " +
                                  document["authorName"],
                            ),
                            subtitle: Text(document["description"] +
                                " \n" +
                                document["city"] +
                                "   " +
                                document["datePublication"] +
                                "   " +
                                document["university"]),
                            trailing: Text(
                              document["price"].toString(),
                            ),
                          ), */
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      250,
                                                  child: Text(
                                                      " الكتاب-" +
                                                          document["nameBook"] +
                                                          " \n" +
                                                          "المؤلف :" +
                                                          document["authorName"] +
                                                          " \n" +
                                                          "اللغة :" +
                                                          document["bookLanguage"] +
                                                          " \n" +
                                                          " دار النشر :" +
                                                          document["darAlNasher"] +
                                                          " \n" +
                                                          // " :" +   document["datePublication"]+" \n",
                                                          "النسخة :" +
                                                          document["edition"] +
                                                          " \n" +
                                                          "حالة الكتاب :" +
                                                          document[
                                                              "productStatus"] +
                                                          " \n",

                                                      //   "House # 2, Road # 5, Green Road Dhanmondi, Dhaka, Bangladesh",
                                                      style: TextStyle(
                                                          color: Colors.grey)))
                                            ])
                                      ]),
                                      SizedBox(height: 20),
                                      Row(children: <Widget>[
                                        Container(
                                            width: 120,
                                            child: Expanded(
                                                child: Image.network(
                                                    "https://www.google.com/maps/d/thumbnail?mid=1QzkPZ1ne4kuvPFjmbI57w1E3wCU"))),
                                        SizedBox(width: 20),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text("معلومات البائع",
                                                  style: TextStyle(
                                                      color: Colors.black87
                                                          .withOpacity(0.7),
                                                      fontSize: 20)),
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      268,
                                                 /*  child: Text(
                                                      " :" +
                                                          document["done"] +
                                                          " \n" +
                                                          " :" +
                                                          document["done"] +
                                                          " \n" +
                                                          " :" +
                                                          document["done"] +
                                                          " \n",
                                                      style: TextStyle(
                                                          color: Colors.grey)) */)
                                            ])
                                      ])
                                    ])
                                  ]),
                                  Text("Activity",
                                      style: TextStyle(
                                          color: Color(0xff242424),
                                          fontSize: 28,
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(height: 22),
                                  Row(children: <Widget>[
                                    Expanded(
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 24, horizontal: 16),
                                            decoration: BoxDecoration(
                                                color: Color(0xffFBB97C),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                      padding: EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                          color: Color(0xffFCCA9B),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  16)),
                                                      child: Image.network(
                                                        "https://png.pngtree.com/png-vector/20190828/ourlarge/pngtree-file-clip-board-paper-board-details-icon-vector-desige-png-image_1706888.jpg",
                                                        width: 20,
                                                      )),
                                                  SizedBox(width: 16),
                                                  Container(
                                                      width: MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2 -
                                                          130,
                                                      child: Text(
                                                          "List Of Schedule",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 17)))
                                                ]))),
                                    SizedBox(width: 16),
                                    Expanded(
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 24, horizontal: 16),
                                            decoration: BoxDecoration(
                                                color: Color(0xffA5A5A5),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                      padding: EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                          color: Color(0xffBBBBBB),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  16)),
                                                      child: Image.network(
                                                        "https://img.favpng.com/22/22/0/computer-icons-gmail-portable-network-graphics-email-download-png-favpng-wpF3BYjuvSNLqtVN5LCyamdJn.jpg",
                                                        width: 20,
                                                      )),
                                                  SizedBox(
                                                    width: 16,
                                                  ),
                                                  InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          showDialog(
                                                              context: context,
                                                              builder: (BuildContext
                                                                  context) {
                                                                // return object of type Dialog
                                                                return AlertDialog(
                                                                    title: new Text(
                                                                        "رقم البائع"),
                                                                    content: new Text(
                                                                        document[
                                                                                "iphone"]
                                                                            .toString()),
                                                                    actions: <
                                                                        Widget>[
                                                                      new FlatButton(
                                                                          child: new Text(
                                                                              "الغاء"),
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.of(context)
                                                                                .pop();
                                                                          })
                                                                    ]);
                                                              });
                                                        });
                                                      },
                                                      child: Container(
                                                          width:
                                                              MediaQuery.of(context)
                                                                          .size
                                                                          .width /
                                                                      2 -
                                                                  130,
                                                          child: Text(
                                                            "التواصل",
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 17),
                                                          )))
                                                ])))
                                  ])
                                ])));
                  }).toList()),
                ],
              );
          }
        });
  }
}
 */