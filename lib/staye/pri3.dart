import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptint/card/PersonalCards.dart';
import '_GradientPainter.dart';

class Pri3 extends StatefulWidget {
  @override
  _Pri3State createState() => _Pri3State();
}

class _Pri3State extends State<Pri3> {
  bool _osLoading = false;
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
            /*        leading: IconButton(
              icon: Icon(
                Icons.error,
                size: 30,
                color: Colors.blue,
              ),
              onPressed: () {}),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: new Text("حذف الطلب"),
                          content: new Text("سيتم حذف جميع الطلبات"),
                          actions: <Widget>[
                            new FlatButton(
                              child: new Text("حذف"),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HomesScreen()),
                                  ModalRoute.withName('/'),
                                );
                              },
                            ),
                            new FlatButton(
                              child: new Text("الغاء"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Icon(
                    Icons.clear,
                    color: Colors.red,
                    size: 30,
                  )),
            ),
          ],
          title: Text(""),
        */
            ),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            UnicornOutlineButton(
              strokeWidth: 2,
              radius: 16,
              gradient:
                  LinearGradient(colors: [Colors.black, Colors.redAccent]),
              child: Text('أختام ', style: TextStyle(fontSize: 16)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => LongPersonalCard()));
              },
            ),
            SizedBox(width: 18, height: MediaQuery.of(context).size.height / 55),
            UnicornOutlineButton(
              strokeWidth: 2,
              radius: 16,
              gradient:
                  LinearGradient(colors: [Colors.black, Colors.redAccent]),
              child: Text('دروع', style: TextStyle(fontSize: 16)),
              onPressed: () {},
            ),
            SizedBox(width: 18, height: MediaQuery.of(context).size.height / 55),
            UnicornOutlineButton(
              strokeWidth: 2,
              radius: 16,
              gradient:
                  LinearGradient(colors: [Colors.black, Colors.redAccent]),
              child: Text('أكياس', style: TextStyle(fontSize: 16)),
              onPressed: () {},
            ),
            SizedBox(width: 18, height: MediaQuery.of(context).size.height / 55),
          ],
        ),
        SizedBox(width: 0, height: MediaQuery.of(context).size.height / 55),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            UnicornOutlineButton(
              strokeWidth: 2,
              radius: 16,
              gradient:
                  LinearGradient(colors: [Colors.black, Colors.redAccent]),
              child: Text(' كاسات', style: TextStyle(fontSize: 16)),
              onPressed: () {},
            ),
            SizedBox(width: 18, height:  MediaQuery.of(context).size.height / 55),
            UnicornOutlineButton(
              strokeWidth: 2,
              radius: 16,
              gradient:
                  LinearGradient(colors: [Colors.black, Colors.redAccent]),
              child: Text('فنايل ', style: TextStyle(fontSize: 16)),
              onPressed: () {},
            ),
            SizedBox(width: 18, height: MediaQuery.of(context).size.height / 55),
            UnicornOutlineButton(
              strokeWidth: 2,
              radius: 16,
              gradient:
                  LinearGradient(colors: [Colors.black, Colors.redAccent]),
              child: Text('اقلام', style: TextStyle(fontSize: 16)),
              onPressed: () {},
            ),
            SizedBox(width: 18, height: MediaQuery.of(context).size.height / 55),
          ],
        ),
        SizedBox(width: 0, height: MediaQuery.of(context).size.height / 55),
        UnicornOutlineButton(
          strokeWidth: 2,
          radius: 16,
          gradient: LinearGradient(colors: [Colors.black, Colors.redAccent]),
          child: Text('حراري وسلك إسكرين', style: TextStyle(fontSize: 16)),
          onPressed: () {},
        ),
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
