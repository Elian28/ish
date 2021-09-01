/* import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '2/print/PrintPages.dart';
import 'themes.dart/TitleText.dart';

class HomePag extends StatefulWidget {
  @override
  _HomePagState createState() => _HomePagState();
}

class _HomePagState extends State<HomePag> with TickerProviderStateMixin {
  TabController _controller;

  AnimationController _animationControllerOn;

  AnimationController _animationControllerOff;

  Animation _colorTweenBackgroundOn;
  Animation _colorTweenBackgroundOff;

  Animation _colorTweenForegroundOn;
  Animation _colorTweenForegroundOff;

  int _currentIndex = 0;

  int _prevControllerIndex = 0;

  double _aniValue = 0.0;

  double _prevAniValue = 0.0;
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;

/*   switchStepType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }
 */
  List _txt = [
    "A0",
    "A1",
    "A2",
    "A3",
    "A4",
    "A5",
    "A6",
  ];

  Color _foregroundOn = Colors.white;
  Color _foregroundOff = Colors.black;

  Color _backgroundOn = Colors.blue;
  Color _backgroundOff = Colors.grey[300];

  ScrollController _scrollController = new ScrollController();

  List _keys = [];
  bool _buttonTap = false;

  int _radioValueA0 = -1;
  int _radioValue1A0 = -1;
  int _radioValue2A0 = -1;
  var radioValueA0;
  var radioValue1A0;
  var radioValue2A0;
  //A1
  int _radioValueA1 = -1;
  String radioValueA1;
  int _radioValue1A1 = -1;
  String radioValue1A1;
  int _radioValue2A1 = -1;
  String radioValue2A1;
  int _radioValueA2 = -1;
  int _radioValue1A2 = -1;
  int _radioValue2A2 = -1;
  var radioValueA2;
  var radioValue1A2;
  var radioValue2A2;
  int number1A3 = 1;
  int number2A3 = 1;
  int radioValueA3;
  int radioValue1A3;
  int radioValue2A3;
  int radioValue3A3;
  int number1A4 = 1;
  int number2A4 = 1;
  int _radioValueA4;
  int _radioValue1A4;
  int _radioValue2A4;
  int _radioValue3A4;
  int _radioValue4A4;
  int number1A5 = 1;
  int number2A5 = 1;
  int _radioValueA5;
  int _radioValue1A5;
  int _radioValue2A5;
  int _radioValue3A5;
  int _radioValue4A5;

  void _voidradioValueA2(value) {
    setState(() {
      _radioValueA2 = value;
      switch (_radioValueA2) {
        case 0:
          {
            radioValueA2 = "عادي";
            print("radioValue2 is $radioValueA2");
          }
          break;
        case 1:
          {
            radioValueA2 = "قلم ابيض";
            print("radioValue2 is $radioValueA2");
          }
          break;
      }
    });
  }

  void _voidradioValue1A2(value) {
    setState(() {
      _radioValue1A2 = value;
      switch (_radioValue1A2) {
        case 0:
          {
            radioValue1A2 = "اسود";
            print("radioValue2 is $radioValue1A2");
          }
          break;
        case 1:
          {
            radioValue1A2 = "ملون";
            print("radioValue2 is $radioValue1A2");
          }
          break;
      }
    });
  }

  void _voidradioValue2A2(value) {
    setState(() {
      _radioValue2A2 = value;
      switch (_radioValue2A2) {
        case 0:
          {
            radioValue2A2 = "بدون تغليف";
            print("radioValue2 is $radioValue2A2");
          }
          break;
        case 1:
          {
            radioValue2A2 = "حافظ انبوبي";
            print("radioValue2 is $radioValue2A2");
          }
          break;
      }
    });
  }

  void _voidradioValueA0(value) {
    setState(() {
      _radioValueA0 = value;
      switch (_radioValueA0) {
        case 0:
          {
            radioValueA0 = "عادي";
            print("radioValue2 is $radioValueA0");
          }
          break;
        case 1:
          {
            radioValueA0 = "قلم ابيض";
            print("radioValue2 is $radioValueA0");
          }
          break;
      }
    });
  }

  void _voidradioValue1A0(value) {
    setState(() {
      _radioValue1A0 = value;
      switch (_radioValue1A0) {
        case 0:
          {
            radioValue1A0 = "اسود";
            print("radioValue2 is $radioValue1A0");
          }
          break;
        case 1:
          {
            radioValue1A0 = "ملون";
            print("radioValue2 is $radioValue1A0");
          }
          break;
      }
    });
  }

  void _voidradioValue2A0(value) {
    setState(() {
      _radioValue2A0 = value;
      switch (_radioValue2A0) {
        case 0:
          {
            radioValue2A0 = "بدون تغليف";
            print("radioValue2 is $radioValue2A0");
          }
          break;
        case 1:
          {
            radioValue2A0 = "حافظ انبوبي";
            print("radioValue2 is $radioValue2A0");
          }
          break;
      }
    });
  }

  void _handleRadioValueChangeA1(value) {
    setState(() {
      _radioValueA1 = value;
      switch (_radioValueA1) {
        case 0:
          {
            radioValueA1 = "غير";
            print("radioValue5 is $radioValueA1");
          }
          break;
        case 1:
          {
            radioValueA1 = "عادي";
            print("radioValue5 is $radioValueA1");
          }
          break;
      }
    });
  }

  void _handleRadioValueChange1A1(value) {
    setState(() {
      _radioValue1A1 = value;
      switch (_radioValue1A1) {
        case 0:
          {
            radioValue1A1 = "غير";
            print("radioValue5 is $radioValue1A1");
          }
          break;
        case 1:
          {
            radioValue1A1 = "عادي";
            print("radioValue5 is $radioValue1A1");
          }
          break;
      }
    });
  }

  void _handleRadioValueChange2A1(value) {
    setState(() {
      _radioValue2A1 = value;
      switch (_radioValue2A1) {
        case 0:
          {
            radioValue2A1 = "غير";
            print("radioValue5 is $radioValue2A1");
          }
          break;
        case 1:
          {
            radioValue2A1 = "عادي";
            print("radioValue5 is $radioValue2A1");
          }
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    for (int index = 0; index < _txt.length; index++) {
      _keys.add(new GlobalKey());
    }

    _controller = TabController(vsync: this, length: _txt.length);
    _controller.animation.addListener(_handleTabAnimation);
    _controller.addListener(_handleTabChange);

    _animationControllerOff =
        AnimationController(vsync: this, duration: Duration(milliseconds: 75));
    _animationControllerOff.value = 1.0;
    _colorTweenBackgroundOff =
        ColorTween(begin: _backgroundOn, end: _backgroundOff)
            .animate(_animationControllerOff);
    _colorTweenForegroundOff =
        ColorTween(begin: _foregroundOn, end: _foregroundOff)
            .animate(_animationControllerOff);

    _animationControllerOn =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    _animationControllerOn.value = 1.0;
    _colorTweenBackgroundOn =
        ColorTween(begin: _backgroundOff, end: _backgroundOn)
            .animate(_animationControllerOn);
    _colorTweenForegroundOn =
        ColorTween(begin: _foregroundOff, end: _foregroundOn)
            .animate(_animationControllerOn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("الطباعة "),
        ),
        backgroundColor: Colors.white,
        body: Column(children: <Widget>[
          /*  Text(
              "ارفع ملفك ثم اختر خصائص الطباعة، ثم اضغط على خيار انتقل الى مرحلة التغليف لإضافة أنواع التغليفات في أسفل الصفحة أو خيار أضف ملف آخر لإضافة ملفات أخرى"), */
          ListTile(
            leading: TEXT(
              txt: "*ملحوظة !",
              color: Colors.red,
              size: 25,
            ),
            title: TEXT(
              txt:
                  "حجم الملف المسموح: 100MB, \nانواع الملفات المسموحة: doc, docx, ppt, pptx, pdf*",
              color: Colors.black,
              size: 12,
            ),
          ),
          ListTile(
            leading: TEXT(
              txt: "* ملحوظة هامة!",
              color: Colors.red,
              size: 21,
            ),
            title: TEXT(
              txt: "يرجاء الانتظار حتي يتم استكمال رفع الملف واظهار تنبيه بذلك",
              color: Colors.black,
              size: 12,
            ),
          ),
          _steppers(),
/*           Container(
              height: 49.0,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: _txt.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        key: _keys[index],
                        padding: EdgeInsets.all(6.0),
                        child: ButtonTheme(
                            child: AnimatedBuilder(
                          animation: _colorTweenBackgroundOn,
                          builder: (context, child) => FlatButton(
                              color: _getBackgroundColor(index),
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(7.0)),
                              onPressed: () {
                                setState(() {
                                  _buttonTap = true;
                                  _controller.animateTo(index);
                                  _setCurrentIndex(index);
                                  _scrollTo(index);
                                });
                              },
                              child: Text(
                                _txt[index],
                                // color: _getForegroundColor(index),
                              )),
                        )));
                  })),
          Flexible(
              child: TabBarView(
            controller: _controller,
            children: <Widget>[
              a0(context),
              a1(context),
              a2(context),
              a3(context),
              a4(context),
              a5(context),
              a6(context),
            ],
          )),
       */
        ]));
  }

  _handleTabAnimation() {
    _aniValue = _controller.animation.value;

    if (!_buttonTap && ((_aniValue - _prevAniValue).abs() < 1)) {
      _setCurrentIndex(_aniValue.round());
    }

    _prevAniValue = _aniValue;
  }

  _handleTabChange() {
    if (_buttonTap) _setCurrentIndex(_controller.index);

    if ((_controller.index == _prevControllerIndex) ||
        (_controller.index == _aniValue.round())) _buttonTap = false;

    _prevControllerIndex = _controller.index;
  }

  _setCurrentIndex(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });

      _triggerAnimation();
      _scrollTo(index);
    }
  }

  _triggerAnimation() {
    _animationControllerOn.reset();
    _animationControllerOff.reset();
    _animationControllerOn.forward();
    _animationControllerOff.forward();
  }

  _scrollTo(int index) {
    double screenWidth = MediaQuery.of(context).size.width;

    RenderBox renderBox = _keys[index].currentContext.findRenderObject();
    double size = renderBox.size.width;
    double position = renderBox.localToGlobal(Offset.zero).dx;

    double offset = (position + size / 2) - screenWidth / 2;

    if (offset < 0) {
      renderBox = _keys[0].currentContext.findRenderObject();
      position = renderBox.localToGlobal(Offset.zero).dx;

      if (position > offset) offset = position;
    } else {
      renderBox = _keys[_txt.length - 1].currentContext.findRenderObject();
      position = renderBox.localToGlobal(Offset.zero).dx;
      size = renderBox.size.width;

      if (position + size < screenWidth) screenWidth = position + size;

      if (position + size - offset < screenWidth) {
        offset = position + size - screenWidth;
      }
    }

    _scrollController.animateTo(offset + _scrollController.offset,
        duration: new Duration(milliseconds: 150), curve: Curves.easeInOut);
  }

  _getBackgroundColor(int index) {
    if (index == _currentIndex) {
      return _colorTweenBackgroundOn.value;
    } else if (index == _prevControllerIndex) {
      return _colorTweenBackgroundOff.value;
    } else {
      return _backgroundOff;
    }
  }

  _getForegroundColor(int index) {
    if (index == _currentIndex) {
      return _colorTweenForegroundOn.value;
    } else if (index == _prevControllerIndex) {
      return _colorTweenForegroundOff.value;
    } else {
      return _foregroundOff;
    }
  }

  Widget a0(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;

    return Container(
        child: ListView(
      children: <Widget>[
        Align(
            heightFactor: 2,
            alignment: Alignment.center,
            child: Icon(Icons.picture_as_pdf)),
        // SizedBox(height: 70,),
        Text(
          ' نوع الورق',
          style: TextStyle(
              fontSize: _mediaQuery.height / 40,
              color: Colors.blue,
              fontWeight: FontWeight.w900),
        ),
        // نوع الورق

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio(
                activeColor: Colors.blue,
                value: 0,
                groupValue: _radioValueA0,
                onChanged: _voidradioValueA0),

            Text(
              'عادي',
              style: TextStyle(fontSize: 16.0),
            ),
            Radio(
                activeColor: Colors.blue,
                value: 1,
                groupValue: _radioValueA0,
                onChanged: _voidradioValueA0),
            Text(
              'فلم ابيض',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            //
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio(
                activeColor: Colors.blue,
                value: 0,
                groupValue: _radioValue1A0,
                onChanged: _voidradioValue1A0),
            Text(
              'اسود',
              style: TextStyle(fontSize: _mediaQuery.height / 50),
            ),
            Radio(
                activeColor: Colors.blue,
                value: 1,
                groupValue: _radioValue1A0,
                onChanged: _voidradioValue1A0),
            Text(
              'ملون',
              style: TextStyle(fontSize: _mediaQuery.height / 50),
            ),
          ],
        ),
        SizedBox(
          height: _mediaQuery.height / 40,
        ),
        Text(
          "خيارات التغليف",
          style: TextStyle(
              fontSize: _mediaQuery.height / 40,
              color: Colors.blue,
              fontWeight: FontWeight.w900),
        ),
        // خيارات التغليف
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio(
                activeColor: Colors.blue,
                value: 0,
                groupValue: _radioValue2A0,
                onChanged: _voidradioValue2A0),
            Text(
              'بدون تغليف',
              style: TextStyle(fontSize: _mediaQuery.height / 50),
            ),
            Radio(
                activeColor: Colors.blue,
                value: 1,
                groupValue: _radioValue2A0,
                onChanged: _voidradioValue2A0),
            Text(
              'حافظ انبوبي',
              style: TextStyle(fontSize: _mediaQuery.height / 50),
            ),
          ],
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("اذا كنت تريد حفظ الملخص"),
                    FlatButton(
                      child: Text(
                        "اضغط هنا",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        /*   Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => AddPrint())); */
                      },
                    ),
                  ],
                ),
                RaisedButton(
                    color: Colors.cyan[400],
                    child: Text("طباعة"),
                    onPressed: () async {
                      /* A0_DB _a0 = A0_DB(
                  title: radioValueA0,
                  title2: radioValue1A0,
                  title3: radioValue2A0,
                ); */

                      //await _a0.Server_A0();

                      Navigator.pop(context);

                      Fluttertoast.showToast(
                          msg: "تم ارسال الطلب بنجاح ",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.cyan[800],
                          textColor: Colors.white,
                          fontSize: MediaQuery.of(context).size.height / 35);
                    })
              ],
            ),
          ),
        )
      ],
    ));
  }

  Widget a1(BuildContext context) {
    return new Container(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          new Text(
            'اختر:',
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Radio(
                value: 0,
                groupValue: _radioValueA1,
                onChanged: _handleRadioValueChangeA1,
              ),
              new Text(
                'غير ',
                style: new TextStyle(fontSize: 16.0),
              ),
              new Radio(
                value: 1,
                groupValue: _radioValueA1,
                onChanged: _handleRadioValueChangeA1,
              ),
              new Text(
                'عادي',
                style: new TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Radio(
                value: 0,
                groupValue: _radioValue1A1,
                onChanged: _handleRadioValueChange1A1,
              ),
              new Text(
                'غير ',
                style: new TextStyle(fontSize: 16.0),
              ),
              new Radio(
                value: 1,
                groupValue: _radioValue1A1,
                onChanged: _handleRadioValueChange1A1,
              ),
              new Text(
                'عادي',
                style: new TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Radio(
                value: 0,
                groupValue: _radioValue2A1,
                onChanged: _handleRadioValueChange2A1,
              ),
              new Text(
                'غير ',
                style: new TextStyle(fontSize: 16.0),
              ),
              new Radio(
                value: 1,
                groupValue: _radioValue2A1,
                onChanged: _handleRadioValueChange2A1,
              ),
              new Text(
                'عادي',
                style: new TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          RaisedButton(
            color: Colors.cyan[400],
            child: Text("طباعة"),
            onPressed: () async {
              //   if (_fromKey.currentState.validate()) {
              /*  A1_DB _a1 = A1_DB(
                  title: radioValueA1,
                  title2: radioValue1A1,
                  title3: radioValue2A1); */

              // await _a1.Server_A1();

              Navigator.pop(context);

              Fluttertoast.showToast(
                  msg: "تم ارسال الطلب بنجاح ",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.cyan[800],
                  textColor: Colors.white,
                  fontSize: MediaQuery.of(context).size.height / 35);
            },
          ),
        ]));
  }

  Widget a2(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;

    return Container(
        child: Column(
      children: <Widget>[
        Text(
          ' نوع الورق',
          style: TextStyle(
              fontSize: _mediaQuery.height / 40,
              color: Colors.blue,
              fontWeight: FontWeight.w900),
        ),
        // نوع الورق
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio(
                activeColor: Colors.blue,
                value: 0,
                groupValue: _radioValueA2,
                onChanged: _voidradioValueA2),

            Text(
              'عادي',
              style: TextStyle(fontSize: 16.0),
            ),
            Radio(
                activeColor: Colors.blue,
                value: 1,
                groupValue: _radioValueA2,
                onChanged: _voidradioValueA2),
            Text(
              'فلم ابيض',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            //
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio(
                activeColor: Colors.blue,
                value: 0,
                groupValue: _radioValue1A2,
                onChanged: _voidradioValue1A2),
            Text(
              'اسود',
              style: TextStyle(fontSize: _mediaQuery.height / 50),
            ),
            Radio(
                activeColor: Colors.blue,
                value: 1,
                groupValue: _radioValue1A2,
                onChanged: _voidradioValue1A2),
            Text(
              'ملون',
              style: TextStyle(fontSize: _mediaQuery.height / 50),
            ),
          ],
        ),
        SizedBox(
          height: _mediaQuery.height / 40,
        ),
        Text(
          "خيارات التغليف",
          style: TextStyle(
              fontSize: _mediaQuery.height / 40,
              color: Colors.blue,
              fontWeight: FontWeight.w900),
        ),
        // خيارات التغليف
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio(
                activeColor: Colors.blue,
                value: 0,
                groupValue: _radioValue2A2,
                onChanged: _voidradioValue2A2),
            Text(
              'بدون تغليف',
              style: TextStyle(fontSize: _mediaQuery.height / 50),
            ),
            Radio(
                activeColor: Colors.blue,
                value: 1,
                groupValue: _radioValue2A2,
                onChanged: _voidradioValue2A2),
            Text(
              'حافظ انبوبي',
              style: TextStyle(fontSize: _mediaQuery.height / 50),
            ),
          ],
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("اذا كنت تريد حفظ الملخص"),
                    FlatButton(
                      child: Text(
                        "اضغط هنا",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        /*    Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => AddPrint())); */
                      },
                    ),
                  ],
                ),
                RaisedButton(
                  color: Colors.cyan[400],
                  child: Text("طباعة"),
                  onPressed: () async {
                    //   if (_fromKey.currentState.validate()) {
                    /*   A0_DB _a0 = A0_DB(
                      title: radioValueA2,
                      title2: radioValue1A2,
                      title3: radioValue2A2,
                    );



                    await _a0.Server_A0();
 */
                    Navigator.pop(context);

                    Fluttertoast.showToast(
                        msg: "تم ارسال الطلب بنجاح ",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.cyan[800],
                        textColor: Colors.white,
                        fontSize: MediaQuery.of(context).size.height / 35);
                  },
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }

  Widget a3(BuildContext context) {
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
                  groupValue: radioValueA3,
                  onChanged: (int value) {
                    setState(() {
                      radioValueA3 = value;
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
                  groupValue: radioValueA3,
                  onChanged: (int value) {
                    setState(() {
                      radioValueA3 = value;
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
                  groupValue: radioValueA3,
                  onChanged: (int value) {
                    setState(() {
                      radioValueA3 = value;
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
                  groupValue: radioValueA3,
                  onChanged: (int value) {
                    setState(() {
                      radioValueA3 = value;
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
              groupValue: radioValue1A3,
              onChanged: (int value) {
                setState(() {
                  radioValue1A3 = value;
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
              groupValue: radioValue1A3,
              onChanged: (int value) {
                setState(() {
                  radioValue1A3 = value;
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
                      groupValue: radioValue2A3,
                      onChanged: (int value) {
                        setState(() {
                          radioValue2A3 = value;
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
                      groupValue: radioValue2A3,
                      onChanged: (int value) {
                        setState(() {
                          radioValue2A3 = value;
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
                      groupValue: radioValue2A3,
                      onChanged: (int value) {
                        setState(() {
                          radioValue2A3 = value;
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

  Widget a4(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Center(
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // نوع الورق
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Column(
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
                      groupValue: _radioValueA4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValueA4 = value;
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
                      groupValue: _radioValueA4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValueA4 = value;
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
                      groupValue: _radioValueA4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValueA4 = value;
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
                      groupValue: _radioValueA4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValueA4 = value;
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
          ),

          // لون الطباعة
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border:
                          Border.symmetric(horizontal: BorderSide(width: 0.3))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ' لون الحبر',
                        style: TextStyle(
                            fontSize: _mediaQuery.height / 50,
                            color: Colors.blue,
                            fontWeight: FontWeight.w900),
                      ),
                      /* SizedBox(
                        height: _mediaQuery.height / 22,
                      ), */

                      new Radio(
                        activeColor: Colors.blue,
                        value: 0,
                        groupValue: _radioValue2A4,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue2A4 = value;
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
                        groupValue: _radioValue2A4,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue2A4 = value;
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
                ),
                Container(
                  decoration: BoxDecoration(
                    border:
                        Border.symmetric(horizontal: BorderSide(width: 0.3)),
                  ),
                  child: new Column(
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
                        groupValue: _radioValue1A4,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue1A4 = value;
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
                        groupValue: _radioValue1A4,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue1A4 = value;
                          });
                        },
                      ),
                      new Text(
                        'افقي',
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      //
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border:
                          Border.symmetric(horizontal: BorderSide(width: 0.3))),
                  child: new Column(
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
                        groupValue: _radioValue3A4,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3A4 = value;
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
                        groupValue: _radioValue3A4,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3A4 = value;
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
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
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
                        groupValue: _radioValue4A4,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue4A4 = value;
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
                        groupValue: _radioValue4A4,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue4A4 = value;
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
                        groupValue: _radioValue4A4,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue4A4 = value;
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
                        groupValue: _radioValue4A4,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue4A4 = value;
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
                        groupValue: _radioValue4A4,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue4A4 = value;
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
                        groupValue: _radioValue4A4,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue4A4 = value;
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
                        groupValue: _radioValue4A4,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue4A4 = value;
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
                        groupValue: _radioValue4A4,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue4A4 = value;
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
                        groupValue: _radioValue4A4,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue4A4 = value;
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
                        groupValue: _radioValue4A4,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue4A4 = value;
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
                        groupValue: _radioValue4A4,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue4A4 = value;
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
          ),
        ],
      )),
    );
  }

  Widget a5(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            // نوع الورق
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    ' نوع الورق ',
                    style: TextStyle(
                        fontSize: _mediaQuery.height / 40,
                        color: Colors.blue,
                        fontWeight: FontWeight.w900),
                  ),
                  new Radio(
                    activeColor: Colors.blue,
                    value: 0,
                    groupValue: _radioValueA5,
                    onChanged: (int value) {
                      setState(() {
                        _radioValueA5 = value;
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
                    groupValue: _radioValueA5,
                    onChanged: (int value) {
                      setState(() {
                        _radioValueA5 = value;
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
                    groupValue: _radioValueA5,
                    onChanged: (int value) {
                      setState(() {
                        _radioValueA5 = value;
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
            ),
            //

            Padding(
              padding: const EdgeInsets.all(21.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // لون الطباعة
                    Container(
                      decoration: BoxDecoration(
                        border: Border.symmetric(
                            horizontal: BorderSide(width: 0.3)),
                      ),
                      child: new Column(
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
                            groupValue: _radioValue1A5,
                            onChanged: (int value) {
                              setState(() {
                                _radioValue1A5 = value;
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
                            groupValue: _radioValue1A5,
                            onChanged: (int value) {
                              setState(() {
                                _radioValue1A5 = value;
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
                    ),
                    //جوانب الصفحة
                    Container(
                      decoration: BoxDecoration(
                        border: Border.symmetric(
                            horizontal: BorderSide(width: 0.3)),
                      ),
                      child: new Column(
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
                            groupValue: _radioValue2A5,
                            onChanged: (int value) {
                              setState(() {
                                _radioValue2A5 = value;
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
                            groupValue: _radioValue2A5,
                            onChanged: (int value) {
                              setState(() {
                                _radioValue2A5 = value;
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
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(21.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      ' تنسيق الطباعة',
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
                          groupValue: _radioValue3A5,
                          onChanged: (int value) {
                            setState(() {
                              _radioValue3A5 = value;
                            });
                          },
                        ),
                        new Text(
                          'تلقائي (طولي/عرضي)',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                        new Radio(
                          activeColor: Colors.blue,
                          value: 1,
                          groupValue: _radioValue3A5,
                          onChanged: (int value) {
                            setState(() {
                              _radioValue3A5 = value;
                            });
                          },
                        ),
                        new Text(
                          'شريحتين بورقة طولية',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    //
                    Row(
                      children: <Widget>[
                        new Radio(
                          activeColor: Colors.blue,
                          value: 2,
                          groupValue: _radioValue3A5,
                          onChanged: (int value) {
                            setState(() {
                              _radioValue3A5 = value;
                            });
                          },
                        ),
                        new Text(
                          'شرائح بورقة طولية',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                        //
                        new Radio(
                          activeColor: Colors.blue,
                          value: 3,
                          groupValue: _radioValue3A5,
                          onChanged: (int value) {
                            setState(() {
                              _radioValue3A5 = value;
                            });
                          },
                        ),
                        new Text(
                          "شريحتين بورقة عرضية",
                          style: new TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        new Radio(
                          activeColor: Colors.blue,
                          value: 4,
                          groupValue: _radioValue3A5,
                          onChanged: (int value) {
                            setState(() {
                              _radioValue3A5 = value;
                            });
                          },
                        ),
                        new Text(
                          'شرائح بورقة عرضية',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                        new Radio(
                          activeColor: Colors.blue,
                          value: 5,
                          groupValue: _radioValue3A5,
                          onChanged: (int value) {
                            setState(() {
                              _radioValue3A5 = value;
                            });
                          },
                        ),
                        new Text(
                          'بلاستيك حلزوني',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(21.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
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
                          groupValue: _radioValue4A5,
                          onChanged: (int value) {
                            setState(() {
                              _radioValue4A5 = value;
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
                          groupValue: _radioValue4A5,
                          onChanged: (int value) {
                            setState(() {
                              _radioValue4A5 = value;
                            });
                          },
                        ),
                        new Text(
                          "تغليف شفاف",
                          /*  'تدبيس جانبي', */
                          style: new TextStyle(fontSize: 16.0),
                        ),
                        new Radio(
                          activeColor: Colors.blue,
                          value: 2,
                          groupValue: _radioValue4A5,
                          onChanged: (int value) {
                            setState(() {
                              _radioValue4A5 = value;
                            });
                          },
                        ),
                        new Text(
                          "ملف حلقتين",
                          /* 'تدبيس ركن', */
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
                          groupValue: _radioValue4A5,
                          onChanged: (int value) {
                            setState(() {
                              _radioValue4A5 = value;
                            });
                          },
                        ),
                        new Text(
                          "ملف ثلاث حلقات",
                          /*    "تخييط", */
                          style: new TextStyle(fontSize: 16.0),
                        ),
                        new Radio(
                          activeColor: Colors.blue,
                          value: 4,
                          groupValue: _radioValue4A5,
                          onChanged: (int value) {
                            setState(() {
                              _radioValue4A5 = value;
                            });
                          },
                        ),
                        new Text(
                          'تغليف أنبوبي',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                        new Radio(
                          activeColor: Colors.blue,
                          value: 5,
                          groupValue: _radioValue4A5,
                          onChanged: (int value) {
                            setState(() {
                              _radioValue4A5 = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

//

  Widget a6(BuildContext context) {
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
                  groupValue: _radioValueA5,
                  onChanged: (int value) {
                    setState(() {
                      _radioValueA5 = value;
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
                  groupValue: _radioValueA5,
                  onChanged: (int value) {
                    setState(() {
                      _radioValueA5 = value;
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
                  groupValue: _radioValueA5,
                  onChanged: (int value) {
                    setState(() {
                      _radioValueA5 = value;
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
                  groupValue: _radioValue1A5,
                  onChanged: (int value) {
                    setState(() {
                      _radioValue1A5 = value;
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
                  groupValue: _radioValue1A5,
                  onChanged: (int value) {
                    setState(() {
                      _radioValue1A5 = value;
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
                  groupValue: _radioValue2A5,
                  onChanged: (int value) {
                    setState(() {
                      _radioValue2A5 = value;
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
                  groupValue: _radioValue2A5,
                  onChanged: (int value) {
                    setState(() {
                      _radioValue2A5 = value;
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
                        groupValue: _radioValue3A5,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3A5 = value;
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
                        groupValue: _radioValue3A5,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3A5 = value;
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
                        groupValue: _radioValue3A5,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3A5 = value;
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
                        groupValue: _radioValue3A5,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3A5 = value;
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
                        groupValue: _radioValue3A5,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3A5 = value;
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
                        groupValue: _radioValue3A5,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3A5 = value;
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
                        groupValue: _radioValue3A5,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3A5 = value;
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

  Widget _steppers() {
    return Expanded(
      child: Stepper(
        physics: ClampingScrollPhysics(),
        steps: _listStepper(),
        type: stepperType,
        currentStep: this._currentStep,
        onStepTapped: (step) {
          setState(() {
            this._currentStep = step;
          });
        },
        onStepContinue: () {
          setState(() {
            if (this._currentStep < this._listStepper().length - 1) {
              this._currentStep = this._currentStep + 1;
            } else {
              //Logic
              print('complete');
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (this._currentStep > 0) {
              this._currentStep = this._currentStep - 1;
            } else {
              this._currentStep = 0;
            }
          });
        },
      ),
    );
  }

  List<Step> _listStepper() {
    List<Step> _steps = [
      Step(
          title: Text("رفع الملفات"),
          content: Column(
            children: <Widget>[
              ListTile(
                title: Center(child: Text("لرفع ملفك اضغط هنا")),
                subtitle: Icon(
                  Icons.cloud_download,
                  size: 100,
                  color: Colors.grey,
                ),
              )
            ],
          ),
          isActive: _currentStep >= 0,
          state: StepState.complete),
      Step(
          title: Text('تحديد التغليف'),
          content: Column(
            children: <Widget>[
              PrintPages(),
            ],
          ),
          isActive: _currentStep >= 1,
          state: StepState.disabled),
      Step(
          title: Text('السلة'),
          content: Column(
            children: <Widget>[
              Text("   المبلغ المستحق"),
              ListTile(
                leading: Text("مبلغ الطباعة "),
                title: Text("  :0 ريال"),
              ),
              ListTile(
                leading: Text("الضريبة المضافة"),
                title: Text("  0 %"),
              ),
              ListTile(
                leading: Text("الاجمالي : "),
                title: Text("  :0 ريال"),
              ),
              Text("الاجمالي بعد خصم العروض والكوبونات :0 ريال"),
            ],
          ),
          isActive: _currentStep >= 2,
          state: StepState.indexed),
/*       Step(
          title: Text('الدفع والاستلام'),
          content: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Confirm Password'),
              ),
            ],
          ),
          isActive: _currentStep >= 4,
          state: StepState.indexed), */
    ];
    return _steps;
  }
}
 */