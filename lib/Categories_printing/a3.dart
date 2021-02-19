import 'package:flutter/material.dart';

class A3 extends StatefulWidget {
  @override
  _A3State createState() => _A3State();
}

class _A3State extends State<A3> {
  int number1 = 1;
  int number2 = 1;
  int radioValue;
  int radioValue1;
  int radioValue2;
  int radioValue3;

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Container(
        child: Column(
      children: <Widget>[
        // نوع الورق
        Column(
          children: <Widget>[
            Text(
              ' نوع الورق',
              style: TextStyle(
                  fontSize: _mediaQuery.height / 40,
                  color: Colors.blue,
                  fontWeight: FontWeight.w900),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Radio(
                  activeColor: Colors.blue,
                  value: 0,
                  groupValue: radioValue,
                  onChanged: (int value) {
                    setState(() {
                      radioValue = value;
                    });
                  },
                ),
                new Text(
                  'عادي',
                  style: new TextStyle(fontSize: 16.0),
                ),
                new Radio(
                  activeColor: Colors.blue,
                  value: 1,
                  groupValue: radioValue,
                  onChanged: (int value) {
                    setState(() {
                      radioValue = value;
                    });
                  },
                ),
                new Text(
                  'لماع',
                  style: new TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                //
                new Radio(
                  activeColor: Colors.blue,
                  value: 2,
                  groupValue: radioValue,
                  onChanged: (int value) {
                    setState(() {
                      radioValue = value;
                    });
                  },
                ),
                new Text(
                  'مقوي',
                  style: new TextStyle(
                    fontSize: 16.0,
                  ),
                ),

                new Radio(
                  activeColor: Colors.blue,
                  value: 3,
                  groupValue: radioValue,
                  onChanged: (int value) {
                    setState(() {
                      radioValue = value;
                    });
                  },
                ),
                new Text(
                  ' لاصق',
                  style: new TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ],
        ),

        Text(
          ' لون الحبر',
          style: TextStyle(
              fontSize: _mediaQuery.height / 40,
              color: Colors.blue,
              fontWeight: FontWeight.w900),
        ),
        // لون الطباعة
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Radio(
              activeColor: Colors.blue,
              value: 0,
              groupValue: radioValue1,
              onChanged: (int value) {
                setState(() {
                  radioValue1 = value;
                });
              },
            ),
            new Text(
              'اسود',
              style: new TextStyle(fontSize: 16.0),
            ),
            new Radio(
              activeColor: Colors.blue,
              value: 1,
              groupValue: radioValue1,
              onChanged: (int value) {
                setState(() {
                  radioValue1 = value;
                });
              },
            ),
            new Text(
              'ملون',
              style: new TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),

        // خيارات التغليف
        Column(
          children: <Widget>[
            Text(
              ' خيارات التغليف',
              style: TextStyle(
                  fontSize: _mediaQuery.height / 40,
                  color: Colors.blue,
                  fontWeight: FontWeight.w900),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    new Radio(
                      activeColor: Colors.blue,
                      value: 0,
                      groupValue: radioValue2,
                      onChanged: (int value) {
                        setState(() {
                          radioValue2 = value;
                        });
                      },
                    ),
                    new Text(
                      'بدون تغليف',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Radio(
                      value: 1,
                      groupValue: radioValue2,
                      onChanged: (int value) {
                        setState(() {
                          radioValue2 = value;
                        });
                      },
                    ),
                    new Text(
                      'تدييس ركن',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Radio(
                      value: 2,
                      groupValue: radioValue2,
                      onChanged: (int value) {
                        setState(() {
                          radioValue2 = value;
                        });
                      },
                    ),
                    new Text(
                      'حافظ انبوبي',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ));
  }
}
