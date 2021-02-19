import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> with TickerProviderStateMixin {
  // TickerProviderStateMixin يسمح بالتلاشي / التلاشي في الرسوم المتحركة عند تغيير الزر النشط

  // سيتحكم هذا في نقرات الزر وتغيير علامة التبويب
  TabController _controller;
// سيتحكم هذا في الرسم المتحرك عندما يتغير زر من حالة إيقاف إلى حالة تشغيل
  AnimationController _animationControllerOn;

// سيتحكم هذا في الرسم المتحرك عندما يتغير زر من حالة تشغيل إلى حالة إيقاف
  AnimationController _animationControllerOff;
// هذا سيعطي قيم لون الخلفية للزر عندما يتغير إلى حالة تشغيل
  Animation _colorTweenBackgroundOn;
  Animation _colorTweenBackgroundOff;
// سيعطي هذا قيم لون المقدمة للزر عندما يتغير إلى حالة تشغيل
  Animation _colorTweenForegroundOn;
  Animation _colorTweenForegroundOff;

// when swiping ، تتغير قيمة _controller.index فقط بعد الرسم المتحرك ، لذلك نحن بحاجة إلى ذلك لتشغيل الرسوم المتحركة وحفظ الفهرس الحالي
  int _currentIndex = 0;

  // saves the previous active tab
  int _prevControllerIndex = 0;

  // saves the value of the tab animation. For example, if one is between the 1st and the 2nd tab, this value will be 0.5
  double _anivalue = 0.0;

  // saves the previous value of the tab animation. It's used to figure the direction of the animation
  double _prevAnivalue = 0.0;

  // these will be our tab icons. You can use whatever you like for the content of your buttons
  List _icons = [
    Icons.star,
    Icons.star,
    Icons.star,
    Icons.star,
    Icons.star,
    Icons.star
  ];

  // active button's foreground color
  Color _foregroundOn = Colors.white;
  Color _foregroundOff = Colors.black;

  // active button's background color
  Color _backgroundOn = Colors.blue;
  Color _backgroundOff = Colors.grey[300];

  // scroll controller for the TabBar
  ScrollController _scrollController = new ScrollController();

  // this will save the keys for each Tab in the Tab Bar, so we can retrieve their position and size for the scroll controller
  List _keys = [];

  // regist if the the button was tapped
  bool _buttonTap = false;

  @override
  void initState() {
    super.initState();

    for (int index = 0; index < _icons.length; index++) {
      // create a GlobalKey for each Tab
      _keys.add(new GlobalKey());
    }

    // this creates the controller with 6 tabs (in our case)
    _controller = TabController(vsync: this, length: _icons.length);
    // this will execute the function every time there's a swipe animation
    _controller.animation.addListener(_handleTabAnimation);
    // this will execute the function every time the _controller.index value changes
    _controller.addListener(_handleTabChange);

    _animationControllerOff =
        AnimationController(
          
          vsync: this, duration: Duration(milliseconds: 75));
    // so the inactive buttons start in their "final" state (color)
    _animationControllerOff.value = 1.0;
    _colorTweenBackgroundOff =
        ColorTween(begin: _backgroundOn, end: _backgroundOff)
            .animate(_animationControllerOff);
    _colorTweenForegroundOff =
        ColorTween(begin: _foregroundOn, end: _foregroundOff)
            .animate(_animationControllerOff);

    _animationControllerOn =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    // so the inactive buttons start in their "final" state (color)
    _animationControllerOn.value = 1.0;
    _colorTweenBackgroundOn =
        ColorTween(begin: _backgroundOff, end: _backgroundOn)
            .animate(_animationControllerOn);
    _colorTweenForegroundOn =
        ColorTween(begin: _foregroundOff, end: _foregroundOn)
            .animate(_animationControllerOn);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> _cardSize = <String>[
    '',
    '5.5 سم * 9 سم',
  ];
  List<String> _printFormat = <String>[
    '',
    'ورق خشن (مقمش)',
    ' ورق أساسي مع سلفان مطفي (كوشيه)',
  ];
  List<String> _paperType = <String>[
    '',
    'كوشيه 300 جرام',
  ];
  List<String> _quantity = <String>[
    '',
    '100',
    '200',
    '300',
    '400',
    '500',
    '1000'
  ];
/*   List<String> _cut = <String>[
    '',
    'قص بزاويه عاديه',
    'قص بزاويه راوند مثل البطاقه',
  ];
  List<String> _cellophane = <String>[
    '',
    'سلوفان مط',
    'سلوفان لامع',
    ' لايوجد',
  ];
  */ String cardSizeolor = '';
  String printFormat = '';
  String paperType = '';
  String quantity = '';
  String cut = '';
  String cellophane = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('كروت شخصية'),
        ),
        backgroundColor: Colors.white,
        body: Column(children: <Widget>[
          // محتويات الحركة اللي فوق
          Container(
              height: 49.0,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: _icons.length,
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
                                // حركة المربعات
                                setState(() {
                                  _buttonTap = true;
                                  _controller.animateTo(index);
                                  _setCurrentIndex(index);
                                  _scrollTo(index);
                                });
                              },
                              //تغير لون الايقونه
                              child: Icon(
                                _icons[index],
                                color: _getForegroundColor(index),
                              )),
                        )));
                  })),
          Flexible(
              child: TabBarView(
            controller: _controller,
            children: <Widget>[
              a1(),
              a1(),
              a1(),
              a1(),
              a1(),
              a1(),
            ],
          )),
        ]));
  }

  // runs during the switching tabs animation
  _handleTabAnimation() {
    // gets the value of the animation. For example, if one is between the 1st and the 2nd tab, this value will be 0.5
    _anivalue = _controller.animation.value;

    // if the button wasn't pressed, which means the user is swiping, and the amount swipped is less than 1 (this means that we're swiping through neighbor Tab Views)
    if (!_buttonTap && ((_anivalue - _prevAnivalue).abs() < 1)) {
      // set the current tab index
      _setCurrentIndex(_anivalue.round());
    }

    // save the previous Animation value
    _prevAnivalue = _anivalue;
  }

  // runs when the displayed tab changes
  _handleTabChange() {
    // if a button was tapped, change the current index
    if (_buttonTap) _setCurrentIndex(_controller.index);

    // this resets the button tap
    if ((_controller.index == _prevControllerIndex) ||
        (_controller.index == _anivalue.round())) _buttonTap = false;

    // save the previous controller index
    _prevControllerIndex = _controller.index;
  }

  _setCurrentIndex(int index) {
    // if we're actually changing the index
    if (index != _currentIndex) {
      setState(() {
        // change the index
        _currentIndex = index;
      });

      // trigger the button animation
      _triggerAnimation();
      _scrollTo(index);
    }
  }

  _triggerAnimation() {
    // reset the animations so they're ready to go
    _animationControllerOn.reset();
    _animationControllerOff.reset();

    // run the animations!
    _animationControllerOn.forward();
    _animationControllerOff.forward();
  }

  _scrollTo(int index) {
    // get the screen width. This is used to check if we have an element off screen
    double screenWidth = MediaQuery.of(context).size.width;

    // get the button we want to scroll to
    RenderBox renderBox = _keys[index].currentContext.findRenderObject();
    // get its size
    double size = renderBox.size.width;
    // and position
    double position = renderBox.localToGlobal(Offset.zero).dx;

    // this is how much the button is away from the center of the screen and how much we must scroll to get it into place
    double offset = (position + size / 2) - screenWidth / 2;

    // if the button is to the left of the middle
    if (offset < 0) {
      // get the first button
      renderBox = _keys[0].currentContext.findRenderObject();
      // get the position of the first button of the TabBar
      position = renderBox.localToGlobal(Offset.zero).dx;

      // if the offset pulls the first button away from the left side, we limit that movement so the first button is stuck to the left side
      if (position > offset) offset = position;
    } else {
      // if the button is to the right of the middle

      // get the last button
      renderBox = _keys[_icons.length - 1].currentContext.findRenderObject();
      // get its position
      position = renderBox.localToGlobal(Offset.zero).dx;
      // and size
      size = renderBox.size.width;

      // if the last button doesn't reach the right side, use it's right side as the limit of the screen for the TabBar
      if (position + size < screenWidth) screenWidth = position + size;

      // if the offset pulls the last button away from the right side limit, we reduce that movement so the last button is stuck to the right side limit
      if (position + size - offset < screenWidth) {
        offset = position + size - screenWidth;
      }
    }

    // scroll the calculated ammount
    _scrollController.animateTo(offset + _scrollController.offset,
        duration: new Duration(milliseconds: 150), curve: Curves.easeInOut);
  }

  _getBackgroundColor(int index) {
    if (index == _currentIndex) {
      // if it's active button
      return _colorTweenBackgroundOn.value;
    } else if (index == _prevControllerIndex) {
      // if it's the previous active button
      return _colorTweenBackgroundOff.value;
    } else {
      // if the button is inactive
      return _backgroundOff;
    }
  }

  _getForegroundColor(int index) {
    // the same as the above
    if (index == _currentIndex) {
      return _colorTweenForegroundOn.value;
    } else if (index == _prevControllerIndex) {
      return _colorTweenForegroundOff.value;
    } else {
      return _foregroundOff;
    }
  }

