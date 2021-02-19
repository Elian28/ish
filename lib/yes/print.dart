import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptint/themes/TitleText.dart';

class Print extends StatefulWidget {
  @override
  _PrintState createState() => _PrintState();
}

class _PrintState extends State<Print> {
  final _fromkey = GlobalKey<FormState>();
  bool activation = false;
  String _droCoordination;
  String _droPaperSize;
  String _droPaperType;
  String _droPackagingOptions;
  int numOfItems = 1;

  int _radioValue = -1;
  String radioValue;
  int _radioValue1 = -1;
  String radioValue1;


  TextEditingController _txtNotice = TextEditingController();
  TextEditingController _txtcounter = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _txtNotice.dispose();
    _txtcounter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(17),
            child: Form(
                key: _fromkey,
                child: ListView(children: <Widget>[
                  paperSize(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TEXT(txt: "لون الطباعة", size: 14),
                        Radio(
                            value: 0,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange),
                        Text('اسود ', style: TextStyle(fontSize: 16.0)),
                        Radio(
                            value: 1,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange),
                        Text('ملون', style: TextStyle(fontSize: 16.0))
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TEXT(txt: "جانب الطباعة", size: 15),
                      Radio(
                          value: 0,
                          groupValue: _radioValue1,
                          onChanged: _handleRadioValueChange1),
                      TEXT(txt: 'وجهه ', size: 10),
                      Radio(
                          value: 1,
                          groupValue: _radioValue1,
                          onChanged: _handleRadioValueChange1),
                      Text('وجهين', style: TextStyle(fontSize: 16.0)),
                    ],
                  ),
                  paperType(),
                  pagelayout(),
                  paperSize3(),

                  TextFormField(
                    textAlign: TextAlign.start,
                    maxLength: 300,
                    maxLines: 7,
                    controller: _txtNotice,
                    decoration: InputDecoration(
                      labelText: "اضافة ملاحظة",
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      buildOutlineButton(
                        icon: Icons.remove,
                        press: () {
                          if (numOfItems > 1) {
                            setState(() {
                              numOfItems--;
                            });
                          }
                        },
                      ),
                      Center(
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 40 / 2),
                          child: Text(
                            // if our item is less  then 10 then  it shows 01 02 like that
                            numOfItems.toString().padLeft(2, "0"),
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                      buildOutlineButton(
                          icon: Icons.add,
                          press: () {
                            setState(() {
                              numOfItems++;
                            });
                          }),
                    ],
                  ),

                  /*    Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButton(
                          child: Text("طباعة"),
                          onPressed: () async {
                            if (_fromkey.currentState
                                .validate()) {
                              Fluttertoast.showToast(
                                  msg: "تم اضافة المنتج",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor:
                                      Colors.cyan[800],
                                  textColor: Colors.white,
                                  fontSize: MediaQuery.of(context)
                                          .size
                                          .height /
                                      35);

                              Navigator.pop(context);
                            }
                          }),
                  /*     RaisedButton(
                          child: Text("اضافة ملف اخر"),
                          onPressed: () async {
                            if (_fromkey.currentState
                                .validate()) {
                              Fluttertoast.showToast(
                                  msg: "تم اضافة المنتج",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor:
                                      Colors.cyan[800],
                                  textColor: Colors.white,
                                  fontSize: MediaQuery.of(context)
                                          .size
                                          .height /
                                      35);

                              Navigator.pop(context);
                            }
                          }) */
                    ],
                  )
                */
                ]))));
  }

  Widget paperSize() {
    return DropdownButtonFormField(
      hint: Text("حجم الورق "),
      value: _droPaperSize,
      items: [
        'A0',
        'A1',
        'A2',
        'A3',
        '4A',
        'A5',
      ].map((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _droPaperSize = value;
        });
      },
    );
  }

  SizedBox buildOutlineButton({IconData icon, Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }

//نوع الوق
  Widget paperType() {
    return DropdownButtonFormField(
      hint: Text("نوع الورق "),
      value: _droPaperType,
      items: [
        'عادي',
        "لاصق", //A3 +A4
        ' مقوي ', //A3 +A4 +A5
        ' لماع ', //A3 +A4 + A5
        "فلم ابيض", //A0 + A1 +A2
      ].map((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _droPaperType = value;
        });
      },
    );
  }

  // لون الطباعة
  Widget printColor() {
    return DropdownButtonFormField(
      hint: Text("لون الحبر"),
      value: _droCoordination,
      items: [
        'اسود',
        "ملون",
      ].map((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _droCoordination = value;
        });
      },
    );
  }

//تخطيط الصفحة
  Widget pagelayout() {
    return DropdownButtonFormField(
      hint: Text("تخطيط الصفحة"),
      value: _droCoordination,
      items: [
        "بدون تخطيط",
        "عامودي شريحتين",
        "عامودي اربع شرايح",
        "افقي شريحتين",
        "افقي اربع شرايح",
      ].map((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _droCoordination = value;
        });
      },
    );
  }

  Widget paperSize3() {
    return DropdownButtonFormField(
      hint: Text("خيارات التغليف "),
      value: _droPackagingOptions,
      items: [
        "بدون تغليف",
        'حافظ انبوبي', //A0 + A1 +A2 +A3
        ' تدبيس ركن ', //A3 +A4 +A5
        "تدبيس جانبي", // A4 + A5
        "سلك", // A4 + A5
        "بلاستك حلزوني", // A4 + A5
        "كعب حراري", // A4 + A5
        "تخييط", // A4 + + A5
        "ملف خرمين", // A4
        "ملف ٣ أخرام", // A4
        "كيس شفاف", // A4
      ].map((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _droPackagingOptions = value;
        });
      },
    );
  }

  void _handleRadioValueChange(value) {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          {
            radioValue = "غير";
            print("radioValue5 is $radioValue");
          }
          break;
        case 1:
          {
            radioValue = "عادي";
            print("radioValue5 is $radioValue");
          }

          break;
      }
    });
  }

  void _handleRadioValueChange1(value) {
    setState(() {
      _radioValue1 = value;
      switch (_radioValue1) {
        case 0:
          {
            radioValue1 = "غير";
            print("radioValue5 is $radioValue1");
          }
          break;
        case 1:
          {
            radioValue1 = "عادي";
            print("radioValue5 is $radioValue1");
          }
          break;
      }
    });
  }
}

const kDefaultPaddin = 20.0;
