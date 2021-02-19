import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptint/card/PersonalCards.dart';
import '_GradientPainter.dart';

class Pri2 extends StatefulWidget {
  @override
  _Pri2State createState() => _Pri2State();
}

class _Pri2State extends State<Pri2> {
  bool _osLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
            /*        leading: IconButton(
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
          title: Text(""),
        */
            ),
        body: _osLoading ? _loading() : _form(context));
  }

  Widget _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _form(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            UnicornOutlineButton(
              strokeWidth: 2,
              radius: 16,
              gradient:
                  LinearGradient(colors: [Colors.black, Colors.redAccent]),
              child: Text('صندوق ', style: TextStyle(fontSize: 16)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => LongPersonalCard()));
              },
            ),
            SizedBox(width: 18, height: MediaQuery.of(context).size.height / 55),
            UnicornOutlineButton(
              strokeWidth: 2,
              radius: 16,
              gradient:
                  LinearGradient(colors: [Colors.black, Colors.redAccent]),
              child: Text('حروف بارزة', style: TextStyle(fontSize: 16)),
              onPressed: () {},
            ),
            SizedBox(width: 18, height: MediaQuery.of(context).size.height / 55),
            UnicornOutlineButton(
              strokeWidth: 2,
              radius: 16,
              gradient:
                  LinearGradient(colors: [Colors.black, Colors.redAccent]),
              child: Text('فريمات', style: TextStyle(fontSize: 16)),
              onPressed: () {},
            ),
            SizedBox(width: 18, height: MediaQuery.of(context).size.height / 55),
          ],
        ),
        SizedBox(width: 0, height: MediaQuery.of(context).size.height / 55),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            UnicornOutlineButton(
              strokeWidth: 2,
              radius: 16,
              gradient:
                  LinearGradient(colors: [Colors.black, Colors.redAccent]),
              child: Text('كلادينج ', style: TextStyle(fontSize: 16)),
              onPressed: () {},
            ),
            SizedBox(width: 18, height: MediaQuery.of(context).size.height / 55),
            UnicornOutlineButton(
              strokeWidth: 2,
              radius: 16,
              gradient:
                  LinearGradient(colors: [Colors.black, Colors.redAccent]),
              child: Text('اكريليك ', style: TextStyle(fontSize: 16)),
              onPressed: () {},
            ),
            SizedBox(width: 18, height: MediaQuery.of(context).size.height / 55),
            UnicornOutlineButton(
              strokeWidth: 2,
              radius: 16,
              gradient:
                  LinearGradient(colors: [Colors.black, Colors.redAccent]),
              child: Text('ليزر', style: TextStyle(fontSize: 16)),
              onPressed: () {},
            ),
            SizedBox(width: 18, height: MediaQuery.of(context).size.height / 55),
          ],
        ),
        SizedBox(width: 18, height: MediaQuery.of(context).size.height / 55),
        UnicornOutlineButton(
          strokeWidth: 2,
          radius: 16,
          gradient: LinearGradient(colors: [Colors.black, Colors.redAccent]),
          child: Text('صيانه', style: TextStyle(fontSize: 16)),
          onPressed: () {},
        ),
      ],
    );
  }

// كروت شخصية
}
