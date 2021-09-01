import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ptint/themes/AppTheme.dart';
import 'package:ptint/themes/LightColor.dart';

class AddBook extends StatefulWidget {
  @override
  _AddBookState createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  final _fromkey = GlobalKey<FormState>();
  bool activation = false;
  File _image;

  String _dropdownsnapshot;

  TextEditingController _txtAuthorName = TextEditingController();
  TextEditingController _txtDatePublication = TextEditingController();
  TextEditingController _txtPrice = TextEditingController();
  TextEditingController _txtIPhone = TextEditingController();
  TextEditingController _txtDescription = TextEditingController();
  TextEditingController _txtProductStatus = TextEditingController();
  TextEditingController _txtNameBook = TextEditingController();
  TextEditingController _txtEdition = TextEditingController();
  TextEditingController _txtDarAlNasher = TextEditingController();
  TextEditingController _txtBookLanguage = TextEditingController();
  var _autovalidate = false;
  DateTime created;
  bool _osLoading = false;
  List txt = [
    "اقتصاد",
    "تاريخ و جغرافيا ",
    "أدب",
    "تربية وتعليم",
    "دين",
    "تسلية و الغاز",
    "زراعة وتربية حيوان",
    "السياسية",
    "سياحة",
    "صحافة و اعلام ",
    "کتب علوم",
    "صحة و طب",
    "فلسفة و علم نفس ",
    "قانون ",
    "فنون ",
    "لغات ",
    "تغذية ",
    "منوعة ",
    "مراجع و دراسات",
    "اخرى",
  ];
  String radioValue;
  String radioValue1;
  String idUsers;
  String radioValue2;
  @override
  void dispose() {
    super.dispose();
    _txtAuthorName.dispose();
    _txtDatePublication.dispose();
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
    double width = AppTheme.fullWidth(context);
    double height = AppTheme.fullHeight(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("اضافة كتاب"),
        ),
        body: SingleChildScrollView(
            child: Container(
                child: Padding(
                    padding: const EdgeInsets.all(17),
                    child: Column(children: <Widget>[
                      Text(
                        "الرجاء التاكد من صحة بياناتك، ليتم التواصل معاك",
                        style: TextStyle(color: Colors.red),
                      ),
                      Form(
                          key: _fromkey,
                          child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: Container(
                                    width: width / 1.3,
                                    height: height / 2.3,
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
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    width: width,
                                    height: height / 10.6,
                                    child: TextFormField(
                                        autocorrect: true,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        enableSuggestions: false,
                                        maxLength: 30,
                                        controller: _txtNameBook,
                                        decoration: InputDecoration(
                                          hintText: "اسم الكتاب",
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
                                    height: height / 10.6,
                                    child: TextFormField(
                                        autocorrect: true,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        enableSuggestions: false,
                                        maxLength: 30,
                                        controller: _txtAuthorName,
                                        decoration: InputDecoration(
                                          hintText: "اسم المؤلف",
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
                                        })),
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
                                        height: height / 10.6,
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
                                              hintText: "الطبعة",
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
                                  SizedBox(width: 7),
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
                                        height: height / 10.6,
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
                                              hintText: "تاريخ النشر",
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
                                ]),
                                SizedBox(height: height / 65),

                                //
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        width: width,
                                        height: height / 10.6,
                                        child: TextFormField(
                                          autocorrect: true,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          enableSuggestions: false,
                                          maxLength: 30,
                                          controller: _txtProductStatus,
                                          decoration: InputDecoration(
                                            hintText: "حال الكتاب",
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
                                            _txtProductStatus.text = value;
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Expanded(
                                        child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            width: width,
                                            height: height / 10.6,
                                            child: TextFormField(
                                                keyboardType:
                                                    TextInputType.text,
                                                autocorrect: true,
                                                textCapitalization:
                                                    TextCapitalization.words,
                                                enableSuggestions: false,
                                                maxLength: 10,
                                                controller: _txtBookLanguage,
                                                decoration: InputDecoration(
                                                  hintText: "لغة الكتاب",
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
                                  ],
                                ),

                                //
                                SizedBox(height: height / 65),

                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(0.5),
                                          width: 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  width: width,
                                  height: height / 10.6,
                                  child: TextFormField(
                                    autocorrect: true,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    enableSuggestions: false,
                                    maxLength: 30,
                                    controller: _txtDatePublication,
                                    decoration: InputDecoration(
                                      hintText: "دار النشر",
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
                                  height: height / 10.6,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    autocorrect: true,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    enableSuggestions: false,
                                    maxLength: 30,
                                    controller: _txtPrice,
                                    decoration: InputDecoration(
                                      hintText: "السعر",
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

                                category(),

                                SizedBox(height: height / 65),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(0.5),
                                          width: 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  width: width,
                                  height: height / 10.6,
                                  child: TextFormField(
                                    autocorrect: true,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    enableSuggestions: false,
                                    maxLength: 30,
                                    controller: _txtDescription,
                                    decoration: InputDecoration(
                                      hintText: "الوصف",
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
                                RaisedButton(onPressed: _save)
                                /*    RaisedButton(
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
                          },
                        ),
                      */
                              ])))
                    ])))));
  }

  Future getidUsers() async {
    var idUser = FirebaseAuth.instance.currentUser;
    idUsers = idUser.uid;
    print(idUser.uid);
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
      var images1 = await downloadImages(_image);
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        FirebaseFirestore.instance.collection("Book").doc().set({
          "authorName": _txtAuthorName.text,
          "datePublication": _txtDatePublication.text,
          "price": double.parse(
            _txtPrice.text,
          ),
          "image": images1,
          "description": _txtDescription.text,
          "productStatus": _txtProductStatus.text,
          "category": _dropdownsnapshot,
          "nameBook": _txtNameBook.text,
          "darAlNasher": _txtDarAlNasher.text,
          "bookLanguage": _txtBookLanguage.text,
          "edition": _txtEdition.text,
          "userId": user.uid,
          'Created': DateTime.now().millisecond,
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
              fontSize: AppTheme.fullHeight(context) / 35);

          Navigator.of(context).pop();
        });
      } else {
        // No User signed In.
      }
    }
  }

  Widget category() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
          borderRadius: BorderRadius.circular(5)),
      height: AppTheme.fullHeight(context) / 10.6,
      child: DropdownButtonFormField(
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
      ),
    );
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
