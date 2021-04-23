import 'dart:io';
import 'dart:math';
import 'package:badges/badges.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ptint/Hype/Balloons.dart';
import 'package:ptint/Hype/Cards/fff.dart';
import 'package:ptint/Hype/Flags.dart';
import 'package:ptint/Hype/HatOrHat.dart';
import 'package:ptint/Hype/Notebooks.dart';
import 'package:ptint/Hype/SweetsBoxes.dart';
import 'package:ptint/Hype/cup.dart';
import 'package:ptint/themes/AppTheme.dart';
import 'package:ptint/themes/LightColor.dart';
import 'package:ptint/themes/TitleText.dart';

import 'package:hive_flutter/hive_flutter.dart';

class Player {
  int id;
  String name;
  String picture;
  bool groupValues;
  Player({this.id, this.name, this.picture, this.groupValues});
}

class PrintAdvertising extends StatefulWidget {
  @override
  _PrintRestaurantsState createState() => _PrintRestaurantsState();
}

class _PrintRestaurantsState extends State<PrintAdvertising> {
  List<Widget> onTap1 = [];
  List list = [
    "أعلام الطاولة مع \nقاعدة حديد",
    // "دعاسات سيارات",
    "دفاتر دعاية",
    "طباعة بلونات",
    //  "طباعة ساعات حائط",
    "طباعة طاقية او قبعة",
    "طباعة علب الحلويات\n الفاخرة",
    "طباعة فنجان او\nاكواب",
    //  "علم المقام السارية",
    "علم شراعية",
    //  " usb ",
    //  "ولاعة",
    "لافتة طرقية",
    "اكواب أو فنجان \nسحري",
    "ميداليات مفاتيح\n مستطيلة حديد",
    "ميداليات مفاتيح \nدائرية",
    "وراقات مكتبية مع \nورق ملاحظات",
    "اقلام معدن فاخرة",
    "بروشات",
    "أقلام معدن",
    "أقلام بلاستيك",
    "أعلام حائط",
  ];
  List imgs = [
    'https://image.freepik.com/free-photo/saudi-arabia-flag-against-city-blurred-background-sunrise-backlight_1379-1638.jpg',
    'https://image.freepik.com/free-psd/book-cover-mockup_258438-151.jpg',
    'https://image.freepik.com/free-vector/golden-balloons-transparent-background_25819-515.jpg',
    'https://image.freepik.com/free-vector/vector-realistic-illustration-white-black-textile-baseball-cap-front-back-side-view_1441-558.jpg',
    'https://image.freepik.com/free-psd/realistic-chocolate-box-packaging-mockup_115122-1075.jpg',
    'https://as1.ftcdn.net/jpg/02/57/28/76/1000_F_257287622_5kUcibHZatFJAKVvKjZo7br8OMoK3qoy.jpg',
    'https://sc02.alicdn.com/kf/HTB1EVH5Kf5TBuNjSspc762nGFXaP.png',
    'https://cdn4.vectorstock.com/i/thumb-large/04/93/feather-beach-flag-vector-24560493.jpg',
    'https://image.freepik.com/free-vector/flash-drive_53876-37484.jpg',
    'https://image.freepik.com/free-vector/realistic-lighters-set_1284-20460.jpg',
    'https://image.freepik.com/free-vector/vector-set-blank-traffic-road-signs_107791-3326.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/51wD905UO1L._AC_SX679_.jpg',
    'https://customartmade.files.wordpress.com/2019/10/x354-q80.jpg?w=354',
    'https://media.joigift.com/catalog/product/cache/afad95d7734d2fa6d0a8ba78597182b7/2/_/2_1__5.jpg',
    'https://www.qualiteyprinting.com/image/cache/catalog/demo/yeni%20name/visit%20kart/mock%20up%207/%D9%88%D8%B1%D8%A7%D9%82%D9%8A%D8%A7%D8%AA-550x550w.jpg',
    'https://image.freepik.com/free-vector/fountain-pen-design-illustration-isolated-white-background_208593-161.jpg',
    'https://image.freepik.com/free-vector/pin-badges-white-round-blank-button-advertise-metal-3d-circle-sign-souvenir-badging-mockup_176411-95.jpg',
    'https://image.freepik.com/free-vector/business-pen-set_1284-21143.jpg',
    'https://image.freepik.com/free-vector/colorful-illustration-style-white-background_223337-856.jpg',
    'https://image.freepik.com/free-vector/saudi-arabia-independence-day-template_96807-157.jpg',
  ];

