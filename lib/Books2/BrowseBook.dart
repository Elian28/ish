import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ptint/themes/AppTheme.dart';

class BrowseBook extends StatefulWidget {
  final viewbook; // ************
  BrowseBook(this.viewbook); // ************
  @override
  _BrowseBookState createState() => _BrowseBookState(viewbook);
}

class _BrowseBookState extends State<BrowseBook> {
  var shiftbook; // ************
  bool activation = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController txtinp = TextEditingController();
  _BrowseBookState(this.shiftbook); // ************
  Color _color = Colors.grey;
  bool _mycolor = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(shiftbook.data()["nameBook"]),
        ),
        body: bookDetails());
  }

  Widget mm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.yellow[600],
          width: 390,
          child: Table(
            border: TableBorder.all(
                style: BorderStyle.none,
                width: 0.9,
                color: Colors.black.withOpacity(0.4)),
            columnWidths: {
              0: FlexColumnWidth(19.500),
              1: FlexColumnWidth(9),
            },
            children: [
              TableRow(children: [
                TableCell(
                  child: Table(
                    border: TableBorder.all(
                        style: BorderStyle.none,
                        width: 0.9,
                        color: Colors.black.withOpacity(0.4)),
                    columnWidths: {
                      0: FlexColumnWidth(11),
                      1: FlexColumnWidth(19),
                    },
                    children: [
                      TableRow(children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("${shiftbook.data()["productName"]}"),
                                //  text(book.title,
                                // size: 16, isBold: true, padding: EdgeInsets.only(top: 16.0)),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 8.0, bottom: 16.0, right: 1),
                                  child: Text(
                                    "${shiftbook.data()["price"].toString()}",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 15),
                                    //'by ${book.writer}',
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Text(
                                        "${shiftbook.data()["quantity"].toString()}",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12),
                                        //'by ${book.writer}',
                                      ),
                                    ),

                                    // RatingBar(rating: book.rating)
                                  ],
                                ),
                                SizedBox(height: 32.0),
                                Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Colors.blue.shade200,
                                  elevation: 5.0,
                                  child: MaterialButton(
                                    onPressed: () {},
                                    minWidth: 160.0,
                                    color: Colors.blue,
                                    child: Text(
                                      'الكمية المتبقية', /* color: Colors.white, size: 13 */
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        TableCell(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 200,
                                //   width: 180,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 90, left: 30),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    child: Image.network(
                                        "${shiftbook.data()["image"].toString()}",
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        fit: BoxFit.fitHeight),
                                  ),
                                ),
                              ),
                              SizedBox(height: 32.0),
                            ],
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ]),

              //
            ],
          ),
        ),
        SizedBox(
          height: 42,
        ),
        Text("وصف المنتج"),
        Container(
          height: 220.0,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "${shiftbook.data()["description"]}",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 13.0,
                height: 1.5,
              ),
            ),
          ),
        )
      ],
    );
  }

// شراء الكتاب
  Widget orderBooks() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Book').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                  child: CircularProgressIndicator(
                semanticsLabel: "جاري التحميل...",
              ));
            default:
              return new ListView(
                children: snapshot.data.docs.map((DocumentSnapshot document) {
                  return SizedBox(
                    child: Card(
                        //   color: Colors.white12,
                        elevation: 1,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              title: Row(
                                children: <Widget>[
                                  Text(
                                    document["price"].toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 23),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    document["price"].toString(),
                                    style: TextStyle(
                                        fontSize: 23,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            Icons.share,
                                            color: Colors.grey,
                                            size: 25,
                                          ),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.favorite,
                                            color: _color,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              if (_mycolor) {
                                                _color = Colors.grey;
                                                _mycolor = false;
                                              } else {
                                                _color = Colors.red;
                                                _mycolor = true;
                                              }
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    document["description"],
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                  );
                }).toList(),
              );
          }
        },
      ),
    );
  }

