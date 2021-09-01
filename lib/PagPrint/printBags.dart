import 'package:flutter/material.dart';
import 'package:ptint/themes/AppTheme.dart';

class PrintBags extends StatefulWidget {
  @override
  _PrintBagsState createState() => _PrintBagsState();
}

class _PrintBagsState extends State<PrintBags> {
  List<Widget> onTap1 = [];
  List list = [
    "طباعة أكياس بن",
    "أكياس نايلون",
    "حقائب النايلون",
    "اكياس ورقية ",
  ];
  List imgs = [
    'https://image.freepik.com/free-vector/foil-pouch-with-zipper-plastic-window-tea_107791-1926.jpg',
    // "http://www.swisspac.com.kw/wp-content/uploads/2017/12/Coffee-Bags-01-3.jpg",
    "https://image.freepik.com/free-vector/transparent-white-plastic-foil-bag-with-hang-hole_1441-796.jpg",
    "https://image.freepik.com/free-psd/black-tote-shopping-bags-mock-up_34168-943.jpg",
    "https://image.freepik.com/free-psd/bag-mockup-merchandising_23-2148154191.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("حقائب والشنط"),
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
}
