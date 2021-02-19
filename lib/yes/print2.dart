import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ptint/Widget/RAISEDBUTTON.dart';
import 'package:ptint/themes/TitleText.dart';

class Print23 extends StatefulWidget {
  @override
  _Print23State createState() => _Print23State();
}

class _Print23State extends State<Print23> {
  final _fromkey = GlobalKey<FormState>();
  bool activation = false;
  String _droCoordination;
  String _droPaperSize;
  String _droPaperType;
  String _droPackagingOptions;

  int _radioValue = -1;
  String radioValue;
  int _radioValue1 = -1;
  String radioValue1;

  int _counter = 0;

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
        body: SingleChildScrollView(
            child: Container(
                child: Padding(
                    padding: const EdgeInsets.all(17),
                    child: Column(children: <Widget>[
                      Form(
                          key: _fromkey,
                          child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(children: <Widget>[
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                ),
                                Container(
                                  width: 180,
                                  height: 180,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                paperSize(),
                                new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    TEXT(
                                      txt: "لون الطباعة",
                                      size: 14,
                                    ),
                                    new Radio(
                                      value: 0,
                                      groupValue: _radioValue,
                                      onChanged: _handleRadioValueChange,
                                    ),
                                    new Text(
                                      'اسود ',
                                      style: new TextStyle(fontSize: 16.0),
                                    ),
                                    new Radio(
                                      value: 1,
                                      groupValue: _radioValue,
                                      onChanged: _handleRadioValueChange,
                                    ),
                                    new Text(
                                      'ملون',
                                      style: new TextStyle(fontSize: 16.0),
                                    ),
                                  ],
                                ),
                                new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    TEXT(
                                      txt: "جانب الطباعة",
                                      size: 15,
                                    ),
                                    new Radio(
                                      value: 0,
                                      groupValue: _radioValue1,
                                      onChanged: _handleRadioValueChange1,
                                    ),
                                    new TEXT(
                                      txt: 'وجهه ',
                                      size: 10,
                                    ),
                                    new Radio(
                                      value: 1,
                                      groupValue: _radioValue1,
                                      onChanged: _handleRadioValueChange1,
                                    ),
                                    new Text(
                                      'وجهين',
                                      style: new TextStyle(fontSize: 16.0),
                                    ),
                                  ],
                                ),
                                paperType(),
                                coordination(),
                                paperSize3(),
                                TEXT(
                                  txt: "عدد النسخ",
                                  size: 12,
                                ),
                                ListTile(
                                  title: TextFormField(
                                    textAlign: TextAlign.start,
                                    controller: _txtcounter,
                                    decoration:
                                        InputDecoration(hintText: "$_counter"),
                                    validator: (val) {
                                      if (val.isEmpty) {
                                        return "الرجاء تعبية البيانات";
                                      }
                                      return null;
                                    },
                                  ),
                                  leading: IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        _counter++;
                                      });
                                    },
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(Icons.history),
                                    onPressed: () {
                                      setState(() {
                                        _counter--;
                                      });
                                    },
                                  ),
                                ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    RaisedButtons(
                                        txt: "طباعة",
                                        onPresseds: () async {
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
                                    RaisedButtons(
                                        txt: "اضافة ملف اخر",
                                        onPresseds: () async {
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
                                        })
                                  ],
                                )
                              ])))
                    ])))));
  }

  Widget paperSize() {
    return DropdownButtonFormField(
      hint: Text("حجم الورق "),
      value: _droPaperSize,
      items: [
        "كروت شخصية",
        "بروشور / فلاير ",
        "فولدر",
        "ورق مراسلات ",
        "اظرف",
        "بوستر / ستيكر",
        "أكياس ورقية",
        " مانيوال تدريبي / كتاب",
        "شهادات",
        "مجلات",
        " كتالوج / منيو طعام",
        "ملصقات",
        "رسالة علمية",
        " طباعة ألوان / إسود",
        'لوحات ',
        "رول اب",
        " أوت دور",
        "إن دور",
        "بلوك نوت",
        "كارت ID ",
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

  Widget coordination() {
    return DropdownButtonFormField(
      hint: Text("التنسيق"),
      value: _droCoordination,
      items: [
        'عرض باوربوينت',
        "تلخيص",
        ' بحث ',
        "كتاب مشروع تخرج",
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