//######
  Widget bookDetails() {
  var  width= AppTheme.fullHeight(context);
  var height= AppTheme.fullWidth(context);
    return Stack(
      children: [
        ListView(children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(

                
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: Image.network(
                                "${shiftbook.data()["image"].toString()}",
                                width:width / 2,
                                height:height / 1.3,
                                fit: BoxFit.fitHeight),
                          ),
                        ),
                   
                      ],
                    ),
                    Card(
                        //   color: Colors.white12,
                        elevation: 1,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              title: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      shiftbook.data()["nameBook"],
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 23),
                                    ),
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: shiftbook
                                            .data()["price"]
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 23,
                                            color: Colors.red,
                                            fontWeight: FontWeight.w600)),
                                    TextSpan(
                                      text: "RS",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          .copyWith(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                    )
                                  ])),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: AppTheme.fullHeight(context)),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: "الوصف\n",
                                        style: TextStyle(
                                            fontSize: 23,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600)),
                                    TextSpan(
                                      text: "\n" +
                                          shiftbook
                                              .data()["description"]
                                              .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          .copyWith(
                                              color: Colors.grey[800],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                    )
                                  ])),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            Icons.share,
                                            color: Colors.grey,
                                            size: 25,
                                          ),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.favorite,
                                            color: _color,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              if (_mycolor) {
                                                _color = Colors.grey;
                                                _mycolor = false;
                                              } else {
                                                _color = Colors.red;
                                                _mycolor = true;
                                              }
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("تفاصيل الكتاب",
                                    style: TextStyle(
                                        color: Colors.black87.withOpacity(0.7),
                                        fontSize: 20)),
                                SizedBox(height: 3),
                                /*        ListTile(
                        title: Text(
                          "اسم الكتاب :    " +
                              viewbook.data()["nameBook"] +
                              " \n" +
                              "اسم المؤلف :    " +
                              viewbook.data()["authorName"],
                        ),
                        subtitle: Text(viewbook.data()["description"] +
                            " \n" +
                            viewbook.data()["city"] +
                            "   " +
                            viewbook.data()["datePublication"] +
                            "   " +
                            viewbook.data()["university"]),
                        trailing: Text(
                          viewbook.data()["price"].toString(),
                        ),
                      ), */
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width - 250,
                                    child: Text(
                                        " الكتاب-" +
                                            shiftbook.data()["nameBook"] +
                                            " \n" +
                                            "الفئة :" +
                                            shiftbook.data()["category"] +
                                            " \n" +
                                            "المؤلف :" +
                                            shiftbook.data()["authorName"] +
                                            " \n" +
                                            "اللغة :" +
                                            shiftbook.data()["bookLanguage"] +
                                            " \n" +
                                            " دار النشر :" +
                                            shiftbook.data()["darAlNasher"] +
                                            " \n" +
                                            // " :" +   viewbook.data()["datePublication"]+" \n",
                                            "النسخة :" +
                                            shiftbook.data()["edition"] +
                                            " \n" +
                                            "حالة الكتاب :" +
                                            shiftbook.data()["productStatus"] +
                                            " \n",

                                        //   "House # 2, Road # 5, Green Road Dhanmondi, Dhaka, Bangladesh",
                                        style: TextStyle(color: Colors.grey)))
                              ])
                        ]),
                        SizedBox(height: 20),
                        /*      Row(children: <Widget>[
                          Container(
                              width: 120,
                              child: Expanded(
                                  child: Image.network(
                                      "https://www.google.com/maps/d/thumbnail?mid=1QzkPZ1ne4kuvPFjmbI57w1E3wCU"))),
                          SizedBox(width: 20),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("معلومات البائع",
                                    style: TextStyle(
                                        color:
                                            Colors.black87.withOpacity(0.7),
                                        fontSize: 20)),
                                Container(
                                  width: MediaQuery.of(context).size.width -
                                      268,
                                  /*  child: Text(
                                                  " :" +
                                                      viewbook.data()["done"] +
                                                      " \n" +
                                                      " :" +
                                                      viewbook.data()["done"] +
                                                      " \n" +
                                                      " :" +
                                                      viewbook.data()["done"] +
                                                      " \n",
                                                  style: TextStyle(
                                                      color: Colors.grey)) */
                                )
                              ])
                        ])
                    */
                      ])
                    ]),
                    Text("Activity",
                        style: TextStyle(
                            color: Color(0xff242424),
                            fontSize: 28,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 22),
                    Row(children: <Widget>[
                      /*         Expanded(
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 24, horizontal: 16),
                              decoration: BoxDecoration(
                                  color: Color(0xffFBB97C),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: <Widget>[
                                 /*    Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: Color(0xffFCCA9B),
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Image.network(
                                          "https://png.pngtree.com/png-vector/20190828/ourlarge/pngtree-file-clip-board-paper-board-details-icon-vector-desige-png-image_1706888.jpg",
                                          width: 20,
                                        )), */
                                    SizedBox(width: 16),
                                  /*   Container(
                                        width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2 -
                                            130,
                                        child: Text("List Of Schedule",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17))) */
                                  ]))),
                      SizedBox(width: 16),
                 */
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 24, horizontal: 16),
                              decoration: BoxDecoration(
                                  color: Color(0xffA5A5A5),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: Color(0xffBBBBBB),
                                            borderRadius:
                                                BorderRadius.circular(16)),
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
                                                builder:
                                                    (BuildContext context) {
                                                  // return object of type Dialog
                                                  return AlertDialog(
                                                      title: new Text(
                                                          "رقم البائع"),
                                                      content: new Text(shiftbook
                                                          .data()["iphone"]
                                                          .toString()),
                                                      actions: <Widget>[
                                                        new FlatButton(
                                                            child: new Text(
                                                                "الغاء"),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            })
                                                      ]);
                                                });
                                          });
                                        },
                                        child: Container(
                                            width: MediaQuery.of(context)
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
                  ]))
        ]),
      ],
    );
  }
}
