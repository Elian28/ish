import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ptint/3/AppData.dart';
import 'package:ptint/Server/help.dart';
import 'package:ptint/Widget/RAISEDBUTTON.dart';
import 'package:ptint/themes/LightColor.dart';
import 'package:ptint/themes/TitleText.dart';
import 'Bills.dart';
import '_New.dart';

class ViewOrder extends StatefulWidget {
  @override
  _ViewOrderState createState() => _ViewOrderState();
}

class _ViewOrderState extends State<ViewOrder>
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

/*  
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[700],
        child: Icon(Icons.add),
        onPressed: () {
          return Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => News()));
        },
      ),
/*         floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            child: Icon(Icons.add),
            onPressed: () {}), */
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
          stream: FirebaseFirestore.instance
              .collection(collections['Contents'])
              .snapshots(),
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
    return ListView.builder(
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
                            Card(
                              color: LightColor.iconColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: TEXT(
                                txt:
                                    " ${viewStatus[data.docs[index]['Status']]}",
                                color: LightColor.lightGrey,
                                size: 12,
                              ),
                            ),
                            TEXT(
                              txt: " ${data.docs[index]['OrderNnumber']}",
                              size: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                        subtitle: Align(
                          child: TEXT(
                            txt: 'بدون تغليف وبدون تدبيس,,,,,',
                            size: 10,
                          ),
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
                            color: LightColor.iconColor,
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
                RaisedButtons(
                  txt: "حذف الطلب",
                  onPresseds: () {
                    FirebaseFirestore.instance
                        .collection(collections['Contents'])
                        .doc(data.docs[index].id)
                        .delete();
                  },
                ),
              ]),

              /*   _divider,
              ListTile(
                  leading: TEXT(
                      txt: 'بانتظار قبول العرض           ',
                      color: LightColor.darkgrey,
                      size: 12),
                  title:  RaisedButtons(
                    txt: "العرض",
                  ),
                  trailing: Icon(Icons.navigate_next)), */
            ],
          ),
        );
      },
    );

/*     ListView.builder(
      itemCount: data.documents.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Firestore.instance
                            .collection(collections['Contents'])
                            .document(data.documents[index].documentID)
                            .updateData({
                          "done": true,
                        });
                      },
                      child: Icon(
                        Icons.assignment_turned_in,
                        color: data.documents[index]["done"]
                            ? Colors.teal
                            : Colors.grey.shade300,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Firestore.instance
                            .collection(collections['Contents'])
                            .document(data.documents[index].documentID)
                            .updateData({
                          "done": false,
                        });
                      },
                      child: Icon(
                        Icons.cancel,
                        color: data.documents[index]["done"]
                            ? Colors.red
                            : Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
                title: Text(
                  " ${data.documents[index]['body']}\n",
                  style: TextStyle(
                      decoration: data.documents[index]["done"]
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
                trailing: InkWell(
                  onTap: () {
                    Firestore.instance
                        .collection(collections['Contents'])
                        .document(data.documents[index].documentID)
                        .delete();
                  },
                  child: Icon(
                    Icons.delete,
                    color: Colors.red.shade800,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ); */
  }

/*   Future<void> alret() async {
    await showDialog(
        context: context,
        builder: (_) => AssetGiffyDialog(
              title: Text(
                "Elean ",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
              ),
              description: Text("التكلفة :  90         " +
                  "البعد : 0.5" +
                  "\n" +
                  "وقت الاستيلام : اليوم. بعد ساعتين "),
              entryAnimation: EntryAnimation.DEFAULT,
              cornerRadius: 15,
              buttonRadius: 90,
              onCancelButtonPressed: () {},
              onOkButtonPressed: () {},
              image: Image.network(
                  "https://www.mexatk.com/wp-content/uploads/2017/05/%D8%A7%D8%AC%D9%85%D9%84-%D8%A7%D9%84%D8%B5%D9%88%D8%B1-%D8%A7%D9%84%D9%85%D8%AA%D8%AD%D8%B1%D9%83%D8%A9-1.gif"),
            ));
  } */
}