//كرت شخصي طولي
  Widget a1() {
    return SafeArea(
        top: false,
        bottom: false,
        child: Form(
            key: _formKey,
            autovalidate: true,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: <Widget>[              SizedBox(height: MediaQuery.of(context).size.height / 55),
              SizedBox(height: MediaQuery.of(context).size.height / 55),
                FormField(
                  builder: (FormFieldState state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'حجم الطباعة',
                      ),
                      isEmpty: cardSizeolor == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: cardSizeolor,
                          isDense: true,
                          onChanged: (String value) {
                            setState(() {
                              cardSizeolor = value;
                              state.didChange(value);
                            });
                          },
                          items: _cardSize.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
                FormField(
                  builder: (FormFieldState state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'الخامة',
                      ),
                      isEmpty: printFormat == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: printFormat,
                          isDense: true,
                          onChanged: (String value) {
                            setState(() {
                              printFormat = value;
                              state.didChange(value);
                            });
                          },
                          items: _printFormat.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
                FormField(
                  builder: (FormFieldState state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        labelText: ' الكمية',
                      ),
                      isEmpty: paperType == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: paperType,
                          isDense: true,
                          onChanged: (String value) {
                            setState(() {
                              paperType = value;
                              state.didChange(value);
                            });
                          },
                          items: _paperType.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
                FormField(
                  builder: (FormFieldState state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        labelText: ' الكمية ( عدد النسخ )',
                      ),
                      isEmpty: cut == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: cut,
                          isDense: true,
                          onChanged: (String value) {
                            setState(() {
                              cut = value;
                              state.didChange(value);
                            });
                          },
                          items: _quantity.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'أكتب ملاحظاتك مع الطلب',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'موعد تسليم الطلب',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text("تكلفة الصفحة "),
                        Text("تكلفة النسخة "),
                        Text("إجمالى التكلفة"),
                        Text(""),
                      ],
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'كود الخصم',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
                Container(
                    padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                    child: RaisedButton(
                      child: Text('تاكيد الطلب'),
                      onPressed: null,
                    )),
              ],
            )));
  }

//كرت شخصي افقي
  Widget a2() {
    return SafeArea(
        top: false,
        bottom: false,
        child: Form(
            key: _formKey,
            autovalidate: true,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height / 55),
                FormField(
                  builder: (FormFieldState state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'حجم الطباعة',
                      ),
                      isEmpty: cardSizeolor == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: cardSizeolor,
                          isDense: true,
                          onChanged: (String value) {
                            setState(() {
                              cardSizeolor = value;
                              state.didChange(value);
                            });
                          },
                          items: _cardSize.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
                FormField(
                  builder: (FormFieldState state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'الخامة',
                      ),
                      isEmpty: printFormat == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: printFormat,
                          isDense: true,
                          onChanged: (String value) {
                            setState(() {
                              printFormat = value;
                              state.didChange(value);
                            });
                          },
                          items: _printFormat.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
                FormField(
                  builder: (FormFieldState state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        labelText: ' الكمية',
                      ),
                      isEmpty: paperType == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: paperType,
                          isDense: true,
                          onChanged: (String value) {
                            setState(() {
                              paperType = value;
                              state.didChange(value);
                            });
                          },
                          items: _paperType.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
                FormField(
                  builder: (FormFieldState state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        labelText: ' الكمية ( عدد النسخ )',
                      ),
                      isEmpty: cut == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: cut,
                          isDense: true,
                          onChanged: (String value) {
                            setState(() {
                              cut = value;
                              state.didChange(value);
                            });
                          },
                          items: _quantity.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'أكتب ملاحظاتك مع الطلب',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'موعد تسليم الطلب',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text("تكلفة الصفحة "),
                        Text("تكلفة النسخة "),
                        Text("إجمالى التكلفة"),
                        Text(""),
                      ],
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'كود الخصم',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
                Container(
                    padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                    child: RaisedButton(
                      child: Text('تاكيد الطلب'),
                      onPressed: null,
                    )),
              ],
            )));
  }
}
