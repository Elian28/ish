/* //2
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ptint/3/_New.dart';
import 'package:ptint/themes/AppTheme.dart';
import 'package:ptint/themes/LightColor.dart';
import 'package:ptint/themes/TitleText.dart';

import 'book2.dart';
import 'book3.dart';
import 'bookData.dart';

class Stationery extends StatefulWidget {
  @override
  _StationeryState createState() => _StationeryState();
}

// الكتب المستعملة
// السوق بالعرض
class _StationeryState extends State<Stationery> {
  File _image;
  final _fromkey = GlobalKey<FormState>();
  Book _books;
  TextEditingController _txtAuthorName = TextEditingController();
  TextEditingController _txtDatePublication = TextEditingController();
  //TextEditingController _txtCity = TextEditingController();
  //TextEditingController _txtName = TextEditingController();
  TextEditingController _txtPrice = TextEditingController();
  //TextEditingController _txtIPhone = TextEditingController();
  TextEditingController _txtDescription = TextEditingController();
  TextEditingController _txtProductStatus = TextEditingController();
  TextEditingController _txtNameBook = TextEditingController();
  TextEditingController _txtEdition = TextEditingController();
  TextEditingController _txtDarAlNasher = TextEditingController();
  TextEditingController _txtBookLanguage = TextEditingController();
  String _dropdownsnapshot;

  @override
  void dispose() {
    super.dispose();
    _txtAuthorName.dispose();
    _txtDatePublication.dispose();
    // _txtCity.dispose();
    // _txtName.dispose();
    _txtPrice.dispose();
    //_txtIPhone.dispose();
    _txtDescription.dispose();
    _txtProductStatus.dispose();
    _txtNameBook.dispose();
    _txtEdition.dispose();
    _txtDarAlNasher.dispose();
    _txtBookLanguage.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: TextField(
            decoration: InputDecoration(
              labelText: "البحث عن منتجك",
            ),
          ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(left: 15),
                child: IconButton(
                  icon: Icon(Ionicons.ios_add_circle_outline,
                      //   color: Colors.blue[700],
                      size: 31),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            pro() /* ShoppingList() */));
                  },
                )),
          ],
        ),
        body: viewbook());
  }
/* 
FirebaseFirestore.instance
    .collection('talks')
    .where("topic", isEqualTo: "flutter")
    .snapshots()
    .listen((data) =>
        data.documents.forEach((doc) => print(doc["title"])));
 */
// باجلها قائمة عرض المنتجات

  Widget viewbook() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Book').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                  child: CircularProgressIndicator(
                semanticsLabel: "جاري التحميل...",
              ));
            default:
              return new GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.73),
                children: snapshot.data.docs.map((DocumentSnapshot document) {
                  return new InkWell(
                    child: new Card(
                      elevation: 0,
                      child: Stack(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                  padding: EdgeInsets.all(9),
                                  decoration: BoxDecoration(
                                      color: LightColor.lightOrange,
                                      borderRadius: BorderRadius.circular(24)),
                                  /*    child: Hero(
                                            tag: document["idBook"],
                                            child: Image.network(
                                                document["image"].toString(),
                                                height: 160,
                                                fit: BoxFit.fitHeight)) */
                                )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 9 / 4),
                                  child: Text(
                                    // products is out demo list
                                    document["nameBook"],
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                                /*   Text(
                                   document["price"].toString() ,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ) */
                                Row(
                                  children: <Widget>[
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text:
                                                  document["price"].toString(),
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                          TextSpan(
                                              text: "  RS ",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 3),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          //8
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      DoctorsInfo(
                                        //    idBook: document.id,
                                        authorName:
                                            document.data()["authorName"],
                                      )));
                            },
                            child: Container(
                              width: 150,
                              margin: EdgeInsets.only(right: 16),
                              padding:
                                  EdgeInsets.only(top: 16, right: 16, left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
          }
        });
  }
//

  Widget _form(BuildContext context, QuerySnapshot data) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('profile')
            .where('user_type', isEqualTo: 'Dealer') //
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                  child: CircularProgressIndicator(
                semanticsLabel: "جاري التحميل...",
              ));
            default:
              return ListView(children: <Widget>[
                TEXT(
                  txt: "عدد المتاجر المضافة :  " +
                      "(${snapshot.data.docs.length.toString()})".toString(),
                ),
                AppTheme.divider,
                SizedBox(height: MediaQuery.of(context).size.height / 55),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          child: ListTile(
                              trailing: Column(children: [
                                TEXT(
                                  txt:
                                      "${snapshot.data.docs[index]["Delivery"]}"
                                          .toString(),
                                ),
                              ]),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => News()));
                                // ViewHom(snapshot.data.documents[index])));
                              },
                              title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(children: <Widget>[
                                      TEXT(
                                          txt:
                                              "${snapshot.data.docs[index]["name"]}"
                                                  .toString()),
                                    ]),
                                    TEXT(
                                      txt: "الاسم التاجر : " +
                                          "${snapshot.data.docs[index]["name"]}"
                                              .toString(),
                                    ),
                                    Center(
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: LightColor.redDark,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                '50% (خصم)',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
                                              ))),
                                    ),
                                    /*          Text(
                'Latitude: ${snapshot.data.docs[index]["latitude"] != null ?snapshot.data.docs[index]["latitude"].toString() : '0'},\n'
                    ' Longitude: ${snapshot.data.docs[index]["longitude"] != null ? snapshot.data.docs[index]["longitude"].toString() : '0'}'
                   // ' Longitude: ${_currentPosition != null ? _currentPosition.longitude.toString() : '0'}'
            )*/
                                  ])));
                    }),
              ]);
          }
        });
  }

