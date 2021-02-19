import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ptint/Books2/book.dart';
import 'package:ptint/themes/LightColor.dart';
import '../Server/help.dart';
import 'HomesScreen.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

//
class _NewsState extends State<News> with SingleTickerProviderStateMixin {
  // AnimationController _controller;

  var _autovalidate = false;
  DateTime created;
  bool _osLoading = false;
  File _image;
  String _dropdownsnapshot;
  int _radioValue = -1;
  int _radioValue1 = -1;
  String radioValue;
  String radioValue1;
  String idUsers;
  String radioValue2;
  var list = new List<int>.generate(10, (int index) => index); // [0, 1, 4]
  int nnm = 1;
  String _date = "تاريخ الاستيلام";
  String _time = "وقت الاستيلام";

  @override
  void initState() {
    super.initState();
  }

  List txt = [
    "1- طباعة",
    "2- اعداد الابحاث لطلاب الكليات",
    "3- اجراء التحاليل الاحصائية لطلاب المجاستير",
    "4- كتابة الرسائل العلمية",
    "5- ترجمة البحوث من الانجليزية الى العربية والعكس",
    "6- توفير المراجع العلمية التى يحتاج اليها العميل",
    "7- التعديل على الاخطاء اللغوية والنحوية في الرسائل",
    "8- مشروعات التخرج للسنة النهائية من البكالريوس",
    "9- طباعة الابحاث والرسائل سواء التى تمت كتابتها\n في المركز او التى كتبها العميل بنفسة.",
    "10-اوراق عمل",
    "11-شهاداتت شكر بالتغليف ",
    "12-اخرى"
  ];
//TODO
  Future getidUsers() async {
    var idUser = FirebaseAuth.instance.currentUser;
    idUsers = idUser.uid;
    print(idUser.uid);
  }

