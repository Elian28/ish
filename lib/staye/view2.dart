import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptint/3/app.dart';
import 'package:ptint/staye/pri..dart';
import 'package:ptint/staye/pri1..dart';
import 'package:ptint/staye/pri2.dart';
import 'package:ptint/staye/pri3.dart';
import 'package:ptint/themes/LightColor.dart';

import '_GradientPainter.dart';

class ViewHom extends StatefulWidget {
  @override
  _ViewHomState createState() => _ViewHomState();
}

class _ViewHomState extends State<ViewHom> {
  bool _osLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: LightColor.grey,
        appBar: AppBar(),
        endDrawer: AppDrawer1(),
        body: _osLoading ? _loading() : _form(context));
  }

  Widget _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _form(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            UnicornOutlineButton(
              strokeWidth: 2,
              radius: 16,
              gradient:
                  LinearGradient(colors: [Colors.black, Colors.redAccent]),
              child: Text('مطبوعات الورقية', style: TextStyle(fontSize: 16)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Pri()));
              },
            ),
            SizedBox(
                width: 18, height: MediaQuery.of(context).size.height / 55),
            UnicornOutlineButton(
              strokeWidth: 2,
              radius: 16,
              gradient:
                  LinearGradient(colors: [Colors.black, Colors.redAccent]),
              child:
                  Text('البنرات والاستاندات', style: TextStyle(fontSize: 16)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Pri1()));
              },
            ),
            SizedBox(
                width: 18, height: MediaQuery.of(context).size.height / 55),
            UnicornOutlineButton(
              strokeWidth: 2,
              radius: 16,
              gradient:
                  LinearGradient(colors: [Colors.black, Colors.redAccent]),
              child: Text('اللوحات الدعائية والتجارية',
                  style: TextStyle(fontSize: 16)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Pri2()));
              },
            ),
            SizedBox(
                width: 18, height: MediaQuery.of(context).size.height / 55),
            UnicornOutlineButton(
              strokeWidth: 2,
              radius: 16,
              gradient:
                  LinearGradient(colors: [Colors.black, Colors.redAccent]),
              child: Text('الهداية الاعلانية', style: TextStyle(fontSize: 16)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Pri3()));
              },
            ),
          ],
        ),
        SizedBox(width: 0, height: MediaQuery.of(context).size.height / 55),
      ],
    );
  }

// كروت شخصية
}
/* 
كروت شخصية


اصنع لنفسك تعريفا مميزا بكرت شخصي ذو تصميم طولي جذاب. هذا المنتج مناسب لعرض معلوماتك بشكل مختصر، متوفر بثلاث خامات: ملمس ناعم - خشن - فاخر يمكنك طلب هذا المنتج ابتداء من كمية ١٠٠ إلى ١٠ آلاف



أكثر المنتجات انتشارا في الشركات والمشاريع الصغيرة. يتميز الكرت العرضي بنقل المعلومات الواضحة عن هويتك وما يمكنك القيام به بطريقة فريدة، متوفر بثلاث خامات: ملمس ناعم - خشن - فاخر يمكنك طلب هذا المنتج ابتداء من كمية ١٠٠ إلى ١٠ آلاف



هو المنتج الأكثر وفرة في المعلومات التي يحتوي عليها. متوفر بثلاث خامات: ملمس ناعم - خشن - فاخر يمكنك طلب هذا المنتج ابتداء من كمية ١٠٠ إلى ١٠ آلاف



هذا المنتج يعد الأفضل حيث يختصر المساحة ويوفر المعلومة المهمة والقيمة. متوفر بثلاث خامات: ملمس ناعم - خشن - فاخر يمكنك طلب هذا المنتج ابتداء من كمية ١٠٠ إلى ١٠ آلاف



كاختيار مميز وعملي تم تصميم هذا الكرت ذو الزوايا المستديرة والتي يمكنك اختيار استدارتها في كل الزوايا أو زوايا محددة. متوفر بثلاث خامات: ملمس ناعم - خشن - فاخر يمكنك طلب هذا المنتج ابتداء من كمية ١٠٠ إلى ١٠ آلاف
 */

/* 


فى نفس اليوم
1
كتاب مشروع تخرج
2
كروت شخصية
3
بروشور / فلاير
4
فولدر
5
ورق مراسلات
6
أظرف
7
بوستر / ستيكر
8
مانيوال تدريبي / كتاب
9
شهادات
10
مجلات
11
كتالوج / منيو طعام
12
تذاكر
13
رسالة علمية
14
طباعة ألوان / إسود
15
لوحات أوتوكاد
16
رول أب
17
أوت دور
18
إن دور
19
بلوك نوت
20
كارت ID
 */