//
  void showproduct(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.0),
        ),
        context: context,
        builder: (builder) {
          return Stack(children: <Widget>[
            Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50, right: 50),
                    child: Container(
                      height: 50,
                      width: 300,
                      child: RaisedButton(
                        elevation: 0,
                        color: Colors.cyan,
                        child: Text(
                          "تأكيد الطلب",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //
/*             Padding(
              padding: const EdgeInsets.only(top: 700),
              child: Row(
                children: <Widget>[
                  Quantity(),
                ],
              ),
            ), */

            Column(children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: ExactAssetImage("assets/images/q9.jpg"),
                )),
              ),
              SizedBox(
                height: 30,
                width: 50,
              ),
              Mycolos(),
              // الاضافة هنا
              // SizedBox( height: 80, ),

              ListTile(
                  onTap: () {
                    showproduct(context);
                  },
                  title: ExpansionTile(
                      title: Text("الخيارات المتاحة"),
                      children: <Widget>[
                        Text("الخيارات المتاحة"),
                      ]))
            ])
          ]);
        });
  }
  Widget pro() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("اضافة كتاب"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(17),
            child: Column(
              children: <Widget>[
                Text(
                  "الرجاء التاكد من صحة بياناتك، ليتم التواصل معاك",
                  style: TextStyle(color: Colors.red),
                ),
                Form(
                  key: _fromkey,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.3,
                            height: MediaQuery.of(context).size.height / 2.3,
                            child: OutlineButton(
                              child: viewImage(),
                              onPressed: () {
                                uploadPhotos();
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 80),
                        Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: width,
                            height: 50,
                            child: TextFormField(
                                autocorrect: true,
                                textCapitalization: TextCapitalization.words,
                                enableSuggestions: false,
                                maxLength: 30,
                                controller: _txtNameBook,
                                decoration: InputDecoration(
                                  labelText: "اسم الكتاب",
                                  prefixIcon: Icon(Icons.edit),
                                  border: InputBorder.none,
                                ),
                                validator: (val) {
                                  if (val.isEmpty || val.length < 4) {
                                    return "الرجاء إدخال 4 أحرف على الأقل";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _txtNameBook.text = value;
                                })),
                        //
                        SizedBox(height: height / 65),

                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.5),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: width,
                          height: 50,
                          child: TextFormField(
                            autocorrect: true,
                            textCapitalization: TextCapitalization.words,
                            enableSuggestions: false,
                            maxLength: 30,
                            controller: _txtAuthorName,
                            decoration: InputDecoration(
                              labelText: "اسم المؤلف",
                              prefixIcon: Icon(Icons.edit),
                              border: InputBorder.none,
                            ),
                            validator: (val) {
                              if (val.isEmpty || val.length < 4) {
                                return "الرجاء إدخال 4 أحرف على الأقل";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _txtAuthorName.text = value;
                            },
                          ),
                        ),
                        //
                        SizedBox(height: height / 65),

                        Row(children: <Widget>[
                          Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.5),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                width: width,
                                height: 50,
                                child: TextFormField(
                                    keyboardType: TextInputType.datetime,
                                    autocorrect: true,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    enableSuggestions: false,
                                    maxLength: 9,
                                    controller: _txtEdition,
                                    decoration: InputDecoration(
                                      labelText: "الطبعة",
                                      border: InputBorder.none,
                                    ),
                                    validator: (val) {
                                      if (val.isEmpty ||
                                          val.length < 4 ||
                                          !val.contains('/')) {
                                        return "الرجاء تعبية البيانات بالشكل المطلوب";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _txtEdition.text = value;
                                    })),
                          ),

                          //
                          SizedBox(
                            width: 7,
                          ),
                          Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.5),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                width: width,
                                height: 50,
                                child: TextFormField(
                                    keyboardType: TextInputType.datetime,
                                    autocorrect: true,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    enableSuggestions: false,
                                    maxLength: 4,
                                    controller: _txtDarAlNasher,
                                    decoration: InputDecoration(
                                      labelText: "تاريخ النشر",
                                      border: InputBorder.none,
                                    ),
                                    validator: (val) {
                                      if (val.isEmpty || val.length < 4) {
                                        return "الرجاء تعبية البيانات بالشكل المطلوب";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _txtDarAlNasher.text = value;
                                    })),
                          ),

                          //
                          SizedBox(
                            width: 7,
                          ),
                          Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.withOpacity(0.5),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  width: width,
                                  height: 50,
                                  child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      autocorrect: true,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      enableSuggestions: false,
                                      maxLength: 10,
                                      controller: _txtBookLanguage,
                                      decoration: InputDecoration(
                                        labelText: "لغة الكتاب",
                                        border: InputBorder.none,
                                      ),
                                      validator: (val) {
                                        if (val.isEmpty || val.length < 4) {
                                          return "الرجاء تعبية البيانات بالشكل المطلوب";
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _txtBookLanguage.text = value;
                                      })))
                        ]),
                        SizedBox(height: height / 65),

                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.5),
                                  width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          width: width,
                          height: 50,
                          child: TextFormField(
                            autocorrect: true,
                            textCapitalization: TextCapitalization.words,
                            enableSuggestions: false,
                            maxLength: 30,
                            controller: _txtDatePublication,
                            decoration: InputDecoration(
                              labelText: "دار النشر",
                              prefixIcon: Icon(Icons.edit),
                              border: InputBorder.none,
                            ),
                            validator: (val) {
                              if (val.isEmpty || val.length < 4) {
                                return "الرجاء إدخال 4 أحرف على الأقل";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _txtDatePublication.text = value;
                            },
                          ),
                        ),
                        SizedBox(height: height / 65),

                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.5),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: width,
                          height: 50,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            autocorrect: true,
                            textCapitalization: TextCapitalization.words,
                            enableSuggestions: false,
                            maxLength: 30,
                            controller: _txtPrice,
                            decoration: InputDecoration(
                              labelText: "السعر",
                              prefixIcon: Icon(
                                Icons.monetization_on,
                                color: Colors.yellow[900],
                              ),
                              border: InputBorder.none,
                            ),
                            validator: (val) {
                              if (val.isEmpty) {
                                return "الرجاء تحديد السعر";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _txtPrice.text = value;
                            },
                          ),
                        ),

                        SizedBox(height: height / 65),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.5),
                                  width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          width: width,
                          height: 50,
                          child: TextFormField(
                            autocorrect: true,
                            textCapitalization: TextCapitalization.words,
                            enableSuggestions: false,
                            maxLength: 30,
                            controller: _txtDescription,
                            decoration: InputDecoration(
                              labelText: "الوصف",
                              prefixIcon: Icon(Icons.edit),
                              border: InputBorder.none,
                            ),
                            validator: (val) {
                              if (val.isEmpty || val.length < 4) {
                                return "الرجاء إدخال 4 أحرف على الأقل";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _txtDescription.text = value;
                            },
                          ),
                        ),
                        SizedBox(height: height / 65),

                        RaisedButton(
                          child: Text("اضافة المنتج"),
                          onPressed: () async {
                            if (_fromkey.currentState.validate()) {
                              //  var images = await _books.DB_downloadImages(_image1);
                          //    var images1 = await _books.downloadImages(_image);

                              var _book = Book(
                                authorName: _txtAuthorName.text,
                                datePublication: _txtDatePublication.text,
                                price: double.parse(
                                  _txtPrice.text,
                                ),
                              
                                //image: images1,
                                description: _txtDescription.text,
                                productStatus: _txtProductStatus.text,
                              
                                category: _dropdownsnapshot,
                                nameBook: _txtNameBook.text,
                                darAlNasher: _txtDarAlNasher.text,
                                bookLanguage: _txtBookLanguage.text,
                                edition: _txtEdition.text,
                              );

                              _book.viewBook();
                              Fluttertoast.showToast(
                                  msg: "تم اضافة المنتج",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.cyan[800],
                                  textColor: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 35);

                              Navigator.pop(context);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget pro1() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(),
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
                                Text(
                                  " اضافة منتج ",
                                  style: TextStyle(fontSize: 30),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.3,
                                    height: MediaQuery.of(context).size.height /
                                        2.3,
                                    child: OutlineButton(
                                      child: viewImage(),
                                      onPressed: () {
                                        uploadPhotos();
                                      },
                                    ),
                                  ),
                                ),

/* 
                                IconButton(
                                  icon: Icon(
                                    Ionicons.ios_images,
                                    size: 90,
                                  ),
                                  onPressed: () {
                                    _selectImage(
                                        ImagePicker.pickImage(
                                            source: ImageSource.gallery),
                                        1);
                                  },
                                ), */

                                SizedBox(height: 80),
                                Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.withOpacity(0.5),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    width: width,
                                    height: 50,
                                    child: TextFormField(
                                        autocorrect: true,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        enableSuggestions: false,
                                        maxLength: 30,
                                        controller: _txtNameBook,
                                        decoration: InputDecoration(
                                          labelText: "اسم الكتاب",
                                          prefixIcon: Icon(Icons.edit),
                                          border: InputBorder.none,
                                        ),
                                        validator: (val) {
                                          if (val.isEmpty || val.length < 4) {
                                            return "الرجاء إدخال 4 أحرف على الأقل";
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          _txtNameBook.text = value;
                                        })),
                                //
                                SizedBox(height: height / 65),

                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.withOpacity(0.5),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  width: width,
                                  height: 50,
                                  child: TextFormField(
                                    autocorrect: true,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    enableSuggestions: false,
                                    maxLength: 30,
                                    controller: _txtAuthorName,
                                    decoration: InputDecoration(
                                      labelText: "اسم المؤلف",
                                      prefixIcon: Icon(Icons.edit),
                                      border: InputBorder.none,
                                    ),
                                    validator: (val) {
                                      if (val.isEmpty || val.length < 4) {
                                        return "الرجاء إدخال 4 أحرف على الأقل";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _txtAuthorName.text = value;
                                    },
                                  ),
                                ),
                                //
                                SizedBox(height: height / 65),

                                Row(children: <Widget>[
                                  Expanded(
                                    child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey.withOpacity(0.5),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        width: width,
                                        height: 50,
                                        child: TextFormField(
                                            keyboardType:
                                                TextInputType.datetime,
                                            autocorrect: true,
                                            textCapitalization:
                                                TextCapitalization.words,
                                            enableSuggestions: false,
                                            maxLength: 9,
                                            controller: _txtEdition,
                                            decoration: InputDecoration(
                                              labelText: "الطبعة",
                                              border: InputBorder.none,
                                            ),
                                            validator: (val) {
                                              if (val.isEmpty ||
                                                  val.length < 4 ||
                                                  !val.contains('/')) {
                                                return "الرجاء تعبية البيانات بالشكل المطلوب";
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              _txtEdition.text = value;
                                            })),
                                  ),

                                  //
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Expanded(
                                    child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey.withOpacity(0.5),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        width: width,
                                        height: 50,
                                        child: TextFormField(
                                            keyboardType:
                                                TextInputType.datetime,
                                            autocorrect: true,
                                            textCapitalization:
                                                TextCapitalization.words,
                                            enableSuggestions: false,
                                            maxLength: 4,
                                            controller: _txtDarAlNasher,
                                            decoration: InputDecoration(
                                              labelText: "تاريخ النشر",
                                              border: InputBorder.none,
                                            ),
                                            validator: (val) {
                                              if (val.isEmpty ||
                                                  val.length < 4) {
                                                return "الرجاء تعبية البيانات بالشكل المطلوب";
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              _txtDarAlNasher.text = value;
                                            })),
                                  ),

                                  //
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Expanded(
                                      child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          width: width,
                                          height: 50,
                                          child: TextFormField(
                                              keyboardType: TextInputType.text,
                                              autocorrect: true,
                                              textCapitalization:
                                                  TextCapitalization.words,
                                              enableSuggestions: false,
                                              maxLength: 10,
                                              controller: _txtBookLanguage,
                                              decoration: InputDecoration(
                                                labelText: "لغة الكتاب",
                                                border: InputBorder.none,
                                              ),
                                              validator: (val) {
                                                if (val.isEmpty ||
                                                    val.length < 4) {
                                                  return "الرجاء تعبية البيانات بالشكل المطلوب";
                                                }
                                                return null;
                                              },
                                              onSaved: (value) {
                                                _txtBookLanguage.text = value;
                                              })))
                                ]),
                                SizedBox(height: height / 65),

                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(0.5),
                                          width: 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  width: width,
                                  height: 50,
                                  child: TextFormField(
                                    autocorrect: true,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    enableSuggestions: false,
                                    maxLength: 30,
                                    controller: _txtDatePublication,
                                    decoration: InputDecoration(
                                      labelText: "دار النشر",
                                      prefixIcon: Icon(Icons.edit),
                                      border: InputBorder.none,
                                    ),
                                    validator: (val) {
                                      if (val.isEmpty || val.length < 4) {
                                        return "الرجاء إدخال 4 أحرف على الأقل";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _txtDatePublication.text = value;
                                    },
                                  ),
                                ),
                                SizedBox(height: height / 65),

                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.withOpacity(0.5),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  width: width,
                                  height: 50,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    autocorrect: true,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    enableSuggestions: false,
                                    maxLength: 30,
                                    controller: _txtPrice,
                                    decoration: InputDecoration(
                                      labelText: "السعر",
                                      prefixIcon: Icon(
                                        Icons.monetization_on,
                                        color: Colors.yellow[900],
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    validator: (val) {
                                      if (val.isEmpty) {
                                        return "الرجاء تحديد السعر";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _txtPrice.text = value;
                                    },
                                  ),
                                ),

                                SizedBox(height: height / 65),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(0.5),
                                          width: 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  width: width,
                                  height: 50,
                                  child: TextFormField(
                                    autocorrect: true,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    enableSuggestions: false,
                                    maxLength: 30,
                                    controller: _txtDescription,
                                    decoration: InputDecoration(
                                      labelText: "الوصف",
                                      prefixIcon: Icon(Icons.edit),
                                      border: InputBorder.none,
                                    ),
                                    validator: (val) {
                                      if (val.isEmpty || val.length < 4) {
                                        return "الرجاء إدخال 4 أحرف على الأقل";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _txtDescription.text = value;
                                    },
                                  ),
                                ),
                                SizedBox(height: height / 65),

                                /*          Text("معلومات التواصل"),
                                TextFormField(
                                  controller: _txtName,
                                  decoration: InputDecoration(
                                    labelText: "اسم البائع",
                                  ),
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return "الرجاء تعبية البيانات";
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: _txtCity,
                                  decoration: InputDecoration(
                                    labelText: "المدينه",
                                  ),
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return "الرجاء تعبية البيانات";
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.phone,
                                  controller: _txtIPhone,
                                  decoration: InputDecoration(
                                    labelText: "رقم الهاتف",
                                  ),
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return "الرجاء تعبية البيانات";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: height / 65),
 */

                         /*        RaisedButton(
                                  child: Text("اضافة المنتج"),
                                  onPressed: () async {
                                    if (_fromkey.currentState.validate()) {
                                      //  var images = await _books.DB_downloadImages(_image1);
                                      var images1 =
                                          await _books.downloadImages(_image1);

                                      var _book = Book(
                                        authorName: _txtAuthorName.text,
                                        datePublication:
                                            _txtDatePublication.text,
                                        price: double.parse(
                                          _txtPrice.text,
                                        ),
                                        
                                        image: images1,
                                        description: _txtDescription.text,
                                        productStatus: _txtProductStatus.text,
                                        
                                        category: _dropdownsnapshot,
                                        nameBook: _txtNameBook.text,
                                        darAlNasher: _txtDarAlNasher.text,
                                        bookLanguage: _txtBookLanguage.text,
                                        edition: _txtEdition.text,
                                      );

                                      _book.viewBook();
                                      Fluttertoast.showToast(
                                          msg: "تم اضافة المنتج",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.cyan[800],
                                          textColor: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              35);

                                      Navigator.pop(context);
                                    }
                                  },
                                ),
/* 
                          */       RaisedButton(
                                    child: Text("اضافة المنتج"),
                                    onPressed: () async {
                                      if (_fromkey.currentState.validate()) {
                                        var images1 = await _books
                                            .downloadImages(_image1);

                                        var _book = Book(
                                          authorName: _txtAuthorName.text,
                                          datePublication:
                                              _txtDatePublication.text,
                                          price: double.parse(
                                            _txtPrice.text,
                                          ),
                                          /* iphone: int.parse(
                                            _txtIPhone.text,
                                          ), */
                                          image: images1,
                                          description: _txtDescription.text,
                                          productStatus: _txtProductStatus.text,
                                          // city: _txtCity.text,
                                          // name: _txtName.text,
                                          nameBook: _txtNameBook.text,
                                          darAlNasher: _txtDarAlNasher.text,
                                          bookLanguage: _txtBookLanguage.text,
                                          edition: _txtEdition.text,
                                        );

                                        _book.viewBook();

                                        /* _txtAuthorName.clear();
                                                            _txtDatePublication.clear();
                                                            _txtCity.clear();
                                                            _txtUniversity.clear();
                                                            _txtPrice.clear();
                                                            _txtIPhone.clear();
                                                            _txtDescription.clear();
                                                            _txtProductStatus.clear();
                                                            _txtNameBook.clear();
                                                            _txtEdition.clear();
                                                            _txtDarAlNasher.clear();
                                                            _txtBookLanguage.clear(); */
                                        // Navigator.pop(context);
                                      }
                                    })
                             */
                              ])))
                    ])))));
  }

  // اضافة منتجات
  Widget serviceType() {
    return DropdownButtonFormField(
      hint: Text("نوع الخدمة  "),
      value: _dropdownsnapshot,
      items: [
        "1- اعداد الابحاث لطلاب الكليات",
        "2- مشروعات التخرج للسنة النهائية من البكالريوس",
        "3- اجراء التحاليل الاحصائية لطلاب المجاستير",
        "4- كتابة الرسائل العلمية",
        "5- ترجمة البحوث من الانجليزية الى العربية والعكس",
        "6- توفير المراجع العلمية التى يحتاج اليها العميل",
        "7- التعديل على الاخطاء اللغوية والنحوية في الرسائل",
        "8- طباعة الابحاث والرسائل سواء التى تمت كتابتها\n في المركز او التى كتبها العميل بنفسة.",
        "9-اخرى"
      ]
          //  ['عرض باوربوينت', "تلخيص", ' بحث وترجمة ', "كتاب مشروع تخرج","حل واجبات","تصميم","تسجيل مواقع","","","",""]
          .map((value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      onChanged: (value) {
        setState(() {
          _dropdownsnapshot = value;
        });
      },
    );
  }

  Widget viewImage() {
    if (_image == null) {
      return Icon(
        Ionicons.ios_images,
        size: MediaQuery.of(context).size.height / 6,
        color: Colors.grey,
      );
    } else {
      return Image.file(_image,
          fit: BoxFit.cover, width: double.infinity, height: double.infinity);
    }
  }

  void _selectImage(
    Future<File> pickImage,
  ) async {
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
                      size: MediaQuery.of(context).size.width / 14,
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

/*   void _selectImage(
    Future<File> pickImage,
  ) async {
    File addImage = await pickImage;
    setState(() {
      return _image1 = addImage;
    });
  }

  Widget viewImage() {
    if (_image1 == null) {
      return Icon(
        Ionicons.ios_images,
        size: MediaQuery.of(context).size.height / 6,
        color: Colors.grey,
      );
    } else {
      return Image.file(_image1,
          fit: BoxFit.cover, width: double.infinity, height: double.infinity);
    }
  }

  Widget viewImage1() {
    if (_image1 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(1, 3, 1, 4),
        child: Icon(
          Ionicons.ios_images,
          size: 90,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(
        _image1,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }
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
                      size: MediaQuery.of(context).size.width / 14,
                    ),
                  ],
                ),
                onPressed: () {
                  _selectImage(
                    ImagePicker.pickImage(
                      source: ImageSource.camera,
                    ),
                  );

                  /*    ImagePicker.pickImage(source: source);
                  if (picked != null) {
                    _cropImage(picked).then((File cropped) {
                      saveImage(cropped.path);
                      _saveImg.add(cropped);
                    });
                  }
                  loadImage();
                  Navigator.pop(context);
               */
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
 */}
 */