  TextEditingController _txtEmail = TextEditingController();
  TextEditingController _txtTitle = TextEditingController();

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: LightColor.darkgrey,
          child: Icon(Icons.print),
          onPressed: () {
            return Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => AddBook()));
          }),
      appBar: AppBar(centerTitle: true, title: Text("صفحة الطلبات")),
      body: _osLoading ? _logadin(context) : _form(context),
    );
  }

  Widget _logadin(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _form(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
            child: Form(
                //autovalidate: _autovalidate,
                key: _key,
                child: Column(children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      /*      Column(
                        children: [
                          GestureDetector(
                            onTap: () => setState(() => _radioValue1 = 0),
                            child: Container(
                              height: 56,
                              width: 56,
                              color: _radioValue1 == 0
                                  ? LightColor.iconColor
                                  : Colors.transparent,
                              child: Icon(
                                Icons.accessibility,
                                color: LightColor.lightGrey,
                              ),
                            ),
                          ),
                          new TEXT(
                            txt: 'ابحاث مدرسية ',
                            size: 10,
                          ),
                        ],
                      ),
                      SizedBox(width: 4),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => setState(() => _radioValue1 = 1),
                            child: Container(
                              height: 56,
                              width: 56,
                              color: _radioValue1 == 1
                                  ? LightColor.iconColor
                                  : Colors.transparent,
                              child: Icon(
                                Icons.accessibility,
                                color: LightColor.lightGrey,
                              ),
                            ),
                          ),
                          new TEXT(
                            txt: 'خدمات طلاب الجامعة',
                            size: 10,
                          ),
                        ],
                      ),
                   */ /*   new Radio(
                                      value: 0,
                                      groupValue: _radioValue1,
                                      onChanged: _handleRadioValueChange1,
                                    ),
                                   
                                    new Radio(
                                      value: 1,
                                      groupValue: _radioValue1,
                                      onChanged: _handleRadioValueChange1,
                                    ), */
                    ],
                  ),
                  serviceType(),
                  Text('نوع الخدمة ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                  ListTile(
                      title: Text('توصيل',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0)),
                      leading: Radio(
                          value: 0,
                          groupValue: _radioValue,
                          onChanged: _handleRadioValueChange)),
                  _radioValue == 0
                      ? Column(children: <Widget>[
                          Container(
                              constraints: BoxConstraints.tightFor(),
                              /* foregroundDecoration: BoxDecoration(
                              border: Border.all(color: LightColor.black38)), */
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: LightColor.darkgrey)),
                              child: Card(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                    Text("مكان تسليم الطلب",
                                        style: TextStyle(
                                            color: LightColor.titleTextColor)),
                                    RaisedButton(
                                        colorBrightness: Brightness.light,
                                        child: Text("الموقع"),
                                        onPressed: () {})
                                  ]))),
                          Card(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                Text("وقت تسليم الطلب",
                                    style: TextStyle(
                                        color: LightColor.titleTextColor)),
                                time()
                              ]))
                        ])
                      : Text(""),
                  ListTile(
                      title: Text('خدمة عن بعد',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0)),
                      leading: Radio(
                        value: 1,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      )),
                  _radioValue == 1
                      ? Card(
                          child: TextFormField(
                              controller: _txtEmail,
                              cursorColor: LightColor.titleTextColor,
                              style:
                                  TextStyle(color: LightColor.titleTextColor),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  labelStyle:
                                      TextStyle(color: LightColor.iconColor),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: LightColor.iconColor)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  labelText: 'البريد الالكتروني*',
                                  hintText: "renad@gmail.com",
                                  suffixIcon: FlatButton(
                                      onPressed: () {},
                                      child: InkWell(
                                          child: Container(
                                              width:
                                                  MediaQuery.of(context).size.width /
                                                      15,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  30,
                                              decoration: BoxDecoration(
                                                  color: LightColor
                                                      .kShrineSurfaceWhite,
                                                  border: Border.all(
                                                      color:
                                                          LightColor.iconColor),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(75.0)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 0.0,
                                                        color: LightColor
                                                            .iconColor)
                                                  ]),
                                              child: Icon(
                                                Icons.create,
                                                size: 20,
                                                color: LightColor.iconColor,
                                              ))))),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "الرجاء تعبية البيانات";
                                }
                                Pattern pattern =
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp regex = new RegExp(pattern);
                                if (!regex.hasMatch(val)) {
                                  return 'تنسيق البريد الإلكتروني غير صالح';
                                }
                                return null;
                              }))
                      : Text(""),
                  ListTile(
                      title: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          child: Card(
                              child: TextFormField(
                                  controller: _txtTitle,
                                  maxLines: 9,
                                  cursorColor: LightColor.iconColor,
                                  style: TextStyle(color: LightColor.iconColor),
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelStyle:
                                        TextStyle(color: LightColor.iconColor),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: LightColor.iconColor)),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    hintText: 'اكتب تفاصيل طلبك',
                                  )))),
                      trailing: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Container(
                              width: MediaQuery.of(context).size.width / 5,
                              height: MediaQuery.of(context).size.height / 2.3,
                              child: OutlineButton(
                                  child: viewImage(),
                                  onPressed: () {
                                    uploadPhotos();
                                  })))),
                  RaisedButton(child: Text("ارسالة"), onPressed: _save),
                ]))));
  }

  Future<String> downloadImages(File image) async {
    String name = Random().nextInt(1000).toString() + "products";
    final Reference storageReference =
        FirebaseStorage.instanceFor().ref().child(name);
    final UploadTask uploadTask = storageReference.putFile(image);
    TaskSnapshot responseSnapshot = await uploadTask.whenComplete(() => null);
    String url = await responseSnapshot.ref.getDownloadURL();
    return url;
  }

  void _handleRadioValueChange(value) {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          {
            radioValue = "توصيل";
            print("radioValue5 is $radioValue");
          }
          break;
        case 1:
          {
            radioValue = "عن بعد";
            print("radioValue5 is $radioValue");
          }

          break;
      }
    });
  }

  void _save() async {
    if (!_key.currentState.validate()) {
      setState(() {
        _autovalidate = true;
      });
    } else {
      setState(() {
        _osLoading = true;
      });
      Random random = new Random();

      // var images1 = await downloadImages(_image);
      await getidUsers();
      // FirebaseAuth.instance.currentUser.then((user) {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        FirebaseFirestore.instance
            .collection(collections['Contents'])
            .doc()
            .set({
          'details': _txtTitle.text,
          "done": false,
          "userId": user.uid,

          ///  "image": images1,
          'Created': DateTime.now().millisecond,
          "Status": 0,
          "category": _dropdownsnapshot,
          "OrderNnumber": random.nextInt(9999999) + 1000000,
          'date': DateTime.now().toIso8601String().toString(),
        }).then((_) {
          Fluttertoast.showToast(
              msg: "تم اضافة المنتج",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: LightColor.iconColor,
              textColor: LightColor.titleTextColor,
              fontSize: MediaQuery.of(context).size.height / 35);

          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => HomesScreen()));
        });
      } else {
        // No User signed In.
      }
    }
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

  Widget time() {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 4.0,
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      theme: DatePickerTheme(
                        containerHeight: 210.0,
                      ),
                      showTitleActions: true,
                      minTime: DateTime(2021, 1, 1),
                      maxTime: DateTime(2021, 12, 31), onConfirm: (date) {
                    print(' $date');
                    _date = '${date.year} - ${date.month} - ${date.day}';
                    setState(() {});
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(children: <Widget>[
                            Container(
                                child: Row(children: <Widget>[
                              Icon(
                                Icons.date_range,
                                size: 18.0,
                                color: LightColor.background,
                              ),
                              Text(
                                " $_date",
                                style: TextStyle(
                                    color: LightColor.background,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              )
                            ]))
                          ]),
                          Text(
                            "",
                            style: TextStyle(
                                color: LightColor.titleTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          )
                        ])),
                color: LightColor.darkgrey,
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 4.0,
                onPressed: () {
                  DatePicker.showTime12hPicker(context,
                      theme: DatePickerTheme(containerHeight: 210.0),
                      showTitleActions: true, onConfirm: (time) {
                    _time = '${time.hour} : ${time.minute}';
                    setState(() {});
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                  setState(() {});
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(children: <Widget>[
                            Container(
                                child: Row(children: <Widget>[
                              Icon(
                                Icons.access_time,
                                size: 18.0,
                                color: LightColor.background,
                              ),
                              Text(" $_time",
                                  style: TextStyle(
                                      color: LightColor.background,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0))
                            ]))
                          ]),
                          Text(" ",
                              style: TextStyle(
                                  color: LightColor.background,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0))
                        ])),
                color: LightColor.darkgrey,
              )
            ])));
  }

  Widget serviceType() {
    return DropdownButtonFormField(
      hint: Text("نوع الخدمة  "),
      value: _dropdownsnapshot,
      items: txt.map((value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      onChanged: (value) {
        setState(() {
          _dropdownsnapshot = value;
        });
      },
    );
  }

  botSuggestions(List<dynamic> messages) {
    messages.forEach((message) {
      if (message['payload'] != null) {
        List<dynamic> suggestionList = message['payload']['suggestions'];
        suggestionList.forEach((suggestion) => txt.add(suggestion));
      }
    });
  }

  Widget viewImage() {
    if (_image == null) {
      return Icon(Icons.camera_alt, color: LightColor.grey);
    } else {
      return Image.file(_image,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width / 5,
          height: MediaQuery.of(context).size.height / 2.3);
    }
  }

  void _selectImage(Future<File> pickImage) async {
    File addImage = await pickImage;
    setState(() {
      return _image = addImage;
    });
  }

  void uploadPhotos() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return CupertinoActionSheet(
              message: Text("اضف صورة"),
              actions: <Widget>[
                CupertinoActionSheetAction(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "     الكاميرا          ",
                            style: TextStyle(color: LightColor.black),
                          ),
                          Icon(Ionicons.ios_camera,
                              color: LightColor.iconColor,
                              size: MediaQuery.of(context).size.width / 14)
                        ]),
                    onPressed: () {
                      _selectImage(
                          ImagePicker.pickImage(source: ImageSource.camera));
                    }),
                CupertinoActionSheetAction(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "     صورة            ",
                            style: TextStyle(color: LightColor.black),
                          ),
                          Icon(Ionicons.ios_images, color: LightColor.iconColor)
                        ]),
                    onPressed: () {
                      _selectImage(
                          ImagePicker.pickImage(source: ImageSource.gallery));
                    }),
                CupertinoActionSheetAction(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("     ملف pdf            ",
                              style: TextStyle(color: LightColor.black)),
                          Icon(
                            Ionicons.ios_color_filter,
                            color: LightColor.iconColor,
                          )
                        ]),
                    onPressed: () {
                      _selectImage(
                          ImagePicker.pickImage(source: ImageSource.gallery));
                    }),
                CupertinoActionSheetAction(
                    child: Text(
                      "الغاء",
                      style: TextStyle(color: LightColor.black),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ]);
        });
  }
}
