/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:ptint/3/AppData.dart';
import 'package:ptint/3/_New.dart';
import 'package:ptint/Books2/Bookas.dart';
import 'package:ptint/book/addBooks.dart';

import 'package:ptint/book/book3.dart';
import 'package:ptint/themes/LightColor.dart';

class BookTest extends StatefulWidget {
  @override
  _BookTestState createState() => _BookTestState();
}

class _BookTestState extends State<BookTest>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  User users;
  bool _hasEroor = false;
  bool _isLoading = true;
  bool isAdmin = true;
  String _eroorMassege;
  String name;
  String userType;

  @override
  void initState() {
    super.initState();
    //_controller = AnimationController(vsync: this);
    _prepareDate().then((user) {
      if (user != null) {
        _secondStepData(user);
      }
    });
  }

  var _divider = Divider(
    color: LightColor.iconColor,
    thickness: 1.0,
  );

  double getPrice() {
    double price = 0;
    AppData.cartList.forEach((x) {
      price += x.price * x.id;
    });
    return price;
  }

  Future<User> _prepareDate() async {
//    FirebaseAuth.instance.currentUser().then((user) {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      FirebaseFirestore.instance
          .collection("profile")
          //  .where('user_id', isEqualTo: user.uid)
          .get()
          .then((snapshotQuery) {
        setState(() {
          name = snapshotQuery.docs[0]['name'];
          userType = snapshotQuery.docs[0]['user_type'];
          if (snapshotQuery.docs[0]['user_type'] == 'admin') {
            isAdmin = true;
          }
          users = user;
          _hasEroor = false;
          _isLoading = false;
        });
        return user;
      }).catchError((error) {
        setState(() {
          _hasEroor = true;
          _eroorMassege = error.toString();
        });
        return null;
      });
    } else {
      // No User signed In.
      return null;
    }
  }

  void _secondStepData(User user) {}
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[700],
        child: Icon(Icons.add),
        onPressed: () {
          return Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => Booksa()));
        },
      ),
      appBar: AppBar(title: Text("الطلبات")),
      body: _isLoading
          ? _loading(context)
          : (_hasEroor ? _eroor(context, _eroorMassege) : _conTent(context)),
    );
  }

  Widget _loading(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }

