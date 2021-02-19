import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ptint/Step/ViewPagePrint.dart';
import 'package:ptint/themes/LightColor.dart';

class AddRequest extends StatefulWidget {
  @override
  _AddRequestState createState() => _AddRequestState();
}

class _AddRequestState extends State<AddRequest> {
  final _key = GlobalKey<FormState>();
  var _autovalidate = false;
  bool _osLoading = false;
  TextEditingController _txtTitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey[50], elevation: 0),
      floatingActionButton: FloatingActionButton(
          backgroundColor: LightColor.iconColor,
          child: Icon(Icons.print),
          onPressed: () {
            return Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => ViewPagePrint()));
          }),
      body: Column(
        children: [
          Text("data"),
          Text("تقييمات المستخدمين"),
          Text("الموقع"),
          Text("اوقات العمل"),
          RaisedButton(child: Text("اكتب الطلب"), onPressed: _form),
        ],
      ),
    );
  }

  void _form() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Stack(
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
                          title: Text("سسسس"
                              /*     "\n${a.data["name"]}"), //Text("الاسم" + " ، " + " الموقع"),
                        subtitle: Text(",${a.data["Delivery"]}" +
                            "  ,\n رقم الهاتف ," +
                            a.data["IPhone"].toString() +
                            "\n" */
                              ), //Text("طريقة الاستيلام" + " ، " + " من الفرع"),
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
                            // controller: _txtTitle,
                            maxLines: 11,
                            maxLength: 500,
                            cursorColor: Colors.black54,
                            style: TextStyle(color: Colors.black54),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.black54),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black54)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              hintText: 'اكتب تفاصيل طلبك',
                            ),
                          ),
                        ),
                      ),
                      Container(
                          width: 325.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                offset: Offset(0.1, 0.1),
                                blurRadius: 0.1,
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Text("طريقة الدفع")),
                      // Text("اضف كوبون"),
                      RaisedButton(
                        onPressed: _save,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }));
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
        FirebaseFirestore.instance.collection("titlrs").doc().set({
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
