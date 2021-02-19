import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView(children: <Widget>[
          Padding(
              //الخلفية البيضاء
              padding: const EdgeInsets.only(top: 10, right: 30),
              child: Card(
                  elevation: 0,
                  color: Color.fromRGBO(0xFFFFFF, 0xFFFFFF, 0xFFFFFF, 50),
                  child: Container(
                      child: ClipOval(
                          child: Column(children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListTile(
                            title: Center(
                                child: Row(children: <Widget>[
                              Text("متجر ريناد",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30,
                                      color: Colors.blue[800]))
                            ])),
                            subtitle: Column(children: <Widget>[
                              Text("متجر ريناد"),
                              Row(children: <Widget>[
                                Text("90"),
                                IconButton(
                                  icon: Icon(
                                    Icons.thumbs_up_down,
                                    color: Colors.grey[600],
                                  ),
                                  onPressed: () {},
                                )
                              ])
                            ])))
                  ]))))),
          Card(
              //  color: Colors.grey[700],
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[
            Text("طريقة الدفع", style: TextStyle(fontSize: 20)),
            Card(
                child: Container(
                    height: 60,
                    child: Row(children: <Widget>[
                      SizedBox(width: 20),
                      Text("عند الاستيلام"),
                      SizedBox(width: 20),
                      Text("فيزا")
                    ]))),
            SizedBox(height: 10),
            Text("معلومات عن القرطاسية", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Card(
                child: ListTile(
                    title: Text("المنطقة "), subtitle: Text("النسيم"))),

            Card(
                child: ListTile(
                    title: Text("الحد الادني للطلب"),
                    subtitle: Text("30 ر.س"))),
            Card(
                child: ListTile(
                    title: Text("ساعات العمل"), subtitle: Text("ص9 , 12م "))),
            Card(
                child: ListTile(
                    title: Text("خدمة الطلب المسبق"), subtitle: Text("5"))),

            SizedBox(height: 10),
            Text("معلومات التوصيل", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Card(
                child:
                    ListTile(title: Text("وقت التوصيل"), subtitle: Text("45"))),
            Card(
                child: ListTile(
                    title: Text("رسوم التوصيل"), subtitle: Text("10"))),
            Card(
                child: ListTile(
                    title: Text("طرق التوصيل"),
                    subtitle: Text("البريد السعودي "))),
            Card(
                child: ListTile(
                    title: Text(" مناطق التوصيل الفوري"),
                    subtitle: Text("مكة ، جدة"))),
            Card(
                child: ListTile(
                    title: Text(" مناطق التوصيل عن بعد"),
                    subtitle: Text("لا توفر هذي الخاصية")))

            //
          ])))
        ]) // الازار
        );
  }
}
