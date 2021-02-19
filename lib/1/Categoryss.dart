import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ptint/themes/LightColor.dart';


//#
class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int _selectedCat = 0;
  User _user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: _form());
  }

  Widget _form() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('profile')
          .where('user_type', isEqualTo: 'Dealer')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
                child: CircularProgressIndicator(
              semanticsLabel: "جاري التحميل...",
            ));
          default:
            return Column(
              children: <Widget>[
                Text(
                  "عدد المتاجر المتوفره :  " +
                      "(${snapshot.data.docs.length.toString()})",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 25,
                      color: Colors.black),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 55),
                SizedBox(height: 15),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                        shrinkWrap: true,
                        itemCount: categories.length,
                        itemBuilder: (ctx, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedCat = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 25.0),
                              // padding: const EdgeInsets.symmetric(vertical: 45.0),
                              width: 50,
                              constraints: BoxConstraints(minHeight: 101),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: _selectedCat == index
                                    ? Border.all(
                                        color: _selectedCat == index
                                            ? LightColor.orange
                                            : LightColor.grey,
                                        width: _selectedCat == index ? 2 : 1,
                                      )
                                    : Border(),
                                color: _selectedCat == index
                                    ? Colors.transparent
                                    : LightColor.orange.withAlpha(200),
                                borderRadius: BorderRadius.circular(9.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: _selectedCat == index
                                        ? Color(0xfffbf2ef)
                                        : Colors.white,
                                    blurRadius: 10,
                                    spreadRadius: 5,
                                    offset: Offset(5, 5),
                                  ),
                                ],
                              ),

                              child: Text(
                                "${categories[index].title}",
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    .copyWith(
                                        color: _selectedCat == index
                                            ? Colors.black
                                            : Colors.white),
                              ),
                            ),
                          );
                        },
                      ),
                      Expanded(
                        flex: 4,
                        child: ListView.builder(
                          itemCount: categories[_selectedCat].subCat.length,
                          itemBuilder: (ctx, i) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 15),
                              padding: const EdgeInsets.all(9.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                        "${categories[_selectedCat].subCat[i].title}"),
                                  ),
                                  Icon(Icons.chevron_right),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )

                /*    ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          trailing: Text(
                            "${snapshot.data.documents[index].data["Delivery"]}"
                                .toString(),
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 30,
                                color: Colors.grey[500]),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => Pri()));
                            // ViewHom(snapshot.data.documents[index])));
                          },
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    "${snapshot.data.documents[index].data["TradeName"]}"
                                        .toString(),
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              25,
                                    ),
                                  ),
                                  Text(
                                    "${snapshot.data.documents[index].data["TradeName"]}"
                                        .toString(),
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              25,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "الاسم التاجر : " +
                                    "${snapshot.data.documents[index].data["name"]}"
                                        .toString(),
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 30,
                                    color: Colors.grey[500]),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              */
              ],
            );
        }
      },
    );
  }
}

Color bgColor = Color(0xfff5f5f5);

class Categories {
  final String title;
  final int id;
  final List<SubCategories> subCat;

  Categories({this.title, this.id, this.subCat});
}

class SubCategories {
  final String title;
  final int id;

  SubCategories({
    this.title,
    this.id,
  });
}

List<Categories> categories = [
  Categories(
    title: 'الكل',
    id: 0,
    subCat: [
      SubCategories(id: 1, title: 'الكل'),
    ],
  ),
  Categories(
    title: "توصيل",
    id: 1,
    subCat: [
      SubCategories(id: 1, title: "توصيل"),
      SubCategories(id: 2, title: "توصيب"),
    ],
  ),
  Categories(
    title: 'استيلا ',
    id: 2,
    subCat: [
      SubCategories(id: 1, title: "استيلام"),
    ],
  ),
];

class Product {
  final String mainImage;
  final List<String> images;
  final List<String> tags;
  final List<Color> colors;
  final List<int> size;
  final String title;
  final String price;
  final double rating;
  Product({
    this.rating,
    this.price,
    this.mainImage,
    this.images,
    this.tags,
    this.colors,
    this.size,
    this.title,
  });
}
