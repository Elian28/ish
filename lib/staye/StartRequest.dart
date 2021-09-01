import 'package:flutter/material.dart';

class StartRequest extends StatefulWidget {
  @override
  _StartRequestState createState() => _StartRequestState();
}

class _StartRequestState extends State<StartRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Card(
                child: Container(
                  width: 909,
                  height: 90,
                  child: Center(
                    child: Text(
                        "سيتم توفير جميع الملخصات والملازم المساعدة\n والجاهزه للطباعة"),
                  ),
                ),
              ),
                           SizedBox(height: MediaQuery.of(context).size.height / 55),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("الجامعة"),
                  Text("مدرسة"),
                ],
              ),
              Text("الجامعة"),
              Text("الكلية"),
              Text("التتخصص"),
            ],
          ),
        ],
      ),
    );
  }
}
