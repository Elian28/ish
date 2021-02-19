import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ptint/themes/LightColor.dart';
import 'package:ptint/themes/TitleText.dart';


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

  Animation colorTweenForegroundOn;
  Animation colorTweenForegroundOff;

  int _currentIndex = 0;

  int _prevControllerIndex = 0;

  double _aniValue = 0.0;

  double _prevAniValue = 0.0;

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

  ScrollController _scrollController = ScrollController();

  List _keys = [];
  bool _buttonTap = false;

  int _numA0_0 = -1;
  int _numA0_1 = -1;
  int _numA0_2 = -1;

  int _numA1_0 = -1;
  var radioValueA0;
  var radioValue1A0;
  var radioValue2A0;
  //A1
  int _radioValueA1 = -1;
  String radioValueA1;
  String radioValue1A1;
  String radioValue2A1;
  int _numA2_0 = -1;
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
      _numA2_0 = value;
      switch (_numA2_0) {
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

  void _voidA0_0(value) {
    setState(() {
      _numA0_0 = value;
      switch (_numA0_0) {
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

  void _voidA0_1(value) {
    setState(() {
      _numA0_1 = value;
      switch (_numA0_1) {
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

  void _voidA0_2(value) {
    setState(() {
      _numA0_2 = value;
      switch (_numA0_2) {
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

  @override
  void initState() {
    super.initState();

    for (int index = 0; index < _txt.length; index++) {
      _keys.add(GlobalKey());
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
    colorTweenForegroundOff =
        ColorTween(begin: _foregroundOn, end: _foregroundOff)
            .animate(_animationControllerOff);

    _animationControllerOn =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    _animationControllerOn.value = 1.0;
    _colorTweenBackgroundOn =
        ColorTween(begin: _backgroundOff, end: _backgroundOn)
            .animate(_animationControllerOn);
    colorTweenForegroundOn =
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
        backgroundColor: Colors.white,
        body: Column(children: <Widget>[
          Container(
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
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: AnimatedBuilder(
                              animation: _colorTweenBackgroundOn,
                              builder: (context, child) => FlatButton(
                                  color: _getBackgroundColor(index),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.0)),
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
        duration: Duration(milliseconds: 150), curve: Curves.easeInOut);
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

  Widget a0(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return ListView(
      children: [
        Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TEXT(
              txt: " حجم الورق    A0 :841 X 1189 ",
              size: _mediaQuery.height / 50,
              align: TextAlign.center,
            ),
          ],
        ),
        Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: LightColor.darkgrey, width: 1.0),
              borderRadius: BorderRadius.circular(90)),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <
              Widget>[
            Divider(
              height: 30,
              color: LightColor.background,
            ),
            _txts(
                txts: 'نوع الورق',
                size: _mediaQuery.height / 45,
                color: LightColor.darkgrey),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              _radio(0, _numA0_0, _voidA0_0),
              _txts(txts: 'عادي', size: _mediaQuery.height / 50),
              _radio(1, _numA0_0, _voidA0_0),
              _txts(txts: ' فلم ابيض', size: _mediaQuery.height / 50)
            ]),
            Divider(height: 12),
            Align(
              alignment: Alignment.bottomRight,
              child: _txts(
                  txts: 'لون الحبر',
                  size: _mediaQuery.height / 50,
                  color: LightColor.darkgrey),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              _radio(0, _numA0_1, _voidA0_1),
              _txts(txts: 'اسود', size: _mediaQuery.height / 50),
              _radio(1, _numA0_1, _voidA0_1),
              _txts(txts: 'ملون', size: _mediaQuery.height / 50)
            ]),
            Divider(height: 12),
            Align(
              alignment: Alignment.bottomRight,
              child: _txts(
                  txts: ' خيارات التغليف',
                  size: _mediaQuery.height / 50,
                  color: LightColor.darkgrey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _radio(0, _numA0_2, _voidA0_2),
                _txts(txts: ' بدون تغليف', size: _mediaQuery.height / 50),
                _radio(1, _numA0_2, _voidA0_2),
                _txts(txts: ' حافظ انبوبي ', size: _mediaQuery.height / 50),
              ],
            ),
            Divider(
              height: 50,
              color: LightColor.background,
            ),
          ]),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                child: Column(children: <Widget>[
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TEXT(
                      txt: "اذا كنت تريد ارسال الملخص",
                      size: _mediaQuery.height / 50),
                  FlatButton(
                      child: Text(
                        "اضغط هنا",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        /*   Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AddPrint())); */
                      })
                ],
              ),
              /*  RaisedButton(
                  color: Colors.cyan[400],
                  child: TEXT(txt: "طباعة"),
                  onPressed: () async {
                    Navigator.pop(context);
                    Fluttertoast.showToast(
                        msg: "تم ارسال الطلب بنجاح ",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.cyan[800],
                        textColor: Colors.white,
                        fontSize: MediaQuery.of(context).size.height / 35);
                  }) */
            ])))
      ],
    );
  }

  Widget a1(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return ListView(
      children: [
        Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TEXT(txt: " حجم الوررق A0 : ", size: _mediaQuery.height / 50),
            FlatButton(
                child: Text(
                  " 841  " + "X" + " 1189" + "\nmm",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  /*   Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AddPrint())); */
                })
          ],
        ),
        Card(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: LightColor.darkgrey, width: 1.0),
                borderRadius: BorderRadius.circular(90)),
            child: Column(children: <Widget>[
              _txts(
                  txts: 'نوع الورق',
                  size: _mediaQuery.height / 45,
                  color: LightColor.darkgrey),
              Divider(height: 15),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _radio(0, _numA1_0, _voidA0_0),
                    _txts(
                      txts: 'عادي',
                      size: _mediaQuery.height / 50,
                    ),
                    _radio(1, _numA1_0, _voidA0_0),
                    _txts(
                      txts: 'فلم ابيض',
                      size: _mediaQuery.height / 50,
                    ),
                  ]),
              Divider(height: 15),
              _txts(
                  txts: 'لون الحبر',
                  size: _mediaQuery.height / 50,
                  color: LightColor.darkgrey),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _radio(0, _radioValueA1, _voidA0_1),
                    _txts(txts: 'اسود', size: _mediaQuery.height / 50),
                    _radio(1, _radioValueA1, _voidA0_1),
                    _txts(txts: 'ملون', size: _mediaQuery.height / 50)
                  ]),
              Divider(height: 15),
              _txts(
                  txts: 'خيارات التغليف',
                  size: _mediaQuery.height / 50,
                  color: LightColor.darkgrey),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _radio(0, _radioValueA1, _voidA0_2),
                    _txts(txts: 'بدون تغليف', size: _mediaQuery.height / 50),
                    _radio(1, _radioValueA1, _voidA0_2),
                    _txts(txts: 'حافظ انبوبي', size: _mediaQuery.height / 50)
                  ]),
              Divider(height: 30),
            ])),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                child: Column(children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TEXT(txt: "اذا كنت تريد ارسال الملخص"),
                    FlatButton(
                        child: Text(
                          "اضغط هنا",
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          /*   Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => AddPrint())); */
                        })
                  ]),
              RaisedButton(
                  color: Colors.cyan[400],
                  child: TEXT(txt: "طباعة"),
                  onPressed: () async {
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
            ])))
      ],
    );
  }

  Widget a2(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;

    return ListView(children: [
      TEXT(
        txt: " حجم الورق    A2 :420 X 594 ",
        size: _mediaQuery.height / 50,
        align: TextAlign.center,
      ),
      Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: LightColor.darkgrey, width: 1.0),
              borderRadius: BorderRadius.circular(90)),
          child: Column(
            children: <Widget>[
              _txts(
                  txts: ' نوع الورق',
                  size: _mediaQuery.height / 50,
                  color: LightColor.darkgrey),

              // نوع الورق
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio(
                        activeColor: Colors.blue,
                        value: 0,
                        groupValue: _numA2_0,
                        onChanged: _voidradioValueA2),

                    _txts(
                      txts: 'عادي',
                      size: _mediaQuery.height / 50,
                    ),
                    Radio(
                        activeColor: Colors.blue,
                        value: 1,
                        groupValue: _numA2_0,
                        onChanged: _voidradioValueA2),
                    _txts(
                      txts: 'فلم ابيض',
                      size: _mediaQuery.height / 50,
                    )
                    //
                  ]),
              _txts(
                  txts: ' لون الحبر',
                  size: _mediaQuery.height / 50,
                  color: LightColor.darkgrey),
              // لون الطباعة
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio(
                        activeColor: Colors.blue,
                        value: 0,
                        groupValue: _radioValue1A2,
                        onChanged: _voidradioValue1A2),
                    _txts(
                      txts: 'اسود',
                      size: _mediaQuery.height / 50,
                    ),
                    Radio(
                        activeColor: Colors.blue,
                        value: 1,
                        groupValue: _radioValue1A2,
                        onChanged: _voidradioValue1A2),
                    _txts(
                      txts: 'ملون',
                      size: _mediaQuery.height / 50,
                    )
                  ]),
              _txts(
                  txts: "خيارات التغليف",
                  size: _mediaQuery.height / 50,
                  color: LightColor.darkgrey),
              // خيارات التغليف
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio(
                        activeColor: Colors.blue,
                        value: 0,
                        groupValue: _radioValue2A2,
                        onChanged: _voidradioValue2A2),
                    _txts(
                      txts: 'بدون تغليف',
                      size: _mediaQuery.height / 50,
                    ),
                    Radio(
                        activeColor: Colors.blue,
                        value: 1,
                        groupValue: _radioValue2A2,
                        onChanged: _voidradioValue2A2),
                    _txts(
                      txts: 'حافظ انبوبي',
                      size: _mediaQuery.height / 50,
                    ),
                  ]),
            ],
          )),
      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              child: Column(children: <Widget>[
            Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TEXT(
                      txt: "اذا كنت تريد ارسال الملخص",
                      size: _mediaQuery.height / 50),
                  FlatButton(
                      child: Text(
                        "اضغط هنا",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        /*   Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AddPrint())); */
                      })
                ]),
            RaisedButton(
                color: Colors.cyan[400],
                child: TEXT(txt: "طباعة"),
                onPressed: () async {
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
          ])))
    ]);
  }

  Widget a3(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return ListView(
      children: [
        TEXT(
          txt: " حجم الورق    A3 : 297 X 420 ",
          size: _mediaQuery.height / 50,
          align: TextAlign.center,
        ),
        Card(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: LightColor.darkgrey, width: 1.0),
                borderRadius: BorderRadius.circular(90)),
            child: Column(
              children: <Widget>[
                // نوع الورق
                Column(
                  children: <Widget>[
                    _txts(
                        txts: ' نوع الورق',
                        size: _mediaQuery.height / 45,
                        color: LightColor.darkgrey),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio(
                              activeColor: Colors.blue,
                              value: 0,
                              groupValue: radioValueA3,
                              onChanged: (int value) {
                                setState(() {
                                  radioValueA3 = value;
                                });
                              },
                            ),
                            _txts(
                              txts: 'عادي',
                              size: _mediaQuery.height / 45,
                            ),
                            Radio(
                              activeColor: Colors.blue,
                              value: 1,
                              groupValue: radioValueA3,
                              onChanged: (int value) {
                                setState(() {
                                  radioValueA3 = value;
                                });
                              },
                            ),
                            _txts(txts: 'لماع', size: _mediaQuery.height / 60),
                            //
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                              activeColor: Colors.blue,
                              value: 2,
                              groupValue: radioValueA3,
                              onChanged: (int value) {
                                setState(() {
                                  radioValueA3 = value;
                                });
                              },
                            ),
                            _txts(txts: 'مقوي', size: _mediaQuery.height / 60),
                            Radio(
                              activeColor: Colors.blue,
                              value: 3,
                              groupValue: radioValueA3,
                              onChanged: (int value) {
                                setState(() {
                                  radioValueA3 = value;
                                });
                              },
                            ),
                            _txts(
                              txts: ' لاصق',
                              size: _mediaQuery.height / 60,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),

                _txts(
                    txts: ' لون الحبر',
                    size: _mediaQuery.height / 45,
                    color: LightColor.darkgrey),
                // لون الطباعة
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio(
                      activeColor: Colors.blue,
                      value: 0,
                      groupValue: radioValue1A3,
                      onChanged: (int value) {
                        setState(() {
                          radioValue1A3 = value;
                        });
                      },
                    ),
                    _txts(
                      txts: 'اسود',
                      size: _mediaQuery.height / 60,
                    ),
                    Radio(
                      activeColor: Colors.blue,
                      value: 1,
                      groupValue: radioValue1A3,
                      onChanged: (int value) {
                        setState(() {
                          radioValue1A3 = value;
                        });
                      },
                    ),
                    _txts(
                      txts: 'ملون',
                      size: _mediaQuery.height / 60,
                    ),
                  ],
                ),

                // خيارات التغليف
                Column(
                  children: <Widget>[
                    _txts(
                        txts: ' خيارات التغليف',
                        size: _mediaQuery.height / 45,
                        color: LightColor.darkgrey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Radio(
                          activeColor: Colors.blue,
                          value: 0,
                          groupValue: radioValue2A3,
                          onChanged: (int value) {
                            setState(() {
                              radioValue2A3 = value;
                            });
                          },
                        ),
                        _txts(
                          txts: 'بدون تغليف',
                          size: _mediaQuery.height / 60,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: radioValue2A3,
                          onChanged: (int value) {
                            setState(() {
                              radioValue2A3 = value;
                            });
                          },
                        ),
                        _txts(
                          txts: 'تدييس ركن',
                          size: _mediaQuery.height / 60,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Radio(
                          value: 2,
                          groupValue: radioValue2A3,
                          onChanged: (int value) {
                            setState(() {
                              radioValue2A3 = value;
                            });
                          },
                        ),
                        _txts(
                          txts: 'حافظ انبوبي',
                          size: _mediaQuery.height / 60,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                child: Column(children: <Widget>[
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TEXT(
                      txt: "اذا كنت تريد ارسال الملخص",
                      size: _mediaQuery.height / 50),
                  FlatButton(
                      child: Text(
                        "اضغط هنا",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        /*   Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AddPrint())); */
                      })
                ],
              ),
              RaisedButton(
                  color: Colors.cyan[400],
                  child: TEXT(txt: "طباعة"),
                  onPressed: () async {
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
            ])))
      ],
    );
  }

  Widget a4(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Center(
      child: Container(
          child: ListView(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TEXT(
            txt: " حجم الورق    A4 : 210 X 297 ",
            size: _mediaQuery.height / 50,
            align: TextAlign.center,
          ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio(
                      activeColor: Colors.blue,
                      value: 0,
                      groupValue: _radioValueA4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValueA4 = value;
                        });
                      },
                    ),
                    Text(
                      'عادي',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Radio(
                      activeColor: Colors.blue,
                      value: 1,
                      groupValue: _radioValueA4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValueA4 = value;
                        });
                      },
                    ),
                    Text(
                      'لماع',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    //
                    Radio(
                      activeColor: Colors.blue,
                      value: 2,
                      groupValue: _radioValueA4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValueA4 = value;
                        });
                      },
                    ),
                    Text(
                      'مقوي',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),

                    Radio(
                      activeColor: Colors.blue,
                      value: 3,
                      groupValue: _radioValueA4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValueA4 = value;
                        });
                      },
                    ),
                    Text(
                      ' لاصق',
                      style: TextStyle(
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
            child: Row(
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

                      Radio(
                        activeColor: Colors.blue,
                        value: 0,
                        groupValue: _radioValue2A4,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue2A4 = value;
                          });
                        },
                      ),
                      Text(
                        'اسود',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Radio(
                        activeColor: Colors.blue,
                        value: 1,
                        groupValue: _radioValue2A4,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue2A4 = value;
                          });
                        },
                      ),
                      Text(
                        'ملون',
                        style: TextStyle(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        ' تخطيط الصفحة',
                        style: TextStyle(
                            fontSize: _mediaQuery.height / 50,
                            color: Colors.blue,
                            fontWeight: FontWeight.w900),
                      ),
                      Radio(
                        activeColor: Colors.blue,
                        value: 0,
                        groupValue: _radioValue1A4,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue1A4 = value;
                          });
                        },
                      ),
                      Text(
                        'عامودي',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Radio(
                        activeColor: Colors.blue,
                        value: 1,
                        groupValue: _radioValue1A4,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue1A4 = value;
                          });
                        },
                      ),
                      Text(
                        'افقي',
                        style: TextStyle(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        ' خيارات الطباعة',
                        style: TextStyle(
                            fontSize: _mediaQuery.height / 50,
                            color: Colors.blue,
                            fontWeight: FontWeight.w900),
                      ),
                      Radio(
                        activeColor: Colors.blue,
                        value: 0,
                        groupValue: _radioValue3A4,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3A4 = value;
                          });
                        },
                      ),
                      Text(
                        'وجهه',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Radio(
                        activeColor: Colors.blue,
                        value: 1,
                        groupValue: _radioValue3A4,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3A4 = value;
                          });
                        },
                      ),
                      Text(
                        'وجهين',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Column(
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
                    Radio(
                      activeColor: Colors.blue,
                      value: 0,
                      groupValue: _radioValue4A4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValue4A4 = value;
                        });
                      },
                    ),
                    Text(
                      'بدون تغليف',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Radio(
                      activeColor: Colors.blue,
                      value: 1,
                      groupValue: _radioValue4A4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValue4A4 = value;
                        });
                      },
                    ),
                    Text(
                      'كيس شفاف',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Radio(
                      activeColor: Colors.blue,
                      value: 2,
                      groupValue: _radioValue4A4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValue4A4 = value;
                        });
                      },
                    ),
                    Text(
                      'تدبيس ركن',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                //
                Row(
                  children: <Widget>[
                    Radio(
                      activeColor: Colors.blue,
                      value: 4,
                      groupValue: _radioValue4A4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValue4A4 = value;
                        });
                      },
                    ),
                    Text(
                      'تدبيس جانبي',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Radio(
                      activeColor: Colors.blue,
                      value: 5,
                      groupValue: _radioValue4A4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValue4A4 = value;
                        });
                      },
                    ),
                    Text(
                      'سلك',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Radio(
                      activeColor: Colors.blue,
                      value: 6,
                      groupValue: _radioValue4A4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValue4A4 = value;
                        });
                      },
                    ),
                    Text(
                      'بلاستيك حلزوني',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      activeColor: Colors.blue,
                      value: 7,
                      groupValue: _radioValue4A4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValue4A4 = value;
                        });
                      },
                    ),
                    Text(
                      'كعب مسمار',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Radio(
                      activeColor: Colors.blue,
                      value: 8,
                      groupValue: _radioValue4A4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValue4A4 = value;
                        });
                      },
                    ),
                    Text(
                      'كعب حراري',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Radio(
                      activeColor: Colors.blue,
                      value: 9,
                      groupValue: _radioValue4A4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValue4A4 = value;
                        });
                      },
                    ),
                    Text(
                      'تخييط',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      activeColor: Colors.blue,
                      value: 10,
                      groupValue: _radioValue4A4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValue4A4 = value;
                        });
                      },
                    ),
                    Text(
                      'ملف خرمين',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Radio(
                      activeColor: Colors.blue,
                      value: 11,
                      groupValue: _radioValue4A4,
                      onChanged: (int value) {
                        setState(() {
                          _radioValue4A4 = value;
                        });
                      },
                    ),
                    Text(
                      'ملف ٣ اخرام',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  child: Column(children: <Widget>[
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TEXT(
                        txt: "اذا كنت تريد ارسال الملخص",
                        size: _mediaQuery.height / 50),
                    FlatButton(
                        child: Text(
                          "اضغط هنا",
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          /*   Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AddPrint())); */
                        })
                  ],
                ),
                RaisedButton(
                    color: Colors.cyan[400],
                    child: TEXT(txt: "طباعة"),
                    onPressed: () async {
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
              ])))
        ],
      )),
    );
  }

  Widget a5(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(8.0),
        child: ListView(children: <Widget>[
          TEXT(
            txt: " حجم الورق    A3 : 148 X 210 ",
            size: _mediaQuery.height / 50,
            align: TextAlign.center,
          ),
          // نوع الورق
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  ' نوع الورق ',
                  style: TextStyle(
                      fontSize: _mediaQuery.height / 40,
                      color: Colors.blue,
                      fontWeight: FontWeight.w900),
                ),
                Radio(
                  activeColor: Colors.blue,
                  value: 0,
                  groupValue: _radioValueA5,
                  onChanged: (int value) {
                    setState(() {
                      _radioValueA5 = value;
                    });
                  },
                ),
                Text(
                  'عادي',
                  style: TextStyle(fontSize: 16.0),
                ),
                Radio(
                  activeColor: Colors.blue,
                  value: 1,
                  groupValue: _radioValueA5,
                  onChanged: (int value) {
                    setState(() {
                      _radioValueA5 = value;
                    });
                  },
                ),
                Text(
                  'لماع',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                //
                Radio(
                  activeColor: Colors.blue,
                  value: 2,
                  groupValue: _radioValueA5,
                  onChanged: (int value) {
                    setState(() {
                      _radioValueA5 = value;
                    });
                  },
                ),
                Text(
                  'مقوي',
                  style: TextStyle(
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
                      border:
                          Border.symmetric(horizontal: BorderSide(width: 0.3)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          ' لون الحبر',
                          style: TextStyle(
                              fontSize: _mediaQuery.height / 50,
                              color: Colors.blue,
                              fontWeight: FontWeight.w900),
                        ),
                        Radio(
                          activeColor: Colors.blue,
                          value: 0,
                          groupValue: _radioValue1A5,
                          onChanged: (int value) {
                            setState(() {
                              _radioValue1A5 = value;
                            });
                          },
                        ),
                        Text(
                          'ملون',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Radio(
                          activeColor: Colors.blue,
                          value: 1,
                          groupValue: _radioValue1A5,
                          onChanged: (int value) {
                            setState(() {
                              _radioValue1A5 = value;
                            });
                          },
                        ),
                        Text(
                          'اسود',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //جوانب الصفحة
                  Container(
                    decoration: BoxDecoration(
                      border:
                          Border.symmetric(horizontal: BorderSide(width: 0.3)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          ' جوانب الصفحة',
                          style: TextStyle(
                              fontSize: _mediaQuery.height / 50,
                              color: Colors.blue,
                              fontWeight: FontWeight.w900),
                        ),
                        Radio(
                          activeColor: Colors.blue,
                          value: 0,
                          groupValue: _radioValue2A5,
                          onChanged: (int value) {
                            setState(() {
                              _radioValue2A5 = value;
                            });
                          },
                        ),
                        Text(
                          'وجهه',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Radio(
                          activeColor: Colors.blue,
                          value: 1,
                          groupValue: _radioValue2A5,
                          onChanged: (int value) {
                            setState(() {
                              _radioValue2A5 = value;
                            });
                          },
                        ),
                        Text(
                          'وجهين',
                          style: TextStyle(
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
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Column(
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
                      Radio(
                        activeColor: Colors.blue,
                        value: 0,
                        groupValue: _radioValue3A5,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3A5 = value;
                          });
                        },
                      ),
                      Text(
                        'تلقائي (طولي/عرضي)',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Radio(
                        activeColor: Colors.blue,
                        value: 1,
                        groupValue: _radioValue3A5,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3A5 = value;
                          });
                        },
                      ),
                      Text(
                        'شريحتين بورقة طولية',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  //
                  Row(
                    children: <Widget>[
                      Radio(
                        activeColor: Colors.blue,
                        value: 2,
                        groupValue: _radioValue3A5,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3A5 = value;
                          });
                        },
                      ),
                      Text(
                        'شرائح بورقة طولية',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      //
                      Radio(
                        activeColor: Colors.blue,
                        value: 3,
                        groupValue: _radioValue3A5,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3A5 = value;
                          });
                        },
                      ),
                      Text(
                        "شريحتين بورقة عرضية",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Radio(
                        activeColor: Colors.blue,
                        value: 4,
                        groupValue: _radioValue3A5,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3A5 = value;
                          });
                        },
                      ),
                      Text(
                        'شرائح بورقة عرضية',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Radio(
                        activeColor: Colors.blue,
                        value: 5,
                        groupValue: _radioValue3A5,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3A5 = value;
                          });
                        },
                      ),
                      Text(
                        'بلاستيك حلزوني',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Column(
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
                            Radio(
                              activeColor: Colors.blue,
                              value: 0,
                              groupValue: _radioValue4A5,
                              onChanged: (int value) {
                                setState(() {
                                  _radioValue4A5 = value;
                                });
                              },
                            ),
                            Text(
                              'بدون تغليف',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              activeColor: Colors.blue,
                              value: 1,
                              groupValue: _radioValue4A5,
                              onChanged: (int value) {
                                setState(() {
                                  _radioValue4A5 = value;
                                });
                              },
                            ),
                            Text(
                              "تغليف شفاف",
                              /*  'تدبيس جانبي', */
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              activeColor: Colors.blue,
                              value: 2,
                              groupValue: _radioValue4A5,
                              onChanged: (int value) {
                                setState(() {
                                  _radioValue4A5 = value;
                                });
                              },
                            ),
                            Text(
                              "ملف حلقتين",
                              /* 'تدبيس ركن', */
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        //
                        Row(children: <Widget>[
                          Radio(
                            activeColor: Colors.blue,
                            value: 3,
                            groupValue: _radioValue4A5,
                            onChanged: (int value) {
                              setState(() {
                                _radioValue4A5 = value;
                              });
                            },
                          ),
                          Text(
                            "ملف ثلاث حلقات",
                            /*    "تخييط", */
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Radio(
                            activeColor: Colors.blue,
                            value: 4,
                            groupValue: _radioValue4A5,
                            onChanged: (int value) {
                              setState(() {
                                _radioValue4A5 = value;
                              });
                            },
                          ),
                          Text(
                            'تغليف أنبوبي',
                            style: TextStyle(fontSize: 16.0),
                          )
                        ])
                      ]))),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  child: Column(children: <Widget>[
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TEXT(
                        txt: "اذا كنت تريد ارسال الملخص",
                        size: _mediaQuery.height / 50),
                    FlatButton(
                        child: Text(
                          "اضغط هنا",
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          /*   Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AddPrint())); */
                        })
                  ],
                ),
                RaisedButton(
                    color: Colors.cyan[400],
                    child: TEXT(txt: "طباعة"),
                    onPressed: () async {
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
              ])))
        ]));
  }

  Widget a6(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Container(
        width: 400,
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Text(
              ' نوع الورق ',
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
                  groupValue: _radioValueA5,
                  onChanged: (int value) {
                    setState(() {
                      _radioValueA5 = value;
                    });
                  },
                ),
                Text(
                  'عادي',
                  style: TextStyle(fontSize: 16.0),
                ),
                Radio(
                  activeColor: Colors.blue,
                  value: 1,
                  groupValue: _radioValueA5,
                  onChanged: (int value) {
                    setState(() {
                      _radioValueA5 = value;
                    });
                  },
                ),
                Text(
                  'لماع',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                //
                Radio(
                  activeColor: Colors.blue,
                  value: 2,
                  groupValue: _radioValueA5,
                  onChanged: (int value) {
                    setState(() {
                      _radioValueA5 = value;
                    });
                  },
                ),
                Text(
                  'مقوي',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            // لون الطباعة
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  ' لون الحبر',
                  style: TextStyle(
                      fontSize: _mediaQuery.height / 50,
                      color: Colors.blue,
                      fontWeight: FontWeight.w900),
                ),
                Radio(
                  activeColor: Colors.blue,
                  value: 0,
                  groupValue: _radioValue1A5,
                  onChanged: (int value) {
                    setState(() {
                      _radioValue1A5 = value;
                    });
                  },
                ),
                Text(
                  'ملون',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Radio(
                  activeColor: Colors.blue,
                  value: 1,
                  groupValue: _radioValue1A5,
                  onChanged: (int value) {
                    setState(() {
                      _radioValue1A5 = value;
                    });
                  },
                ),
                Text(
                  'اسود',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            //جوانب الصفحة
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  ' جوانب الصفحة',
                  style: TextStyle(
                      fontSize: _mediaQuery.height / 50,
                      color: Colors.blue,
                      fontWeight: FontWeight.w900),
                ),
                Radio(
                  activeColor: Colors.blue,
                  value: 0,
                  groupValue: _radioValue2A5,
                  onChanged: (int value) {
                    setState(() {
                      _radioValue2A5 = value;
                    });
                  },
                ),
                Text(
                  'وجهه',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Radio(
                  activeColor: Colors.blue,
                  value: 1,
                  groupValue: _radioValue2A5,
                  onChanged: (int value) {
                    setState(() {
                      _radioValue2A5 = value;
                    });
                  },
                ),
                Text(
                  'وجهين',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(21.0),
              child: Column(
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
                      Radio(
                        activeColor: Colors.blue,
                        value: 0,
                        groupValue: _radioValue3A5,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3A5 = value;
                          });
                        },
                      ),
                      Text(
                        'بدون تغليف',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Radio(
                        activeColor: Colors.blue,
                        value: 1,
                        groupValue: _radioValue3A5,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3A5 = value;
                          });
                        },
                      ),
                      Text(
                        'تدبيس جانبي',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  //
                  Row(
                    children: <Widget>[
                      Radio(
                        activeColor: Colors.blue,
                        value: 3,
                        groupValue: _radioValue3A5,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3A5 = value;
                          });
                        },
                      ),
                      Text(
                        "تخييط",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Radio(
                        activeColor: Colors.blue,
                        value: 4,
                        groupValue: _radioValue3A5,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3A5 = value;
                          });
                        },
                      ),
                      Text(
                        'سلك',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Radio(
                        activeColor: Colors.blue,
                        value: 5,
                        groupValue: _radioValue3A5,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3A5 = value;
                          });
                        },
                      ),
                      Text(
                        'بلاستيك حلزوني',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Radio(
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
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Radio(
                        activeColor: Colors.blue,
                        value: 2,
                        groupValue: _radioValue3A5,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue3A5 = value;
                          });
                        },
                      ),
                      Text(
                        'تدبيس ركن',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    child: Column(children: <Widget>[
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TEXT(
                          txt: "اذا كنت تريد ارسال الملخص",
                          size: _mediaQuery.height / 50),
                      FlatButton(
                          child: Text(
                            "اضغط هنا",
                            style: TextStyle(color: Colors.red),
                          ),
                          onPressed: () {
                            /*   Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AddPrint())); */
                          })
                    ],
                  ),
                  RaisedButton(
                      color: Colors.cyan[400],
                      child: TEXT(txt: "طباعة"),
                      onPressed: () async {
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
                ])))
          ],
        ));
  }

  Widget _radio(int values, int groupValues, Function(int) onChangeds) {
    return Radio(
        activeColor: Colors.blue,
        value: values,
        groupValue: groupValues,
        onChanged: onChangeds);
  }

  Widget _txts({String txts, double size, Color color = LightColor.skyBlue}) {
    return TEXT(
        txt: txts, size: size, color: color, fontWeight: FontWeight.w900);
  }
}
