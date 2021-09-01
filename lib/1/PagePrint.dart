/* import 'package:flutter/material.dart';

class MyApplllllllx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String dropdownValue;
  List<Product> products = [
    Product(name: 'sep1', type: 'sep'),
    Product(name: 'milk', type: 'data'),
    Product(name: 'oil', type: 'data'),
    Product(name: 'sep2', type: 'sep'),
    Product(name: 'suger', type: 'data'),
    Product(name: 'salt', type: 'data'),
    Product(name: 'sep3', type: 'sep'),
    Product(name: 'potatoe', type: 'data'),
    Product(name: 'tomatoe', type: 'data'),
    Product(name: 'apple', type: 'data'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('text')),
      body: Column(
        children: [
          Text('test'),
          Expanded(
            child: DropdownButton<String>(
              value: dropdownValue,
              items: products.map((value) {
                return DropdownMenuItem(
                  value: value.name,
                  child: value.type == 'data'
                      ? Text(value.name)
                      : Divider(
                          color: Colors.red,
                          thickness: 3,
                        ),
                );
              }).toList(),
              onChanged: (newValue) {
                
                setState(() {
                  
                    dropdownValue = newValue;
                  
                });
                print('$newValue $dropdownValue');
                
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  String name;
  String type;

  Product({this.name, this.type});
}
 */

// ازاله

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ptint/themes/AppTheme.dart';
import 'package:ptint/themes/LightColor.dart';
import 'package:ptint/themes/TitleText.dart';

class PagePrint extends StatefulWidget {
  static const String id = 'InformationDetail';
  @override
  _PagePrintState createState() => _PagePrintState();
}

class _PagePrintState extends State<PagePrint> {
  final _fromkey = GlobalKey<FormState>();

  var _autovalidate = false;
  bool _osLoading = false;

  String idUsers;

  //-------------------------------------
  int numOfItems = 1;

  String addressText, _txtDescription;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  bool _activation = false;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2021, 10, 1));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  String paperSize, paperType, paperColor, aspectsPrinting, packagingOptions;
  bool inp = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _fromkey,
        child: SafeArea(
            child: ListView(children: <Widget>[
          Container(
              child: Column(children: <Widget>[
            Column(children: <Widget>[
              Column(children: <Widget>[
                MenuDropDown(
                    dropdownText: 'نوع الكرت',
                    type: "groomingType",
                    onChanged: (value) {
                      paperSize = value;
                    }),
                MenuDropDown(
                    dropdownText: 'وجهه الطباعة',
                    type: "catBreeds",
                    onChanged: (value) {
                      paperType = value;
                    }),
                MenuDropDown(
                    dropdownText: 'الوزن',
                    type: "catSize",
                    onChanged: (value) {
                      paperColor = value;
                    }),
                MenuDropDown(
                    dropdownText: 'نوع القصة',
                    type: "addOnServices",
                    onChanged: (value) {
                      aspectsPrinting = value;
                    }),
                MenuDropDown(
                    dropdownText: 'نوع السلفان',
                    type: "packagingOptions",
                    onChanged: (value) {
                      packagingOptions = value;
                    }),
                SizedBox(height: 10),
                Container(
                  width: 320,
                  child: TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(35.0, 10.0, 0, 10.0),
                      hintText: ' ',
                      hintStyle: TextStyle(fontSize: 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    onChanged: (value) {
                      _txtDescription = value;
                    },
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        padding: const EdgeInsets.symmetric(horizontal: 40 / 2),
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
                Container(
                  margin: EdgeInsets.fromLTRB(1.0, 14, 1, 0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          TEXT(
                              txt: "تاريخ التسليم",
                              color: LightColor.titleTextColor),
                          Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              width: 130,
                              height: 60,
                              margin: EdgeInsets.fromLTRB(19.0, 0, 20, 0),
                              child: RaisedButton(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 0,
                                  child: Text(_activation != false
                                      ? "تاريخ التسليم:"
                                      : "${selectedDate.toLocal()}"
                                          .split(' ')[0]),
                                  // Text('اختر موعدا', style: TextStyle(fontSize: 12.0)),
                                  onPressed: () => _selectDate(context))),
                        ],
                      ),
                      Column(children: [
                        Container(
                            // margin: EdgeInsets.fromLTRB(20.0, 14, 20, 0),
                            child: TEXT(
                                txt: "وقت التسليم",
                                color: LightColor.titleTextColor)),
                        Container(
                            width: 140,
                            height: 60,
                            //  margin: EdgeInsets.fromLTRB(19.0, 0, 20, 0),
                            // decoration: BoxDecoration(),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: RaisedButton(
                                color: Colors.white,
                                child: Text(
                                    _activation == true
                                        ? 'اختر الوقت'
                                        : " ${selectedTime.format(context)}",
                                    style: TextStyle(fontSize: 12.0)),
                                // : Text(" ${selectedTime.format(context)}"),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 0,
                                onPressed: () => _selectTime(context))),
                      ]),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 15.0, 0, 0),
                  width: 75.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12.0)),
                  child: FlatButton(
                      child: Text("التالي"),
                      onPressed:
                          _save /* () {
                            /*   Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ConfirmationOrder(
                                          addressText: addressText,
                                          addNotes: addNotes))); */
                          } */
                      ),
                )
              ])
            ])
          ]))
        ])),
      ),
    );
  }

  Future getidUsers() async {
    var idUser = FirebaseAuth.instance.currentUser;
    idUsers = idUser.uid;
    print(idUser.uid);
  }

  void _save() async {
    if (!_fromkey.currentState.validate()) {
      setState(() {
        _autovalidate = true;
      });
    } else {
      setState(() {
        _osLoading = true;
      });
      Random random = new Random();
      await getidUsers();
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        FirebaseFirestore.instance.collection("Print").doc().set({
          "selectedDate": selectedDate,
          "selectedTime": selectedTime.format(context),
          "userId": user.uid,
          "paperSize": paperSize,
          "paperType": paperType,
          "paperColor": paperColor,
          "aspectsPrinting": aspectsPrinting,
          "packagingOptions": packagingOptions,
          "numOfItems": numOfItems
          /*  'Created': DateTime.now().millisecond,
          "OrderNnumber": random.nextInt(9999999) + 1000000,
          'date': DateTime.now().toIso8601String().toString(), */
        }).then((_) {
          Fluttertoast.showToast(
              msg: "تم اضافة المنتج",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: LightColor.iconColor,
              textColor: LightColor.titleTextColor,
              fontSize: AppTheme.fullHeight(context) / 35);

          //  Navigator.of(context).pop();
        });
      } else {
        // No User signed In.
      }
    }
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
}

