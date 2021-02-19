import 'package:flutter/material.dart';
import 'package:ptint/themes/TitleText.dart';

class Receipt extends StatefulWidget {
  @override
  _ReceiptState createState() => _ReceiptState();
}

class _ReceiptState extends State<Receipt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TEXT(txt: "الفاتوره"),
      ),
      body: Column(
        children: <Widget>[
          TEXT(txt: "   المبلغ المستحق"),
          ListTile(
            leading: TEXT(txt: "مبلغ الطباعة "),
            title: TEXT(txt: "  :0 ريال"),
          ),
          ListTile(
            leading: TEXT(txt: "الضريبة المضافة"),
            title: TEXT(txt: "  0 %"),
          ),
          ListTile(
            leading: TEXT(txt: "الاجمالي : "),
            title: TEXT(txt: "  :0 ريال"),
          ),
          TEXT(txt: "الاجمالي بعد خصم العروض والكوبونات :0 ريال"),
        ],
      ),
    );
  }
}
