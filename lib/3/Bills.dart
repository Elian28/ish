import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class Bill extends StatefulWidget {
  final int orderNumber;
  Bill(this.orderNumber);

  @override
  _BillState createState() => _BillState();
}

class _BillState extends State<Bill> {
  bool open = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("رقم العميل")), body: data());
  }

  Widget data() {
    var collection = FirebaseFirestore.instance.collection("Contents");

    return FutureBuilder(
      future:
          collection.where("OrderNnumber", isEqualTo: widget.orderNumber).get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Text('Error: ${snapshot.error}');

        String documentId = snapshot.data.docs[0].id;
        // عرض دوكمنت الطلب
        var order = snapshot.data.docs[0];
        return FutureBuilder(
          future: collection.doc(documentId).collection("offers").get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return new Text('Error: ${snapshot.error}');

            var allDocuemnts = snapshot.data.docs;
            return ListView.builder(
              itemCount: allDocuemnts.length,
              itemBuilder: (BuildContext context, int index) {
                // عرض داخل الدوكمنت حق الطلب
                var offer = allDocuemnts[index].data;
                // return Text(order['details'].toString());
                return Container(
                  height: 500,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ListTile(
                            subtitle: Text("العميل رقم: " +
                                "${order.data()["OrderNnumber"].toString()}"),
                            trailing: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    "المسافة",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.location_on, color: Colors.blue)
                                ])),
                        Column(children: <Widget>[
                          Row(children: <Widget>[
                            Expanded(
                                child: Card(
                                    elevation: 0,
                                    shape: UnderlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide()),
                                    margin: EdgeInsets.all(7),
                                    color: Colors.white70,
                                    child: Column(children: <Widget>[
                                      Text("اليوم : السبت" +
                                          "\n" +
                                          "${offer()["price"]}"),
                                      StreamBuilder(
                                          stream: FirebaseFirestore.instance
                                              .collection('profile')
                                              .where('user_id',
                                                  isEqualTo: snapshot
                                                      .data.docs[index]
                                                      .data()["user_id"])
                                              .snapshots(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<QuerySnapshot>
                                                  snapshot) {
                                            //TODO
                                            if (!snapshot.hasData)
                                              return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                semanticsLabel:
                                                    "جاري التحميل...",
                                              ));
                                            return Text(snapshot.data.docs[0]
                                                .data()['name']);
                                          }),
                                      Divider(color: Colors.grey),
                                      Text("وقت الاستيلام :" +
                                          " ${order.data()['date'].toString()}\n"),
                                      Divider(color: Colors.grey),
                                      Text("مكان التوصيل : مكة الزاهر")
                                    ]))),
                            Expanded(
                                child: Card(
                                    elevation: 0,
                                    shape: UnderlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide()),
                                    margin: EdgeInsets.all(7),
                                    color: Colors.white70,
                                    child: Column(children: <Widget>[
                                      Text("نوع الخدمة : " +
                                          " ${order.data()['category']}\n"),
                                      Divider(color: Colors.grey),
                                      Text("ملاحظات العميل :" +
                                          " ${order.data()['details']}\n"),
                                      Divider(color: Colors.grey),
                                      ListTile(
                                          trailing: Text("عرض الملف"),
                                          title: Icon(Icons.description,
                                              // color: Colors.blue[800],
                                              color: Colors.yellow[900])),
                                    ])))
                          ])
                        ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RaisedButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  /*    color: data.documents[index]
                                                      ["done"]
                                                  ? Colors.teal
                                                  : Colors.grey.shade300, */
                                  child: Text("قبول"),
                                  onPressed: () async {
                                    await showDialog(
                                        context: context,
                                        builder: (_) => AssetGiffyDialog(
                                              // imagePath: 'assets/men_wearing_jacket.gif',
                                              title: Text(
                                                "قرطاسية الثقافة",
                                                style: TextStyle(
                                                    fontSize: 22.0,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              description: Text(
                                                  "التكلفة :  90         " +
                                                      "البعد : 0.5" +
                                                      "\n"
                                                          "وقت الاستيلام : اليوم. بعد ساعتين "),
                                              entryAnimation:
                                                  EntryAnimation.DEFAULT,
                                              buttonCancelColor: Colors.amber,
                                              cornerRadius: 15,
                                              buttonRadius: 90,
                                              onCancelButtonPressed: () {},
                                              buttonOkColor: Colors.blueGrey,
                                              onOkButtonPressed: () {},
                                              image: Image.network(
                                                  "https://www.mexatk.com/wp-content/uploads/2017/05/%D8%A7%D8%AC%D9%85%D9%84-%D8%A7%D9%84%D8%B5%D9%88%D8%B1-%D8%A7%D9%84%D9%85%D8%AA%D8%AD%D8%B1%D9%83%D8%A9-1.gif"),
                                            ));

                                    /*                                         return showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                        
                                              FancyDialog(
                                                title: "Fancy Gif Dialog",
                                                descreption:
                                                    "This is descreption for fancy gif,you can load any image or gif to be displayed :), and you can choose between two themes Fancy and Flat",
                                              )); */
                                    /*      return showDialog(
                                          context: context,
                                          barrierDismissible:
                                              false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                                title: Text('العروض'),
                                                content:
                                                    SingleChildScrollView(
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text('اسم المستخدم' +
                                                          "\n" +
                                                          'عدد التقيم'),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: <Widget>[
                                                          Text('الكلفة' +
                                                              " 10.0"),
                                                          Text(
                                                              'وقت الاستيلام'),
                                                          Text('البعد'),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                /*                     content: ListTile(
                                                  leading: Text('اسم المستخدم' +
                                                      "\n" +
                                                      'عدد التقيم' +
                                                      "\n" +
                                                      "'يقبل كاش او تحويل فقط'"),

                                                  /*  subtitle: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: <Widget>[
                                                      Text('الكلفة' +
                                                          " 10.0"),
                                                      Text('وقت الاستيلام'),
                                                      Text('البعد'),
                                                    ],
                                                  ), */
                                                ), */
                                                actions: <Widget>[
                                                  FlatButton(
                                                      child: Text('متاكد'),
                                                      onPressed: () async {
                                                        Navigator.of(
                                                                context)
                                                            .pop();
                                                        Firestore.instance
                                                            .collection(
                                                                'Contents')
                                                            .document(order
                                                                .documentID)
                                                            .collection(
                                                                'offers')
                                                            .document((await FirebaseAuth
                                                                    .instance
                                                                    .currentUser())
                                                                .uid)
                                                            .setData({
                                                          'price': 200,
                                                          'dealer_id':
                                                              (await FirebaseAuth
                                                                      .instance
                                                                      .currentUser())
                                                                  .uid,
                                                        });
                                                      }),
                                                  FlatButton(
                                                      child: Text('الغاء'),
                                                      onPressed: () {
                                                        Navigator.of(
                                                                context)
                                                            .pop();
                                                      })
                                                ]);
                                          });
                                   */
                                  }),
                              RaisedButton(child: Text("رفض"), onPressed: () {})
                            ])
                      ]),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget books() {
    var collection = FirebaseFirestore.instance.collection("Contents");
    return FutureBuilder(
        future: collection
            .where("OrderNnumber", isEqualTo: widget.orderNumber)
            .get(),
        //  future: Firestore.instance.collection('renads').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                  child: CircularProgressIndicator(
                semanticsLabel: "جاري التحميل...",
              ));
            default:
              return SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                    TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                            hintText: "دور على كتابك")),
                    Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 23,
                        child: Card(
                            child: Center(
                                child: Text(
                                    "عدد الكتب   ${snapshot.data.docs.length}")))),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3, childAspectRatio: 0.57),
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                  child: Card(
                                      elevation: 0,
                                      child: Stack(children: <Widget>[
                                        //TODO
                                        /*   Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Image.network(
                                        "${snapshot.data.documents[index].data["image"]}",
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        fit: BoxFit.fill),
                                  ),
                                ), */
                                        GridTile(
                                          child: GestureDetector(
                                            onTap: () {},
                                            /* child: Image.network(
                                          "${snapshot.data.documents[index].data["image"]}",
                                          width:
                                              MediaQuery.of(context).size.width/1,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          fit: BoxFit.fill), */
                                          ),
                                          //معلومات الكتاب
                                          footer: GridTileBar(
                                            backgroundColor: Colors.black87,
                                            title: FittedBox(
                                                child: Text(
                                                    "${snapshot.data.docs[index].data()["nameBook"]}\n ${snapshot.data.docs[index].data()["authorName"]}\n${snapshot.data.docs[index].data()["price"].toString()}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 90))),
                                            trailing: IconButton(
                                              icon: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 20),
                                                child: Icon(
                                                    Icons.favorite_border,
                                                    size: 20),
                                              ),
                                              color: Colors
                                                  .red, //Theme.of(context).accentColor,
                                              onPressed: () {
                                                //product.toggleIsFavorite(auth.token);
                                              },
                                            ),
                                          ),
                                          header: GridTileBar(
                                            backgroundColor: Colors.black87,
                                            leading: Text(
                                              "${snapshot.data.docs[index].data()["category"]}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          36,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          title: Column(
                                            children: <Widget>[
                                              SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      100),
                                            ],
                                          ),
                                          onTap: () {},
                                        )
                                      ])));
                            }))
                  ]));
          }
        });
  }

  Future<void> alret() async {
    await showDialog(
        context: context,
        builder: (_) => AssetGiffyDialog(
              // imagePath: 'assets/men_wearing_jacket.gif',
              title: Text(
                "قرطاسية الثقافة",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
              ),
              description: Text("التكلفة :  90         " +
                  "البعد : 0.5" +
                  "\n"
                      "وقت الاستيلام : اليوم. بعد ساعتين "),
              entryAnimation: EntryAnimation.DEFAULT,
              buttonCancelColor: Colors.amber,
              cornerRadius: 15,
              buttonRadius: 90,
              onCancelButtonPressed: () {},
              buttonOkColor: Colors.blueGrey,
              onOkButtonPressed: () {},
              image: Image.network(
                  "https://www.mexatk.com/wp-content/uploads/2017/05/%D8%A7%D8%AC%D9%85%D9%84-%D8%A7%D9%84%D8%B5%D9%88%D8%B1-%D8%A7%D9%84%D9%85%D8%AA%D8%AD%D8%B1%D9%83%D8%A9-1.gif"),
            ));
  }
}