typedef OnChangeCallback = void Function(dynamic value);

class MenuDropDown extends StatefulWidget {
  final String dropdownText;
  final String type;
  final OnChangeCallback onChanged;

  MenuDropDown({this.dropdownText, this.type, this.onChanged});

  @override
  _MenuDropDownState createState() => _MenuDropDownState();
}

class _MenuDropDownState extends State<MenuDropDown> {
  String selectedItem;
  List<String> dropdownItems = [];

  List<String> groomingTypeList = [
    " كرت سميك حراري"
        "بطاقات بلاستيك id",
    "كرت شفاف",
    "كرت فيزيت سميك نافر مقرم الزوايا",
    "كرت فيزيت عادي",
    "كرت مقمش",
    "كروت البسة",
    "كروت مغناطيس"
  ];
  List<String> catBreedsList = ['وجهه', 'وجهين'];

  List<String> catSizeList = ["250 غرام", "350 غرام"];

  List<String> addOnServicesList = ["قصة خاصة", "مقرم"];
  List<String> addOnServicesList1 = ["عامودي", "افقس"];

  List<String> packagingOptions = ["سلفان لميع", "سلفان مت ناشف"];

  List<String> getListBasedOnName(String value) {
    print(value);
    switch (value) {
      case "groomingType":
        return groomingTypeList;

        break;
      case "catBreeds":
        return catBreedsList;
        break;

      case "catSize":
        return catSizeList;
        break;
      case "addOnServices":
        return addOnServicesList;
        break;

      case "packagingOptions":
        return packagingOptions;
        break;
    }

    return null;
  }

  @override
  void initState() {
    super.initState();
    print(widget.type);

    dropdownItems = getListBasedOnName(widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 10.0),
        child: Container(
            width: 325.0,
            height: 50.0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0.1, 0.1),
                  blurRadius: 0.1,
                )
              ],
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    elevation: 0,
                    value: selectedItem,
                    hint: Padding(
                      padding: const EdgeInsets.fromLTRB(22.0, 0, 0, 0),
                      child: Text(
                        widget.dropdownText,
                        style: TextStyle(),
                      ),
                    ),
                    items: dropdownItems.map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedItem = value;
                      });
                      widget.onChanged(value);
                    }))));
  }
}

//
