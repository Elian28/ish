//A5
import 'package:flutter/material.dart';

class A5 extends StatefulWidget {
  @override
  _A5State createState() => _A5State();
}

class _A5State extends State<A5> {
  int number1 = 1;
  int number2 = 1;
  int _radioValue;
  int _radioValue1;
  int _radioValue2;
  int _radioValue3;

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Container(
        width: 400,
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              ' نوع الورق ',
              style: TextStyle(
                  fontSize: _mediaQuery.height / 40,
                  color: Colors.blue,
                  fontWeight: FontWeight.w900),
            ),
            // نوع الورق
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
                  groupValue: _radioValue1,
                  onChanged: (int value) {
                    setState(() {
                      _radioValue1 = value;
                    });
                  },
                ),
                new Text(
                  'ملون',
                  style: new TextStyle(
                    fontSize: 16.0,
                  ),
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
                  'اسود',
                  style: new TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            //جوانب الصفحة
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  ' جوانب الصفحة',
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
                  'وجهه',
                  style: new TextStyle(
                    fontSize: 16.0,
                  ),
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
                  'وجهين',
                  style: new TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(21.0),
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
                        groupValue: _radioValue3,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3 = value;
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
                        groupValue: _radioValue3,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3 = value;
                          });
                        },
                      ),
                      new Text(
                        'تدبيس جانبي',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      new Radio(
                        activeColor: Colors.blue,
                        value: 2,
                        groupValue: _radioValue3,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3 = value;
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
                        value: 3,
                        groupValue: _radioValue3,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3 = value;
                          });
                        },
                      ),
                      new Text(
                        "تخييط",
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      new Radio(
                        activeColor: Colors.blue,
                        value: 4,
                        groupValue: _radioValue3,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3 = value;
                          });
                        },
                      ),
                      new Text(
                        'سلك',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      new Radio(
                        activeColor: Colors.blue,
                        value: 5,
                        groupValue: _radioValue3,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3 = value;
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
                        value: 6,
                        groupValue: _radioValue3,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3 = value;
                          });
                        },
                      ),
                      Text(
                        'كعب مسمار',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
