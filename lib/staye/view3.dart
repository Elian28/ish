import 'package:flutter/material.dart';
import 'package:ptint/3/app.dart';
import 'package:ptint/yes/ListUsers.dart';


import 'StartRequest.dart';

class Hom extends StatefulWidget {
  @override
  _HomState createState() => _HomState();
}

class _HomState extends State<Hom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*         floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            child: Icon(Icons.add),
            onPressed: () {}), */
        endDrawer: AppDrawer1(),
        appBar: AppBar(title: Text("الطلبات")),
        body: Column(
          children: <Widget>[
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 5,
                child: Card(
                    child: ListTile(
                        title: Text("اطلب مطبوعاتك"),
                        subtitle: Text("انواع مختلفة من المطبوعات"),
                        leading: Icon(Icons.print),
                        trailing: RaisedButton(
                          child: Text("بدا الطباعة"),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => ListUsers()));
                          },
                          //   View(snapshot.data.documents[index])));
                        )))),
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 5,
                child: Card(
                    child: ListTile(
                        title: Text("ملخصات "),
                        subtitle: Text(
                            "هل انت طالب وتريد الحصول ملخصات موجودة في القرطاسيات التي في منطقتك "),
                        leading: Icon(Icons.print),
                        trailing: RaisedButton(
                          child: Text("بدا الطلب"),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    StartRequest()));
                          },
                        )))),
          ],
        ));
  }
}