  List<dynamic> onTaps = [
    Flags(),
    Notebooks(),
    Balloons(),
    HatOrHat(),
    SweetsBoxes(),
    Cup(),
  ];

  bool show = false;
  bool _actualLinear = false;
  bool _actualSymbolic = false;
  Box<String> friendsBox;

  List<Player> _availablePlayers = [];
  File _image;
  @override
  void initState() {
    super.initState();
    friendsBox = Hive.box<String>("friends");
    _availablePlayers = [
      Player(id: 0, name: "مصمم", picture: "test"),
      Player(id: 1, name: "لدي تصميم", picture: "test"),
    ];
  }

  //  number();
  Widget setupAlertDialoadContainer1() {
    return Container(
      height: 300.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 22,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Gujarat, India'),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = AppTheme.fullWidth(context);
    double height = AppTheme.fullHeight(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("مطبوعات الدعاية"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                  child: Badge(
                badgeColor: LightColor.iconColor,
                badgeContent: Text(
                  "",
                  style: TextStyle(color: Colors.white),
                ),
                child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => CartScreen()));
                    }),
              )),
            )
          ],
        ),
        body: viewbook());
  }

  Widget viewbook() {
    double width = AppTheme.fullWidth(context);
    double height = AppTheme.fullHeight(context);
    return ListView(
      children: [
/*         Card(
          shape:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black54)),
          //    b: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Column(children: [
            Text("الشعار الذي سيتم طباعته"),
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                    width: width / 1.7,
                    height: height / 5.9,
                    child: OutlineButton(
                        child: viewImage(),
                        onPressed: () {
                          _selectPlayer();
                        })))
          ]),
        ), */
/*         Container(
          height: 300,
          child: ValueListenableBuilder(
            valueListenable: friendsBox.listenable(),
            builder: (context, Box<String> friends, _) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    final key = friends.keys.toList()[index];
                    final value = friends.get(key);

                    return ListTile(
                      title: Text(
                        value,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      subtitle: Text(key,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    );
                  },
                  separatorBuilder: (_, index) => Divider(),
                  itemCount: friends.keys.toList().length);
            },
          ),
        ), */
        Container(
            height: 600,
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1),
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(children: [
                    Container(
                        width: width / 1.9,
                        height: height / 5,
                        child: new Card(
                            elevation: 0,
                            child: Stack(children: <Widget>[
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                            padding: EdgeInsets.all(9),
                                            /*    decoration: BoxDecoration(
                                                 color: LightColor.titleTextColor,
                                                 borderRadius: BorderRadius.circular(24)), */
                                            child: Image.network(imgs[index],
                                                width:
                                                    AppTheme.fullWidth(context),
                                                height: AppTheme.fullHeight(
                                                    context),
                                                fit: BoxFit.fill))),
                                    /*  Padding(
                                        padding:
                                            const EdgeInsets.symmetric(vertical: 9 / 4),
                                        child: Text(
                                          // products is out demo list
                                          list[index].toString(),
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                       Text(
                                            document["price"].toString() ,
                                           style: TextStyle(fontWeight: FontWeight.bold),
                                         ) */
                                    Row(children: <Widget>[
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: list[index].toString(),
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                        TextSpan(
                                            text: "   ",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold))
                                      ])),
                                      SizedBox(width: 3)
                                    ])
                                  ]),
                              //8
                              InkWell(
                                  onTap: () {
                                    if (_actualSymbolic == false ||
                                        _actualLinear == false) {
                                      setState(() {
                                        _actualSymbolic = true;
                                        _actualLinear = true;
                                        _selectPlayer();
                                      });
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              content: onTaps[index],
                                            );
                                          });

                                      //  _A123();
                                      /*   Fluttertoast.showToast(
                                          msg: "تم اضافة المنتج",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: LightColor.iconColor,
                                          textColor: LightColor.titleTextColor,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              35); */
                                    }
                                  },
                                  /*   onTap: () {
                                    A123();
                                  },
 */
                                  //() {

                                  /*     if (_actualSymbolic == false ||
                                        _actualLinear == false) {
                                      setState(() {
                                        _actualSymbolic = true;
                                        _actualLinear = true;
                                        _selectPlayer();
                                      });
                                    } else {
                                      A123();
                                      //return onTap[index];
                                    } */
                                  // },
                                  /* () {
                                        /*     Navigator.of(context).push(MaterialPageRoute(
                                            builder: (BuildContext context) => onTap[index])); */
                                      }, */
                                  /*onTap: () {
                                         Navigator.of(context).push(MaterialPageRoute(
                                             builder: (BuildContext context) =>
                                                 DoctorsInfo(
                                                   idBook: snapshot.data.docs[index].id,
                                                   authorName:
                                                       snapshot.data.docs[index].data()["authorName"],
                                                 )));},*/
                                  child: Container(
                                      width: 150,
                                      margin: EdgeInsets.only(right: 16),
                                      padding: EdgeInsets.only(
                                          top: 16, right: 16, left: 16),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[])))
                            ])))
                  ]);
                })),
      ],
    );
  }

  _selectPlayer() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            actions: <Widget>[
              InkWell(
                child: Container(
                    width: 150,
                    height: 150,
                    child: Card(
                        //
                        child: FlatButton(
                            child: Text("انشاء تصميم"),
                            onPressed: () {
                              return Center(
                                  child: AlertDialog(actions: <Widget>[
                                Container(
                                    width: 150,
                                    height: 150,
                                    child: Card(
                                        child: FlatButton(
                                            child: Column(children: [
                                              Text("انشاء تصميم"),
                                              Icon(Icons.add)
                                            ]),
                                            onPressed: _selectPlayer1() //() {
                                            /*           if (_actualSymbolic == true ||
                                                  _actualLinear == true) {
                                                setState(() {
                                                  _actualSymbolic = false;
                                                  _actualLinear = false;
                                              
                                                });
                                              } else {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "تم ارسال الطلب وسيتم الرد عليك في اقرب وقت",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.CENTER,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        LightColor.iconColor,
                                                    textColor: LightColor
                                                        .titleTextColor,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            35);
                                              }
                                            } */

                                            ))),
                                Container(
                                    width: 150,
                                    height: 150,
                                    child: Card(
                                        child: FlatButton(
                                            child: Text("طباعة تصميم"),
                                            onPressed: () {
                                              print(
                                                  "Continue with another page");
                                            })))
                              ]));
                            }))),
              ),
              Container(
                  width: 150,
                  height: 150,
                  child: Card(
                    child: FlatButton(
                        child: Text("طباعة تصميم"),
                        onPressed: () {
                          _selectImage(
                            ImagePicker.pickImage(source: ImageSource.gallery),
                          );
                        }),
                  )),
            ],
          ),
        );
      },
    );
  }

  _selectPlayer1() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(actions: <Widget>[
          Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: CheckboxListTile(
                      title: Text('خطي'),
                      value: _actualLinear,
                      onChanged: (bool value) {
                        setState(() {
                          _actualLinear = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    child: CheckboxListTile(
                      title: Text('رمزي'),
                      value: _actualSymbolic,
                      onChanged: (bool value) {
                        setState(() {
                          _actualLinear = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              /*     Row(
                children: [
                  Container(
                      /*  width: 150,
                  height: 150, */
                      child: Card(
                          child: FlatButton(
                              child: Text("خطي"), onPressed: () {}))),
                  Container(
                      /*   width: 150,
                  height: 150, */
                      child: Card(
                          child: FlatButton(
                              child: Text("رمزي"), onPressed: () {}))),
                  Container(
                      /*    width: 150,
                  height: 150, */
                      child: Card(
                          child: FlatButton(
                    child: Text("الكل"),
                    onPressed: () {},
                  ))),
                ],
              ),
           */
              Container(
                height: AppTheme.fullHeight(context) / 12,
                width: AppTheme.fullWidth(context),
                child: Card(
                  child: TextField(
                    //  onChanged: (value) {},
                    cursorColor: Colors.black54,
                    style: TextStyle(color: Colors.black54),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      hintText: 'اسم الشاط',
                    ),
                  ),
                ),
              ),
              Container(
                height: AppTheme.fullHeight(context) / 12,
                width: AppTheme.fullWidth(context),
                child: Card(
                  child: TextField(
                    //  onChanged: (value) {},
                    cursorColor: Colors.black54,
                    style: TextStyle(color: Colors.black54),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      hintText: 'لون النشاط',
                    ),
                  ),
                ),
              ),
              RaisedButton(
                child: Text('ارسال الطلب'),
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "تم ارسال الطلب وسيتم الرد عليك في اقرب وقت",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: LightColor.iconColor,
                      textColor: LightColor.titleTextColor,
                      fontSize: MediaQuery.of(context).size.height / 35);

                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ]);
      },
    );
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

  Widget viewImage() {
    if (_image == null) {
      return Icon(
        Ionicons.ios_images,
        size: AppTheme.fullHeight(context) / 6,
        color: Colors.grey,
      );
    } else {
      return Image.file(_image,
          fit: BoxFit.cover, width: double.infinity, height: double.infinity);
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
                      style: TextStyle(color: Colors.black),
                    ),
                    Icon(
                      Ionicons.ios_camera,
                      color: Colors.blue,
                      size: AppTheme.fullWidth(context) / 14,
                    ),
                  ],
                ),
                onPressed: () {
                  _selectImage(
                    ImagePicker.pickImage(source: ImageSource.camera),
                  );
                },
              ),
              CupertinoActionSheetAction(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "     صورة            ",
                      style: TextStyle(color: Colors.black),
                    ),
                    Icon(
                      Ionicons.ios_images,
                      color: Colors.blue,
                    ),
                  ],
                ),
                onPressed: () {
                  _selectImage(
                    ImagePicker.pickImage(source: ImageSource.gallery),
                  );
                },
              ),
              CupertinoActionSheetAction(
                child: Text(
                  "الغاء",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

//!المحتوى الداخلي

  _A123() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(actions: <Widget>[
          Column(
            children: <Widget>[
              // SizedBox(height: 70,),
              Text(
                ' نوع الورق',
                style: TextStyle(
                    // fontSize: _mediaQuery.height / 40,
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
                      groupValue: null,
                      onChanged: null),

                  Text(
                    'عادي',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Radio(
                      activeColor: Colors.blue,
                      value: 1,
                      groupValue: null,
                      onChanged: null),
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
                    //   fontSize: _mediaQuery.height / 40,
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
                      groupValue: null,
                      onChanged: null),
                  Text(
                    'اسود',
                    // style: TextStyle(fontSize: _mediaQuery.height / 50),
                  ),
                  Radio(
                      activeColor: Colors.blue,
                      value: 1,
                      groupValue: null,
                      onChanged: null),
                  Text(
                    'ملون',
                    //  style: TextStyle(fontSize: _mediaQuery.height / 50),
                  ),
                ],
              ),
              SizedBox(
                  // height: _mediaQuery.height / 40,
                  ),
              Text(
                "خيارات التغليف",
                style: TextStyle(
                    //  fontSize: _mediaQuery.height / 40,
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
                      groupValue: null,
                      onChanged: null),
                  Text(
                    'بدون تغليف',
                    // style: TextStyle(fontSize: _mediaQuery.height / 50),
                  ),
                  Radio(
                      activeColor: Colors.blue,
                      value: 1,
                      groupValue: null,
                      onChanged: null),
                  Text(
                    'حافظ انبوبي',
                    // style: TextStyle(fontSize: _mediaQuery.height / 50),
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
                              /*     Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => AddPrint())); */
                            },
                          ),
                        ],
                      ),
                      RaisedButton(
                          color: Colors.cyan[400],
                          child: Text("طباعة"),
                          onPressed: () async {
                            Navigator.pop(context);

                            Fluttertoast.showToast(
                                msg: "تم ارسال الطلب بنجاح ",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.cyan[800],
                                textColor: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height / 35);
                          })
                    ],
                  ),
                ),
              )
            ],
          )
        ]);
      },
    );
  }

  int numOfItems = 1;
  bool _activation = false;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

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

  number() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(actions: <Widget>[
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
                //  _txtDescription = value;
              },
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(1.0, 14, 1, 0),
              child: Row(children: [
                Column(
                  children: [
                    TEXT(
                        txt: "تاريخ التسليم", color: LightColor.titleTextColor),
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
                                : "${selectedDate.toLocal()}".split(' ')[0]),
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
              ])),
          Center(
            child: RaisedButton(
              child: Text('ارسال الطلب'),
              onPressed: () {
                Fluttertoast.showToast(
                    msg: "تم ارسال الطلب وسيتم الرد عليك في اقرب وقت",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: LightColor.iconColor,
                    textColor: LightColor.titleTextColor,
                    fontSize: MediaQuery.of(context).size.height / 35);

                Navigator.of(context).pop();
              },
            ),
          ),
        ]);
      },
    );
  }
}