// orderBy معناها الترتيب حسب
//descending معناه تنازلي
  Widget _conTent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Book').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return _eroor(context, "لم يحدث شى");
                break;
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return _eroor(context, snapshot.error.toString());
                }
                if (!snapshot.hasData) {
                  return _eroor(context, "لايوجد بيانات");
                }
                return _drawScreen(context, snapshot.data);
                break;
            }
            return Container();
          }),
    );
  }

  Widget _eroor(BuildContext context, String masseg) {
    return Center(
        child: Text(masseg, style: TextStyle(color: Colors.red, fontSize: 15)));
  }

  Widget _drawScreen(BuildContext context, QuerySnapshot data) {
    return new GridView.builder(
        itemCount: data.docs.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.73),
        itemBuilder: (BuildContext context, int index) {
          return new InkWell(
            child: new Card(
              elevation: 0,
              child: Stack(
                children: <Widget>[
                  GestureDetector(
                    onTap: () async {
                      // await alret();
                      return Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Bill(data.docs[index]['OrderNnumber'])));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.all(9),
                          decoration: BoxDecoration(
                              color: LightColor.lightOrange,
                              borderRadius: BorderRadius.circular(24)),
                          /*    child: Hero(
                                            tag: document["idBook"],
                                            child: Image.network(
                                                document["image"].toString(),
                                                height: 160,
                                                fit: BoxFit.fitHeight)) */
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 9 / 4),
                          child: Text(
                            data.docs[index]['nameBook'],
                            // products is out demo list
                            // document["nameBook"],
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        /*   Text(
                                   document["price"].toString() ,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ) */
                        Row(
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text:
                                          data.docs[index]["price"].toString(),
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                  TextSpan(
                                      text: "  RS ",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            SizedBox(width: 3),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //8
                  /*     InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      DoctorsInfo(
                                        idBook: document.id,
                                        authorName:
                                            document.data()["authorName"],
                                      )));
                            },
                            child: Container(
                              width: 150,
                              margin: EdgeInsets.only(right: 16),
                              padding:
                                  EdgeInsets.only(top: 16, right: 16, left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[],
                              ),
                            ),
                          ), */
                ],
              ),
            ),
          );
        });

    /*   return ListView.builder(
      shrinkWrap: true,
      itemCount: data.docs.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: BorderSide(color: LightColor.iconColor, width: 0.50),
          ),
          child: Column(
            children: [
              Container(
                  child: Row(children: <Widget>[
                Expanded(
                    child: ListTile(
                        title: Column(
                          children: [
                            TEXT(
                              txt: " ${data.docs[index]['nameBook']}",
                              size: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                        trailing: Container(
                          width: 70,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: LightColor.lightGrey.withAlpha(150),
                              borderRadius: BorderRadius.circular(10)),
                          child: TEXT(
                            txt: '\$ ' + "2.0",
                            color: LightColor.red,
                            size: 15,
                          ),
                        ),
                        leading: AspectRatio(
                            aspectRatio: 1.2,
                            child: Stack(children: <Widget>[
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                      height: 70,
                                      width: 70,
                                      child: Stack(children: <Widget>[
                                        Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                        "https://upload.3dlat.com/uploads/3dlat.com_28_18_18a6_9c59cddc60733.jpg",
                                                      ),
                                                      fit: BoxFit.cover),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 7.0,
                                                        color: LightColor
                                                            .iconColor)
                                                  ],
                                                  color: LightColor.lightGrey,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ))
                                      ])))
                            ]))))
              ])),
              Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                RaisedButtons(
                    txt: "عرض الطلب",
                    onPresseds: () async {
                      // await alret();
                      return Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Bill(data.docs[index]['OrderNnumber'])));
                    }),
              ]),
            ],
          ),
        );
      },
    ); */
  }

//#################
  Widget viewbook() {
    return StreamBuilder<QuerySnapshot>(
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
              return new GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.73),
                children: snapshot.data.docs.map((DocumentSnapshot document) {
                  return new InkWell(
                    child: new Card(
                      elevation: 0,
                      child: Stack(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                  padding: EdgeInsets.all(9),
                                  decoration: BoxDecoration(
                                      color: LightColor.lightOrange,
                                      borderRadius: BorderRadius.circular(24)),
                                  /*    child: Hero(
                                            tag: document["idBook"],
                                            child: Image.network(
                                                document["image"].toString(),
                                                height: 160,
                                                fit: BoxFit.fitHeight)) */
                                )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 9 / 4),
                                  child: Text(
                                    // products is out demo list
                                    document["nameBook"],
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                                /*   Text(
                                   document["price"].toString() ,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ) */
                                Row(
                                  children: <Widget>[
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text:
                                                  document["price"].toString(),
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                          TextSpan(
                                              text: "  RS ",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 3),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          //8
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      DoctorsInfo(
                                        idBook: document.id,
                                        authorName:
                                            document.data()["authorName"],
                                      )));
                            },
                            child: Container(
                              width: 150,
                              margin: EdgeInsets.only(right: 16),
                              padding:
                                  EdgeInsets.only(top: 16, right: 16, left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
          }
        });
  }
}

class Bill extends StatefulWidget {
  final String idBook;
  Bill(this.idBook);

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
    var collection = FirebaseFirestore.instance.collection("Book");

    return FutureBuilder(
        future:
            collection.where("OrderNnumber", isEqualTo: widget.idBook).get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return new Text('Error: ${snapshot.error}');

          String documentId = snapshot.data.docs[0].id;
          // عرض دوكمنت الطلب
          var order = snapshot.data.docs[0];
          return FutureBuilder(
              future: collection.doc(documentId).collection("offers").get(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData)
                  return new Text('Error: ${snapshot.error}');

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
                                        "${order.data()["idBook"].toString()}"))
                              ]));
                    });
              });
        });
  }

  Widget books() {
    var collection = FirebaseFirestore.instance.collection("Contents");
    return FutureBuilder(
        future: collection.where("idBook", isEqualTo: widget.idBook).get(),
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
 */