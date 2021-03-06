import 'package:flutter/material.dart';
import 'package:ptint/themes/AppTheme.dart';
import 'package:ptint/themes/LightColor.dart';

class PrintRestaurants extends StatefulWidget {
  @override
  _PrintRestaurantsState createState() => _PrintRestaurantsState();
}

class _PrintRestaurantsState extends State<PrintRestaurants> {
  List<Widget> onTap1 = [];
  List list = [
    "طباعة تيشرت",
    " كاسات كرتون",
    "مناديل معطرة",
    "منيو وبروشور\n قائمة الطعام",
  ];
  List imgs = [
    'https://image.freepik.com/free-vector/group-wild-animals-design-t-shirt_1308-54006.jpg',
    "https://image.freepik.com/free-vector/top-view-coffee-cup_176411-896.jpg",
    "https://cdn.salla.sa/tTS410k2Sp7g04sRH2Of77QBm8PnCP695L84pqSw.",
    "https://image.freepik.com/free-vector/vector-cartoon-illustration-design-fast-food-restaurant-menu_1441-334.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("مطبوعات الشركات"),
        ),
        body: viewbook());
  }

  Widget viewbook() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                  elevation: 0,
                  child: Stack(children: <Widget>[
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                                  padding: EdgeInsets.all(9),
                                  /*    decoration: BoxDecoration(
                                   color: LightColor.titleTextColor,
                                   borderRadius: BorderRadius.circular(24)), */
                                  child: Image.network(imgs[index],
                                      width: AppTheme.fullWidth(context),
                                      height: AppTheme.fullHeight(context),
                                      fit: BoxFit.fill))),
                          /*  Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: 9 / 4),
                          child: Text(
                            // products is out demo list
                            list[index].toString(),
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                         Text(
                              document["price"].toString() ,
                             style: TextStyle(fontWeight: FontWeight.bold),
                           ) */
                          Row(children: <Widget>[
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: list[index].toString().toString(),
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              TextSpan(
                                  text: "   ",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold))
                            ])),
                            SizedBox(width: 3)
                          ])
                        ]),
                    //8
                    InkWell(
                        onTap: () {
                          /*     Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => onTap[index])); */
                        },
                        /*onTap: () {
                           Navigator.of(context).push(MaterialPageRoute(
                               builder: (BuildContext context) =>
                                   DoctorsInfo(
                                     idBook: snapshot.data.docs[index].id,
                                     authorName:
                                         snapshot.data.docs[index].data()["authorName"],
                                   )));},*/
                        child: Container(
                            width: 150,
                            margin: EdgeInsets.only(right: 16),
                            padding:
                                EdgeInsets.only(top: 16, right: 16, left: 16),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[])))
                  ]));
            }));
  }

  //البحث
  Widget _search() {
    return Container(
      margin: AppTheme.padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: LightColor.lightGrey.withAlpha(100),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: InkWell(
                onTap: () {
                  //  startSearch();
                },
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "المنتج بالاسم او الكود ",
                      hintStyle: TextStyle(fontSize: 12),
                      contentPadding: EdgeInsets.only(
                          left: 10, right: 10, bottom: 0, top: 5),
                      prefixIcon: Icon(Icons.search, color: Colors.black54)),
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          /*
          InkWell( onTap: () {},
            child: InkWell(
                  onTap: _showPopupMenu,
                  child: _icon(Icons.filter_list, color: Colors.black54)))
                   */
        ],
      ),
    );
  }
}
