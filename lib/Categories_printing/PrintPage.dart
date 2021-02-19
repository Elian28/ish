import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'a0.dart';
import 'a1.dart';
import 'a2.dart';
import 'a3.dart';
import 'a4.dart';
import 'a5.dart';

class PrintPages1 extends StatefulWidget {
  @override
  _PrintPages1State createState() => _PrintPages1State();
}

class _PrintPages1State extends State<PrintPages1> {
  // A0 _a0;
  final Map<int, Widget> children = <int, Widget>{
    //   0: Text('A0'),
    1: Text('A1'),
    2: Text('A2'),
    3: Text('A3'),
    4: Text('A4'),
    5: Text('A5'),
  };

  final Map<int, Widget> icons = <int, Widget>{
    0: A0(),
    1: A1(),
    2: A2(),
    3: A3(),
    4: A4(),
    5: A5(),
  };

  int sharedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: MediaQuery.of(context).size.width / 1.04,
            height: MediaQuery.of(context).size.height / 1.3,
            decoration: new BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: new BorderRadius.all(Radius.circular(10))),
            child: Card(elevation: 6),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 1),
        child: SizedBox(
          width: 500.0,
          child: CupertinoSegmentedControl<int>(
            borderColor: Colors.blueGrey,
            pressedColor: Colors.blueGrey,
            selectedColor: Colors.white,
            unselectedColor: Colors.cyan,
            children: children,
            onValueChanged: (int newValue) {
              setState(() {
                sharedValue = newValue;
              });
            },
            // اللون المتنقل
            groupValue: sharedValue,
          ),
        ),
      ),

      // حدود الصفحة
      Container(
        child: icons[sharedValue],
      ),
    ]);
  }
}
