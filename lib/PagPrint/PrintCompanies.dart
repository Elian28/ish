import 'package:flutter/material.dart';
import 'package:ptint/themes/AppTheme.dart';

class PrintCompanies extends StatefulWidget {
  @override
  _PrintCompaniesState createState() => _PrintCompaniesState();
}

class _PrintCompaniesState extends State<PrintCompanies> {
  List list = [
    "بروشورات",
    "اتيكيت حراري",
    " لاصق اوفست",
    "طباعة ختم",
    'فولدرات',
    'رول أب',
    "دفتر فواتير",
    "طباعة ظرف رسائل",
    "طباعة لافتات فلكس",
    "طباعة ورق",
    "لاصق للواجهات",
    "بوسترات اعلانية",
  ];
  List imgs = [
    "https://www.profiledesignco.com/wp-content/uploads/2019/11/%D8%A8%D8%B1%D9%88%D8%B4%D9%88%D8%B1-%D8%AA%D8%B9%D8%B1%D9%8A%D9%81%D9%8A-2.png}",
    "https://image.freepik.com/free-psd/blank-curled-sticker-isolated-white_117023-193.jpg",
    "https://image.freepik.com/free-psd/sticker-mockup_149660-554.jpg",
    "https://image.freepik.com/free-vector/isometric-business-concept-micro-office-worker-man-make-approve-by-huge-stamp-printed-document_126523-2536.jpg",
    'https://image.freepik.com/free-psd/flying-a4-bi-fold-cover-mockup_7838-256.jpg',
    'https://image.freepik.com/free-psd/roll-up-banner-mockup-look-front-view_15431-482.jpg',
    'https://www.gurukrupaprintwell.com//wp-content/uploads/2019/10/Invoice-book-2-copy.jpg',
    'https://image.freepik.com/free-psd/stationery-concept-with-envelope-mockup_23-2147922740.jpg',
    'https://as2.ftcdn.net/jpg/03/33/24/37/1000_F_333243777_Lvst0FFbbVCRVW8jFhfywSXiHYKuKgdV.jpg',
    "https://as1.ftcdn.net/jpg/01/72/62/04/1000_F_172620487_NXHlfxw8ymGn3KaTcZlEEp4oXLAjco6q.jpg",
    'https://www.qualiteyprinting.com/image/cache/catalog/WhatsApp%20Image%202020-04-09%20at%202.41.51%20PM-550x550w.jpeg',
    "https://image.freepik.com/free-psd/blank-billboard-mockup_53876-12218.jpg",
  ];
  List<Widget> onTap1 = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("مطبوعات مطاعم"),
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
