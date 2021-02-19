import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ptint/themes/AppTheme.dart';
import 'package:ptint/themes/LightColor.dart';
import 'package:ptint/themes/TitleText.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'ListPrint.dart';

class NumberList {
  String number;
  int index;
  NumberList({this.number, this.index});
}

class A123 extends StatefulWidget {
  @override
  _A123State createState() => _A123State();
}

class _A123State extends State<A123> {
  // Default Radio Button Selected Item.
  String radioItemHolder = 'وجهه';
  String radioItemHolderColor = 'اسود';

  // Group Value for Radio Button.
  int id = 1;
  int idColor = 1;

  List<NumberList> nList = [
    NumberList(
      index: 1,
      number: "وجهه",
    ),
    NumberList(
      index: 2,
      number: "وجهين",
    ),
  ];
  List<NumberList> nListColor = [
    NumberList(
      index: 1,
      number: "اسود",
    ),
    NumberList(
      index: 2,
      number: "ملون",
    ),
  ];

//---------------------
  int selected_city = 0;
  int selected_Nbrhood = 0;
  int selected_str = 0;
  int selected_Hotel = 0;
  List<DropdownMenuItem<int>> sizeDrop = [];
  List<DropdownMenuItem<int>> papertypeDrop = [];
  List<DropdownMenuItem<int>> paperColorDrop = [];
  List<DropdownMenuItem<int>> nameXDrop = [];
  List<DropdownMenuItem<int>> paperOpenDrop = [];
//
  int _radioValue = -1;
  String radioValue;
  int _radioValue1 = -1;
  String radioValue1;

  final _fromkey = GlobalKey<FormState>();

  var _autovalidate = false;
  bool _osLoading = false;

  String idUsers;

  //-------------------------------------
  int numOfItems = 1;

  String _txtDescription;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  bool _activation = false;
/*   TimeOfDay roomBooked =
      TimeOfDay.fromDateTime(DateTime.parse('2021-10-20 16:30:04Z'));
 */
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

  void loadCity() {
    sizeDrop = [];
    for (int i = 0; i < listdata.length; i++) {
      sizeDrop.add(
          DropdownMenuItem(child: TEXT(txt: "${listdata[i].name}"), value: i));
    }
  }

  void loadNbrhood() {
    papertypeDrop = [];
    for (int i = 0; i < listdata[selected_city].Nbrhood.length; i++) {
      setState(() {
        papertypeDrop.add(DropdownMenuItem(
            child: TEXT(txt: "${listdata[selected_city].Nbrhood[i].name}"),
            value: i));
      });
    }
  }

  void loadstr() {
    paperColorDrop = [];
    for (int i = 0;
        i < listdata[selected_city].Nbrhood[selected_Nbrhood].strt.length;
        i++) {
      setState(() {
        paperColorDrop.add(DropdownMenuItem(
            child: TEXT(
                txt:
                    "${listdata[selected_city].Nbrhood[selected_Nbrhood].strt[i].name}"),
            value: i));
      });
    }
  }

//city(Neighborhood(strt(namez)))
  void nameXstr() {
    nameXDrop = [];
    for (int i = 0;
        i <
            listdata[selected_city]
                .Nbrhood[selected_Nbrhood]
                .strt[selected_str]
                .name_x
                .length;
        i++) {
      nameXDrop.add(DropdownMenuItem(
          child: TEXT(
              txt:
                  "${listdata[selected_city].Nbrhood[selected_Nbrhood].strt[selected_str].name_x[i].name}"),
          value: i));
    }
  }

/*   void hotelstr() {
    paperOpenDrop = [];
    for (int i = 0;
        i <
            listdata[selected_city]
                .Nbrhood[selected_Nbrhood]
                .strt[selected_str]
                .name_x[selected_Hotel]
                .name_Z
                .length;
        i++) {
      paperOpenDrop.add(DropdownMenuItem(
          child: TEXT(
              txt:
                  "${listdata[selected_city].Nbrhood[selected_Nbrhood].strt[selected_str].name_x[selected_Hotel].name_Z[i].name}"),
          value: i));
    }
  }
 */

  @override
  Widget build(BuildContext context) {
    loadCity();
    loadstr();
    loadNbrhood();
    nameXstr();
    //  hotelstr();
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 8.0, 0, 10.0),
      child: Form(
          key: _fromkey,
          child: Column(children: <Widget>[
            TEXT(txt: 'حجم الورق'),

            Padding(
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
                      value: selected_city,
                      hint: Padding(
                        padding: const EdgeInsets.fromLTRB(22.0, 0, 0, 0),
                        child: TEXT(txt: 'choose'),
                      ),
                      items: sizeDrop,
                      onChanged: (value) {
                        setState(() {
                          selected_city = int.parse(value.toString());
                          selected_Nbrhood = 0;
                          selected_str = 0;
                          selected_Hotel = 0;
                          loadNbrhood();
                          loadstr();
                          nameXstr();
                          // hotelstr();
                        });
                      },
                    )))),

