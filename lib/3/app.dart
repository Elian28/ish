import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ptint/1/tt.dart';
import 'package:ptint/3/youdata.dart';
import 'package:ptint/auth/Login..dart';
import 'package:url_launcher/url_launcher.dart';
import 'HomesScreen.dart';

class AppDrawer1 extends StatefulWidget {
  @override
  _AppDrawer1State createState() => _AppDrawer1State();
}

class _AppDrawer1State extends State<AppDrawer1> {
  bool _hasEroor = false;
  bool _isLoading = true;
  bool isAdmin = true;
  String _eroorMassege;
  String _name;
  @override
  void initState() {
//    FirebaseAuth.instance.currentUser().then((users) {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      FirebaseFirestore.instance
          .collection("profile")
          .get()
          .then((snapshotQuery) {
        setState(() {
          _name = snapshotQuery.docs[0]['name'];
          if (snapshotQuery.docs[0]['user_type'] == 'admin') {
            isAdmin = true;
          }
          user = user;
          _hasEroor = false;
          _isLoading = false;
        });
        return user;
      });
    } else {
      // No User signed In.
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
            ),
            Divider(),
            InkWell(
              onTap: () {
                return Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => UserData()));
              },
              child: Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 2.6,
                    height: MediaQuery.of(context).size.height / 7,
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        image: DecorationImage(
                            image: NetworkImage(
                              "https://upload.3dlat.com/uploads/3dlat.com_28_18_18a6_9c59cddc60733.jpg",
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.0, color: Colors.cyan)
                        ]),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 15,
                    height: MediaQuery.of(context).size.height / 30,
                    decoration: BoxDecoration(
                        color: Colors.white38,
                        border: Border.all(color: Colors.black45),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 0.0, color: Colors.black12)
                        ]),
                    child: Icon(
                      Icons.create,
                      size: 20,
                      color: Colors.cyan[700],
                    ),
                  ),
                ],
              ),
            ),
            FlatButton(
              child: _isLoading
                  ? InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Text("التسجيل والدخول"),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Login()));
                      },
                    )
                  : (_hasEroor ? _eroor(context, _eroorMassege) : Text(_name)),
              onPressed: () {},
            ),
            ListTile(
                title: Text("العناوين"),
                leading: Icon(Icons.exit_to_app),
                onTap: () async {
                  //

                  var user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    // FirebaseAuth.instance.currentUser().then((_) {
                    Navigator.of(context).pop();
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => HomesScreen()))
                        .catchError((onError) {});
                  }
                }),
            ListTile(
                title: Text("الدفع"),
                leading: Icon(Icons.exit_to_app),
                onTap: () async {
                  var user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    // FirebaseAuth.instance.currentUser().then((_) {
                    Navigator.of(context).pop();
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => HomesScreen()))
                        .catchError((onError) {});
                  }
                }),
            ListTile(
                leading: Icon(
                  Icons.shop,
                  color: Colors.teal,
                ),
                title: Text('المساعدة'),
                onTap: () async {
                  //    openWhatsApp();
                  await canLaunch(whatsAppUrl)
                      ? launch(whatsAppUrl)
                      : Scaffold.of(context).showSnackBar(new SnackBar(
                          content: new Text("تحتاج إلى WhatsApp للوصول")));
                  //  Navigator.pop(context);
                }),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.teal,
              ),
              title: Text('الاعدادات'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MMMM()),
                );
              },
            ),
/*           Divider(),
            ListTile(
              title: Text("تسجيل خروج"),
              leading: Icon(Icons.exit_to_app),
              onTap: () async {
                FirebaseAuth.instance.currentUser().then((_) {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => Login()));
                }).catchError((onError) {});
              },
            ), */
          ],
        ),
      ),
    );
  }

  var whatsAppUrl = "https://wsend.co/966566677221";
/*  s */

  Widget _eroor(BuildContext context, String masseg) {
    return Center(
        child: Text(
      masseg,
      style: TextStyle(color: Colors.red, fontSize: 15),
    ));
  }
}
