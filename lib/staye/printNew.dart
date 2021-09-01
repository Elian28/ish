import 'package:flutter/material.dart';

class PrintNew extends StatefulWidget {
  @override
  _PrintNewState createState() => _PrintNewState();
}

class _PrintNewState extends State<PrintNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Column(
        children: <Widget>[
          Text("الرجاء توضح الخط التصوير المراد كتابها"),
          Text("اختر الملف"),
          Text("(بالضغط ctrl مع الاختيار تستطيع رفع اكثر من ملف )"),
          Text("الملفات التي نقبلها Pdf, Jpg, word "),
          Card(child: Icon(Icons.add)),
          Text("نوع الخدمة"),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text("مستعجل"),
            SizedBox(width: 18, height: MediaQuery.of(context).size.height / 55),
            Text("عادي"),
          ]),
          Text("نوع الخط"),
          Text("Simplified arabic"),
          Text("Tradition Arabic"),
          Text("حجم الخط"),
          Text("16"),
          Text("18"),
          Text("ملاحظات اضافية"),
        ],
      ),
    );
  }
}