            //

            //---------------------------
            TEXT(txt: 'نوع الورق'),
            Padding(
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
                        value: selected_Nbrhood,
                        items: papertypeDrop,
                        underline: Container(
                          height: 0,
//                                    color: Colors.transparent,
                        ),
                        hint: TEXT(txt: 'choose'),
                        onChanged: (value) {
                          setState(() {
                            selected_Nbrhood = int.parse(value.toString());
                            selected_str = 0;
                            selected_Hotel = 0;

                            print("select $value");
                            loadNbrhood();
                            loadstr();
                            nameXstr();
                            //  hotelstr();
                          });
                        },
                      ),
                    ))),

            //---------------------------
            selected_city != 4 && selected_city != 5
                ? Container()
                : TEXT(txt: 'لون الورق'),
            selected_city != 4
                ? Container()
                : Container(
                    child: Row(
                      children: nListColor
                          .map((data) => Flexible(
                                fit: FlexFit.tight,
                                child: RadioListTile(
                                  title: TEXT(txt: "${data.number}"),
                                  groupValue: idColor,
                                  value: data.index,
                                  onChanged: (val) {
                                    setState(() {
                                      radioItemHolderColor = data.number;
                                      idColor = data.index;
                                    });
                                  },
                                ),
                              ))
                          .toList(),
                    ),
                  ),

            //? Container() : Text('لون الورق'),

            Padding(
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
                        value: selected_str,
                        items: paperColorDrop,
                        underline: Container(
                          height: 0,
//                                    color: Colors.transparent,
                        ),
                        hint: TEXT(txt: 'choose'),
                        onChanged: (value) {
                          setState(() {
                            selected_str = int.parse(value.toString());
                            // selected_nameX = 0P;
                            print("select $value");
                            loadNbrhood();
                            loadstr();
                            nameXstr();
                            // hotelstr();
                          });
                        },
                      ),
                    ))),
//---------------

            //-------------------
            selected_city != 4 && selected_city != 5
                ? Container()
                : TEXT(txt: 'جوانب الطباعة'),

//-----------

            selected_city != 5 && selected_city != 4
                ? Container()
                : Row(
                    children: nList
                        .map((data) => Flexible(
                              fit: FlexFit.tight,
                              child: RadioListTile(
                                title: TEXT(txt: "${data.number}"),
                                groupValue: id,
                                value: data.index,
                                onChanged: (val) {
                                  setState(() {
                                    radioItemHolder = data.number;
                                    id = data.index;
                                  });
                                },
                              ),
                            ))
                        .toList(),
                  ),

            TEXT(txt: 'خيارات التغليف'),

            Padding(
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
                        value: selected_Hotel,
                        items: nameXDrop,
                        underline: Container(
                          height: 0,
                        ),
                        hint: TEXT(txt: 'خيارات التغليف'),
                        onChanged: (value) {
                          setState(() {
                            selected_Hotel = int.parse(value.toString());
                            print("select $value");
                            loadNbrhood();
                            loadstr();
                            nameXstr();
                            // hotelstr();
                          });
                        },
                      ),
                    ))),
            TEXT(txt: "عدد النسخ"),
            //-------------------------------------------------
            Container(
                child: Column(children: <Widget>[
              Column(children: <Widget>[
                Column(children: <Widget>[
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
                  Container(
                    width: 320,
                    child: TextFormField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(35.0, 10.0, 0, 10.0),
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

  Future getidUsers() async {
    var idUser = FirebaseAuth.instance.currentUser;
    idUsers = idUser.uid;
    print(idUser.uid);
  }

  void _save() async {
    //   selected_city = hotelDrop[0];
    if (!_fromkey.currentState.validate()) {
      setState(() {
        _autovalidate = true;
      });
    } else {
      setState(() {
        _osLoading = true;
      });
      await getidUsers();
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        FirebaseFirestore.instance.collection("Print").doc().set({
          "userId": user.uid,
          "_txtDescription": _txtDescription != null
              ? _txtDescription.toString()
              : "لا يوجد اضافات",
          "selected_city": listdata[selected_city].name,
          "selected_Nbrhood":
              listdata[selected_city].Nbrhood[selected_Nbrhood].name,
          "selected_str": listdata[selected_city]
              .Nbrhood[selected_Nbrhood]
              .strt[selected_str]
              .name_x[selected_Hotel]
              .name,
          "selected_Hotel": listdata[selected_city]
              .Nbrhood[selected_Nbrhood]
              .strt[selected_str]
              .name,
          "numOfItems": numOfItems,
          "selectedDate": selectedDate,
          "selectedTime": selectedTime.format(context),
          "radioItemHolder":
              selected_city == 5 || selected_city == 4 ? radioItemHolder : "",
          "radioItemHolderColor":
              selected_city == 4 ? radioItemHolderColor : "",
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
}
