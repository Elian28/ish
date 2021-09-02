import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:ptint/Books2/BrowseBook.dart';
import 'package:ptint/Books2/book.dart';
import 'package:ptint/themes/AppTheme.dart';

class UsedBooks extends StatefulWidget {
  @override
  _UsedBooksState createState() => _UsedBooksState();
}

class _UsedBooksState extends State<UsedBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("كتب مستعملة"),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddBook()));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: AppTheme.fullWidth(context) / 5,
                  ),
                  Icon(Ionicons.ios_add_circle_outline,
                      size: AppTheme.fullWidth(context) / 11),
                ],
              ),
            ),
          ],
        ),
        body: viewbook());
  }

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
              return new GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.73),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new InkWell(
                      child: new Card(
                        elevation: 0,
                        child: Stack(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                  padding: EdgeInsets.all(9),
                                  /*    decoration: BoxDecoration(
                                      color: LightColor.titleTextColor,
                                      borderRadius: BorderRadius.circular(24)), */
                                  child: Image.network(
                                      "${snapshot.data.docs[index]["image"]}",
                                      width: AppTheme.fullWidth(context),
                                      height: AppTheme.fullHeight(context),
                                      fit: BoxFit.fill),
                                )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 9 / 4),
                                  child: Text(
                                    // products is out demo list
                                    snapshot.data.docs[index]["nameBook"],
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
                                              text: snapshot
                                                  .data.docs[index]["price"]
                                                  .toString(),
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
                            //8
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BrowseBook(snapshot
                                          .data
                                          .docs[index])), // اهنا نمرر البيانات
                                );
                              },
                              /*    onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      DoctorsInfo(
                                        idBook: snapshot.data.docs[index].id,
                                        authorName:
                                            snapshot.data.docs[index].data()["authorName"],
                                      )));
                            }, */
                              child: Container(
                                width: 150,
                                margin: EdgeInsets.only(right: 16),
                                padding: EdgeInsets.only(
                                    top: 16, right: 16, left: 16),
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
                  });
          }
        });
  }

  Widget chipRowCategory() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Category").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text("خطا :${snapshot.error}");
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text("جاري تحميل البيانات ...");
            default:
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children:
                        snapshot.data.docs.map((DocumentSnapshot document) {
                  return Wrap(
                    spacing: 6,
                    children: <Widget>[
                      ActionChip(
                        shadowColor: Colors.white,
                        pressElevation: 90,
                        elevation: 4,
                        label: Text(" " + document["title"] + " "),
                        onPressed: () {},
                        backgroundColor: Colors.grey.withOpacity(0.4),
                      ),
                      SizedBox()
                    ],
                  );
                }).toList()),
              );
          }
        });
  }
}
