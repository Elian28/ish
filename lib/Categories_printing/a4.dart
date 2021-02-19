// A4
import 'package:flutter/material.dart';


class A4 extends StatefulWidget {
  @override
  _A4State createState() => _A4State();
}

class _A4State extends State<A4> {
  int number1 = 1;
  int number2 = 1;
  int _radioValue;
  int _radioValue1;
  int _radioValue2;
  int _radioValue3;
  int _radioValue4;

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Center(
      child: Container(
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
                    groupValue: _radioValue,
                    onChanged: (int value) {
                      setState(() {
                        _radioValue = value;
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
                    groupValue: _radioValue,
                    onChanged: (int value) {
                      setState(() {
                        _radioValue = value;
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
                    groupValue: _radioValue,
                    onChanged: (int value) {
                      setState(() {
                        _radioValue = value;
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
                    groupValue: _radioValue,
                    onChanged: (int value) {
                      setState(() {
                        _radioValue = value;
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

          // لون الطباعة
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                ' لون الحبر',
                style: TextStyle(
                    fontSize: _mediaQuery.height / 50,
                    color: Colors.blue,
                    fontWeight: FontWeight.w900),
              ),
              new Radio(
                activeColor: Colors.blue,
                value: 0,
                groupValue: _radioValue2,
                onChanged: (int value) {
                  setState(() {
                    _radioValue2 = value;
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
                groupValue: _radioValue2,
                onChanged: (int value) {
                  setState(() {
                    _radioValue2 = value;
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

          //جانب الطباعة
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                ' تخطيط الصفحة',
                style: TextStyle(
                    fontSize: _mediaQuery.height / 50,
                    color: Colors.blue,
                    fontWeight: FontWeight.w900),
              ),
              new Radio(
                activeColor: Colors.blue,
                value: 0,
                groupValue: _radioValue1,
                onChanged: (int value) {
                  setState(() {
                    _radioValue1 = value;
                  });
                },
              ),
              new Text(
                'عامودي',
                style: new TextStyle(fontSize: 16.0),
              ),
              new Radio(
                activeColor: Colors.blue,
                value: 1,
                groupValue: _radioValue1,
                onChanged: (int value) {
                  setState(() {
                    _radioValue1 = value;
                  });
                },
              ),
              new Text(
                'افقي',
                style: new TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),

          //جانب الطباعة
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                ' خيارات الطباعة',
                style: TextStyle(
                    fontSize: _mediaQuery.height / 50,
                    color: Colors.blue,
                    fontWeight: FontWeight.w900),
              ),
              new Radio(
                activeColor: Colors.blue,
                value: 0,
                groupValue: _radioValue3,
                onChanged: (int value) {
                  setState(() {
                    _radioValue3 = value;
                  });
                },
              ),
              new Text(
                'وجهه',
                style: new TextStyle(fontSize: 16.0),
              ),
              new Radio(
                activeColor: Colors.blue,
                value: 1,
                groupValue: _radioValue3,
                onChanged: (int value) {
                  setState(() {
                    _radioValue3 = value;
                  });
                },
              ),
              new Text(
                'وجهين',
                style: new TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),

          // خيارات التغليف
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  ' خيارات التغليف',
                  style: TextStyle(
                      fontSize: _mediaQuery.height / 40,
                      color: Colors.blue,
                      fontWeight: FontWeight.w900),
                ),
                Row(
                  children: <Widget>[
                    new Radio(
                      activeColor: Colors.blue,
                      value: 0,
                      groupValue: _radioValue4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValue4 = value;
                        });
                      },
                    ),
                    new Text(
                      'بدون تغليف',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      activeColor: Colors.blue,
                      value: 1,
                      groupValue: _radioValue4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValue4 = value;
                        });
                      },
                    ),
                    new Text(
                      'كيس شفاف',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      activeColor: Colors.blue,
                      value: 2,
                      groupValue: _radioValue4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValue4 = value;
                        });
                      },
                    ),
                    new Text(
                      'تدبيس ركن',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                //
                Row(
                  children: <Widget>[
                    new Radio(
                      activeColor: Colors.blue,
                      value: 4,
                      groupValue: _radioValue4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValue4 = value;
                        });
                      },
                    ),
                    new Text(
                      'تدبيس جانبي',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      activeColor: Colors.blue,
                      value: 5,
                      groupValue: _radioValue4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValue4 = value;
                        });
                      },
                    ),
                    new Text(
                      'سلك',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      activeColor: Colors.blue,
                      value: 6,
                      groupValue: _radioValue4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValue4 = value;
                        });
                      },
                    ),
                    new Text(
                      'بلاستيك حلزوني',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Radio(
                      activeColor: Colors.blue,
                      value: 7,
                      groupValue: _radioValue4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValue4 = value;
                        });
                      },
                    ),
                    new Text(
                      'كعب مسمار',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      activeColor: Colors.blue,
                      value: 8,
                      groupValue: _radioValue4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValue4 = value;
                        });
                      },
                    ),
                    new Text(
                      'كعب حراري',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      activeColor: Colors.blue,
                      value: 9,
                      groupValue: _radioValue4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValue4 = value;
                        });
                      },
                    ),
                    new Text(
                      'تخييط',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Radio(
                      activeColor: Colors.blue,
                      value: 10,
                      groupValue: _radioValue4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValue4 = value;
                        });
                      },
                    ),
                    new Text(
                      'ملف خرمين',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      activeColor: Colors.blue,
                      value: 11,
                      groupValue: _radioValue4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValue4 = value;
                        });
                      },
                    ),
                    new Text(
                      'ملف ٣ اخرام',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
