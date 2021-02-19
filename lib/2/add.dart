import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptint/3/HomesScreen.dart';
import 'package:ptint/Server/help.dart';
import 'package:sliding_sheet/sliding_sheet.dart';


String orderData = 'renad';

class Add1 extends StatefulWidget {
  final a;

  Add1(this.a);
  @override
  _Add1State createState() => _Add1State(a);
}

class _Add1State extends State<Add1> {
  var a;
  final _key = GlobalKey<FormState>();
  var _autovalidate = false;
  _Add1State(this.a);
  bool _osLoading = false;
  String image;

  TextEditingController _txtTitle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.error,
                size: 30,
                color: Colors.blue,
              ),
              onPressed: () {}),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: new Text("حذف الطلب"),
                          content: new Text("سيتم حذف جميع الطلبات"),
                          actions: <Widget>[
                            new FlatButton(
                              child: new Text("حذف"),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HomesScreen()),
                                  ModalRoute.withName('/'),
                                );
                              },
                            ),
                            new FlatButton(
                              child: new Text("الغاء"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Icon(
                    Icons.clear,
                    color: Colors.red,
                    size: 30,
                  )),
            ),
          ],
          title: Text("${a.data["name"]}"),
        ),
        body: _osLoading ? _loading() : _form(context));
  }

  Widget _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  /* 
    Widget _form(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Form(
              autovalidate: _autovalidate,
              key: _key,
              child: Column(
                children: <Widget>[
                     Card(
                        child: ListTile(
                          title: Text(
                              "\n${a.data["name"]}"), //Text("الاسم" + " ، " + " الموقع"),
                          subtitle: Text(",${a.data["Delivery"]}" +
                              "  ,\n رقم الهاتف ," +
                              a.data["IPhone"].toString() +
                              "\n"), //Text("طريقة الاستيلام" + " ، " + " من الفرع"),
                          trailing: Text("مسافة"), //Text("المسافة"),
                        ),
                      ),
                   Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Card(
                        child: TextField(
                           onChanged: (value) {
                          global.dtl=value;
                        },
                          controller: _txtTitle,
                          maxLines: 11,
                        maxLength: 500,
                                 cursorColor: Colors.black54,
                        style: TextStyle(color: Colors.black54),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          hintText: 'اكتب تفاصيل طلبك',
                        ),
                      ),
                    ),),
                    RaisedButton(onPressed: _save,),
                 ],
              ),
            ),
          ),
        ),
      ],
    );
  }
 */

//

  Widget _form(BuildContext context) {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Form(
                autovalidate: _autovalidate,
                key: _key,
                child: Column(
                  children: <Widget>[
                    Card(
                      child: ListTile(
                        title: Text(
                            "\n${a.data["name"]}"), //Text("الاسم" + " ، " + " الموقع"),
                        subtitle: Text(",${a.data["Delivery"]}" +
                            "  ,\n رقم الهاتف ," +
                            a.data["IPhone"].toString() +
                            "\n"), //Text("طريقة الاستيلام" + " ، " + " من الفرع"),
                        trailing: Text("مسافة"), //Text("المسافة"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Card(
                        child: TextField(
                          onChanged: (value) {
                            //global.dtl = value;
                          },
                          controller: _txtTitle,
                          maxLines: 11,
                          maxLength: 500,
                          cursorColor: Colors.black54,
                          style: TextStyle(color: Colors.black54),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.black54),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            hintText: 'اكتب تفاصيل طلبك',
                          ),
                        ),
                      ),
                    ),
                    RaisedButton(onPressed: _save),
                  ],
                ),
              ),
            ),
          ),
        ),
        Stack(
          children: <Widget>[
            SlidingSheet(
              elevation: 8,
              cornerRadius: 16,
              snapSpec: const SnapSpec(
                snap: true,
                snappings: [112, 400, double.infinity],
                positioning: SnapPositioning.pixelOffset,
              ),
              builder: (context, state) {
                return Container(
                  height: 500,
                  child: Center(
                      // child: Center(child: PrintPages()),
                      ),
                );
              },
              headerBuilder: (context, state) {
                return Container(
                  height: 56,
                  width: double.infinity,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: Text(
                    'خيارات الارسال',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.white),
                  ),
                );
              },
              footerBuilder: (context, state) {
                return InkWell(
                  onTap: _save,
                  child: Container(
                    height: 56,
                    width: double.infinity,
                    color: Colors.yellow,
                    alignment: Alignment.center,
                    child: Text("ارسال"),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  void _save() async {
    if (!_key.currentState.validate()) {
      setState(() {
        _autovalidate = true;
      });
    } else {
      setState(() {
        _osLoading = true;
      });
//      FirebaseAuth.instance.currentUser().then((user) {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        FirebaseFirestore.instance
            .collection(collections['Contents'])
            .doc()
            .set({
          'details': _txtTitle.text,
          "done": false,
          'user_id': user.uid,
        }).then((_) {
          Navigator.of(context).pop();
          /*  Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => HomesScreen99())); */
        });
      } else {
        // No User signed In.
      }
/*
      FirebaseAuth.instance.currentUser().then((user) {
        FirebaseFirestore.instance
            .collection(collections['Contents'])
            .doc()
            .set({
          'details': _txtTitle.text,
          "done": false,
          'user_id': user.uid,
        }).then((_) {
          Navigator.of(context).pop();
          /*  Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => HomesScreen99())); */
        });
      });
      */
    }
  }
}
