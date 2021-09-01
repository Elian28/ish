/* import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class Viewbook extends StatefulWidget {
  @override
  _ViewbookState createState() => _ViewbookState();
}

class _ViewbookState extends State<Viewbook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("كتب مستعملة"),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddBook()));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 5,
                  ),
                  Icon(Ionicons.ios_add_circle_outline,
                      size: MediaQuery.of(context).size.width / 11),
                ],
              ),
            ),
          ],
        ),
        body: books());
  }

  Widget books() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('renads').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
                child: CircularProgressIndicator(
              semanticsLabel: "جاري التحميل...",
            ));
          default:
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      hintText: "دور على كتابك",
                    ),
                  ),
                  chipRowCategory(),
                  Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 23,
                      child: Card(
                          child: Center(
                              child: Text(
                                  "عدد الكتب   ${snapshot.data.docs.length}")))),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, childAspectRatio: 0.57),
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child: Card(
                            elevation: 0,
                            child: Stack(
                              children: <Widget>[
                                //TODO
                                /*   Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Image.network(
                                        "${snapshot.data.documents[index].data["image"]}",
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        fit: BoxFit.fill),
                                  ),
                                ), */
                                GridTile(
                                  child: GestureDetector(
                                    onTap: () {},
                                    /* child: Image.network(
                                          "${snapshot.data.documents[index].data["image"]}",
                                          width:
                                              MediaQuery.of(context).size.width/1,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          fit: BoxFit.fill), */
                                  ),
                                  //معلومات الكتاب
                                  footer: GridTileBar(
                                    backgroundColor: Colors.black87,
                                    title: FittedBox(
                                      child: Text(
                                        "${snapshot.data.docs[index].data()["nameBook"]}\n ${snapshot.data.docs[index].data()["authorName"]}\n${snapshot.data.docs[index].data()["price"].toString()}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 90),
                                      ),
                                    ),
                                    trailing: IconButton(
                                      icon: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Icon(Icons.favorite_border,
                                            size: 20),
                                      ),
                                      color: Colors
                                          .red, //Theme.of(context).accentColor,
                                      onPressed: () {
                                        //product.toggleIsFavorite(auth.token);
                                      },
                                    ),
                                  ),
                                  header: GridTileBar(
                                    backgroundColor: Colors.black87,
                                    leading: Text(
                                      "${snapshot.data.docs[index].data()["category"]}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              36,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: Column(
                                    children: <Widget>[
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              100),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                AddBook()));
                                  },
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
        }
      },
    );
  }

  Widget chipRowCategory() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Category").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text("خطا :${snapshot.error}");
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text("جاري تحميل البيانات ...");
            default:
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children:
                        snapshot.data.docs.map((DocumentSnapshot document) {
                  return Wrap(
                    spacing: 6,
                    children: <Widget>[
                      ActionChip(
                        shadowColor: Colors.white,
                        pressElevation: 90,
                        elevation: 4,
                        label: Text(" " + document["title"] + " "),
                        onPressed: () {},
                        backgroundColor: Colors.grey.withOpacity(0.4),
                      ),
                      SizedBox()
                    ],
                  );
                }).toList()),
              );
          }
        });
  }
}

class AddBook extends StatefulWidget {
  final a;
  AddBook({this.a});
  @override
  _AddBookState createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  final _fromkey = GlobalKey<FormState>();
  bool activation = false;
  var _books = Book();
  File _image;

  String _dropdownsnapshot;

  TextEditingController _txtAuthorName = TextEditingController();
  TextEditingController _txtDatePublication = TextEditingController();
  TextEditingController _txtCity = TextEditingController();
  TextEditingController _txtUniversity = TextEditingController();
  TextEditingController _txtPrice = TextEditingController();
  TextEditingController _txtIPhone = TextEditingController();
  TextEditingController _txtDescription = TextEditingController();
  TextEditingController _txtProductStatus = TextEditingController();
  TextEditingController _txtNameBook = TextEditingController();
  TextEditingController _txtEdition = TextEditingController();
  TextEditingController _txtDarAlNasher = TextEditingController();
  TextEditingController _txtBookLanguage = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _txtAuthorName.dispose();
    _txtDatePublication.dispose();
    _txtCity.dispose();
    _txtUniversity.dispose();
    _txtPrice.dispose();
    _txtIPhone.dispose();
    _txtDescription.dispose();
    _txtProductStatus.dispose();
    _txtNameBook.dispose();
    _txtEdition.dispose();
    _txtDarAlNasher.dispose();
    _txtBookLanguage.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

                 /*        RaisedButton(
                          child: Text("اضافة المنتج"),
                          onPressed: () async {
                            if (_fromkey.currentState.validate()) {
                              //  var images = await _books.DB_downloadImages(_image1);
                              var images1 = await _books.downloadImages(_image);

                              var _book = Book(
                                authorName: _txtAuthorName.text,
                                datePublication: _txtDatePublication.text,
                                price: double.parse(
                                  _txtPrice.text,
                                ),
                             /*    iphone: int.parse(
                                  _txtIPhone.text,
                                ), */
                                image: images1,
                                description: _txtDescription.text,
                                productStatus: _txtProductStatus.text,
                                city: _txtCity.text,
                                university: _txtUniversity.text,
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
                   */    ],
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
}

//عرض محتوي الكتاب
class Mnk extends StatefulWidget {
  final renad;
  Mnk(this.renad);
  @override
  _MnkState createState() => _MnkState(renad);
}

class _MnkState extends State<Mnk> {
  var renad;
  _MnkState(this.renad);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Nnn extends StatefulWidget {
  @override
  _NnnState createState() => _NnnState();
}

class _NnnState extends State<Nnn> {
  bool activation = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text("هل تريد معلومات اضافية"),
      value: activation,
      onChanged: (bool value) {
        setState(() {
          activation = value;
        });
      },
    );
  }
}

class Book {
  String idBook;
  String image; // الصور
  String authorName; // اسم المؤلف
  String datePublication; // تاريخ النشر
  double price; // السعر
  int iphone; // رقم الهاتف
  String description; // الوصف
  String city; // المدينة
  String productStatus; // حال المنتج
  String university;
  String nameBook; // اسم الكتاب
  String darAlNasher; // دار النشر
  String bookLanguage; // لغة الكتاب
  String edition; // الطبعة
  var category;
  String alerts;

  Book({
    this.idBook,
    this.image,
    this.authorName,
    this.datePublication,
    this.price,
    this.iphone,
    this.description,
    this.productStatus,
    this.city,
    this.university,
    this.category,
    this.nameBook,
    this.darAlNasher,
    this.bookLanguage,
    this.edition,
    this.alerts,
  });

  viewBook() {
    FirebaseFirestore.instance.collection("Book").doc().set({
      "image": image,
      "idBook": idBook,
      "authorName": authorName,
      "datePublication": datePublication,
      "price": price,
      "iphone": iphone,
      "description": description,
      "productStatus": productStatus,
      "city": city,
      "university": university,
      "category": category,
      "nameBook": nameBook,
      "darAlNasher": darAlNasher,
      "bookLanguage": bookLanguage,
      "edition": edition,
      "alerts": alerts,
    });
  }

// تنزيل الثور
  Future<String> downloadImages(File image) async {
    String name = Random().nextInt(1000).toString() + "products";
    final Reference storageReference =
        FirebaseStorage.instanceFor().ref().child(name);
    final UploadTask uploadTask = storageReference.putFile(image);
    TaskSnapshot responseSnapshot = await uploadTask.whenComplete(() => null);
    String url = await responseSnapshot.ref.getDownloadURL();
    return url;
  } // النهاية
}
 */