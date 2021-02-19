
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Mycolos extends StatefulWidget {
  @override
  _MycolosState createState() => _MycolosState();
}

class _MycolosState extends State<Mycolos> {
  Color _color = Colors.grey;
  bool _mycolor = false;
  @override
  Widget build(BuildContext context) {
    return orderBooks();
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
}
