/* import 'package:flutter/material.dart';

class Starting extends StatefulWidget {
  @override
  _StartingState createState() => _StartingState();
}

class _StartingState extends State<Starting> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      /* 
      انواع واحجام الورق
      ورق كبير
       A0 (841 x 1189mm)
       A1 (594 x 841mm)
       ورق وسط
       A0 (420 x 594mm)
       A1 (297 x 420mm)
        ورق صغير
       A0 (210 x 297mm)
       A1 (148 x 210mm)
       */
        /* 
     تحديد الكل - الملف - تفاصيل - عدد الورق - معاينه - حذف وتعديل
     اسم الملف : ريناد 1
     التفاصيل :2
     عادي,الوان,وجه,طولى,A4,شريحة واحدة في صفحة
     عدد الورق 13
     تعديل تطلع قائمة الطباعة

       */
      Text("الجامعة"),
      Text("الكلية"),
      Text("التخصص"),
      Text("البحث عن الكتاب"),
    ],);/* Column(
      children: <Widget>[
       Text("كرت شخصي"),
       Text("ملصقات صغيرة"),
       Text("دفاتر وملاحظات"),
       Text("فلايرات"),
       Text("كتب ومجلات"),
       Text("كتيبات"),
       Text("كانفاس قاش"),
       Text("رول اب مع ستاند"),
       Text("بروشورات"),
       Text("أكياس ورقية"),
       Text("بنر"),
       Text("ورق رسممي"),
       Text("ظـروف"),
       Text("ملصقات كبيره"),
      ],
    ); */
  }
} */
import 'package:flutter/material.dart';

class Starting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _my(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            // _form(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            FlatButton(onPressed: () {}, child: Text("منتجات اخرى"))
          ],
        ));
  }

  Widget form() {
    Widget bigCircle = Container(
      width: 300.0,
      height: 300.0,
      decoration: BoxDecoration(
        color: Colors.yellow[300],
        shape: BoxShape.circle,
      ),
    );
    return Stack(
      children: <Widget>[
        bigCircle,
        Positioned(
          child: Column(
            children: <Widget>[
              CircleButton(
                  onTap: () => print("Cool"), iconData: Icons.library_books),
              Text("اكياس ورقية"),
            ],
          ),
          top: 15.0,
          left: 122.0,
        ),
        Positioned(
          child: Column(
            children: <Widget>[
              CircleButton(
                  onTap: () => print("Cool"), iconData: Icons.library_books),
              Text("دفاتر"),
            ],
          ),
          top: 110.0,
          left: 10.0,
        ),
        Positioned(
          child: Column(
            children: <Widget>[
              CircleButton(
                  onTap: () => print("Cool"), iconData: Icons.library_books),
              Text("ملفات"),
            ],
          ),
          top: 110.0,
          right: 10.0,
        ),
        Positioned(
          child: Column(
            children: <Widget>[
              Text("ورق رسمي"),
              CircleButton(
                  onTap: () => print("Cool"), iconData: Icons.library_books),
            ],
          ),
          top: 220.0,
          left: 122.0,
        ),
        Positioned(
          child: Column(
            children: <Widget>[
              CircleButton(
                  onTap: () => print("Cool"), iconData: Icons.library_books),
              Text("رول اب مع استاند"),
            ],
          ),
          top: 110.0,
          left: 108.0,
        ),
      ],
    );
  }

  Widget _my() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // تحويل
            Column(
              children: <Widget>[
                Text("تنظيم"),
                 CircleButton(onTap: () {},iconData: Icons.autorenew),
              ],
            ),
            // تقسيم
            Column(
              children: <Widget>[
                Text("تقسيم"),
                 CircleButton(onTap: () {},iconData: Icons.content_cut),
              ],
            ),
            //دمج
            Column(
              children: <Widget>[
                Text("دمج"),
                 CircleButton(onTap: () {},
                    iconData: Icons.pie_chart_outlined),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // تحويل
            Column(
              children: <Widget>[
                Text("تحويل"),
                CircleButton(onTap: () {}, iconData: Icons.autorenew),
              ],
            ),
            // تقسيم
            Column(
              children: <Widget>[
                Text("التعرف علي نصوص OCR"),
                CircleButton(onTap: () {}, iconData: Icons.autorenew),
              ],
            ),
            //دمج
            Column(
              children: <Widget>[
                Text("تررقيم"),
                CircleButton(onTap: () {}, iconData: Icons.pie_chart_outlined),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget diversion() {
    return Column(
      children: <Widget>[
        Text("word"),
        Text("excel"),
        Text("powerPoint"),
      ],
    );
  }
}

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;

  const CircleButton({Key key, this.onTap, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 50.0;

    return InkResponse(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          iconData,
          color: Colors.black,
        ),
      ),
    );
  }
}
