import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ptint/themes/AppTheme.dart';
import 'package:ptint/themes/LightColor.dart';

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
    "أعلام الطاولة \nمع قاعدة حديد",
    // "دعاسات سيارات",
    "دفاتر دعاية",
    "طباعة بلونات",
    //  "طباعة ساعات حائط",
    "طباعة طاقية او قبعة",
    "طباعة علب الحلويات\n الفاخرة",
    "طباعة فنجان او اكواب",
    "علم المقام السارية",
    "علم شراعية",
    " usb ",
    "ولاعة",
    "لافتة طرقية",
    "اكواب أو فنجان سحري",
    "ميداليات مفاتيح\n مستطيلة حديد",
    "ميداليات مفاتيح دائرية",
    "وراقات مكتبية\n مع ورق ملاحظات",
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

  bool show = false;
  bool _actualLinear = false;
  bool _actualSymbolic = false;

  List<Player> _availablePlayers = [];
  List<Player> _selectedPlayers = [];
  File _image;
  @override
  void initState() {
    super.initState();
    _availablePlayers = [
      Player(id: 0, name: "مصمم", picture: "test"),
      Player(id: 1, name: "لدي تصميم", picture: "test"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double width = AppTheme.fullWidth(context);
    double height = AppTheme.fullHeight(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("مطبوعات الدعاية"),
        ),
        body: viewbook());
  }

  Widget viewbook() {
    double width = AppTheme.fullWidth(context);
    double height = AppTheme.fullHeight(context);
    return Column(
      children: [
        Card(
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
        ),
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
                                            text: list[index]
                                                .toString()
                                                .toString(),
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
                                      Fluttertoast.showToast(
                                          msg: "تم اضافة المنتج",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: LightColor.iconColor,
                                          textColor: LightColor.titleTextColor,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              35);
                                    }
                                  },
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
                                            onPressed: () {
                                              if (_actualSymbolic == true ||
                                                  _actualLinear == true) {
                                                setState(() {
                                                  _actualSymbolic = false;
                                                  _actualLinear = false;
                                                  return _selectPlayer();
                                                });
                                              } else {
                                                Fluttertoast.showToast(
                                                    msg: "قوم باضافة منتج",
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
                                            }))),
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
                      msg: "",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: LightColor.iconColor,
                      textColor: LightColor.titleTextColor,
                      fontSize: MediaQuery.of(context).size.height / 35);
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
}
