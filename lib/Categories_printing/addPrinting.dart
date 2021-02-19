import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class AddPrinting extends StatefulWidget {
  @override
  _AddPrintingState createState() => _AddPrintingState();
}

class _AddPrintingState extends State<AddPrinting> {
  static const MethodChannel _channel = const MethodChannel('file_picker');
  static const String _tag = 'FilePicker';
  static Future<String> _getPath(String type) async {
    try {
      return await _channel.invokeMethod(type);
    } on PlatformException catch (e) {
      print("[$_tag] Platform exception: " + e.toString());
    }
    return null;
  }

  /*   Future<Map<String, dynamic>> getFilePath({FileType type = FileType.ANY, String fileExtension}) async {
    switch (type) {
      case FileType.ANY:
        final result = await _getPath('ANY');
        return <String, String>{'path': result};
      case FileType.CUSTOM:
        final result = await _getPath('__CUSTOM_' + (fileExtension ?? ''));
        return <String, String>{'path': result};
      default:
        final result = await _getPath('ANY');
        return <String, String>{'path': result};
    }}
 */
  final _fromkey = GlobalKey<FormState>();
  bool activation = false;
  bool activation1 = false;
  //var _books = Book();
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
    return Scaffold(
      appBar: AppBar(
        title: Text("طباعة ملخص"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(17),
            child: Column(
              children: <Widget>[
                Form(
                  key: _fromkey,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "  ملاحظات رفع الملف \n نوع الملفات المسموح بها: pdf.\n أقصى حجم مسموح للملف: 50MB.\n اسم الملف لابد أن يخلو من العلامات التالية (!,@,#,\$,-,&).",
                          style: TextStyle(color: Colors.red),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height / 5,
                            child: OutlineButton(
                              child: viewImage(),
                              onPressed: () {
                                _selectImage(
                                  ImagePicker.pickImage(
                                      source: ImageSource.gallery),
                                );
                              },
                            ),
                          ),
                        ),
                        RaisedButton(
                          child: Text("Pdf"),
                          onPressed: () async {
                            await _getPath('ANY');
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        TextFormField(
                          maxLength: 60,
                          controller: _txtNameBook,
                          decoration: InputDecoration(
                            labelText: "اسم الجامعة / المدرسة",
                          ),
                          validator: (val) {
                            if (val.isEmpty) {
                              return "الرجاء تعبية البيانات";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          maxLength: 60,
                          controller: _txtAuthorName,
                          decoration: InputDecoration(
                            labelText: "اسم القسم / الصف الدراسي",
                          ),
                          validator: (val) {
                            if (val.isEmpty) {
                              return "الرجاء تعبية البيانات";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.datetime,
                          maxLength: 60,
                          controller: _txtDarAlNasher,
                          decoration: InputDecoration(
                            labelText: "اسم المادة",
                          ),
                          validator: (val) {
                            if (val.isEmpty) {
                              return "الرجاء تعبية البيانات";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 60,
                          controller: _txtPrice,
                          decoration: InputDecoration(
                              labelText: "المستوى الجامعية / السنه الدراسية"),
                          validator: (val) {
                            if (val.isEmpty) {
                              return "الرجاء تعبية البيانات";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 60,
                          controller: _txtPrice,
                          decoration: InputDecoration(labelText: "اسم الاستاذ"),
                          validator: (val) {
                            if (val.isEmpty) {
                              return "الرجاء تعبية البيانات";
                            }
                            return null;
                          },
                        ),
                        (activation)
                            ? TextFormField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                maxLines: 9,
                                controller: _txtPrice,
                                decoration:
                                    InputDecoration(labelText: "اضافة ملاحظة"),
                                validator: (val) {
                                  return null;
                                },
                              )
                            : CheckboxListTile(
                                title: Text("هل تريد معلومات اضافية"),
                                value: activation,
                                onChanged: (bool value) {
                                  setState(() {
                                    activation = value;
                                  });
                                },
                              ),
                        Text(
                          "سيتم ارسال الملخص لجميع قرطاسيات مدينتك ، \n وسيتم الرد عليك في حال قبول الطلب",
                          style: TextStyle(color: Colors.red),
                        ),
                        RaisedButton(
                          child: Text("ارسال الملخص"),
                          onPressed: () async {
                            if (_fromkey.currentState.validate()) {
                              //  var images = await _books.DB_downloadImages(_image1);
                              //var images1 = await _books.downloadImages(_image);

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

  Widget category() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Category").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text("خطا :${snapshot.error}");
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text("جاري تحميل البيانات ...");
            default:
              return DropdownButtonFormField<String>(
                  hint: Text("الفئة"),
                  onChanged: (String val) {
                    setState(() {
                      _dropdownsnapshot = val;
                    });
                  },
                  value: _dropdownsnapshot,
                  items:
                      snapshot.data.docs.map((DocumentSnapshot document) {
                    return DropdownMenuItem<String>(
                      value: document["title"],
                      child: Text(
                        document["title"],
                      ),
                    );
                  }).toList());
          }
        });
  }

  Widget viewImage() {
    if (_image == null) {
      return Icon(
        Ionicons.md_cloud_download,
        size: MediaQuery.of(context).size.height / 8,
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
}

//عرض محتوي الكتاب

class ViewBookDetails extends StatefulWidget {
  var viewbook; // ************
  ViewBookDetails(this.viewbook); // ************
  @override
  _ViewBookDetailsState createState() => _ViewBookDetailsState(viewbook);
}

class _ViewBookDetailsState extends State<ViewBookDetails> {
  var viewbook; // ************
  _ViewBookDetailsState(this.viewbook); // ************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${viewbook.data["nameBook"]}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 35,
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.network('${viewbook.data["image"].toString()}',
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width / 1.6,
                  fit: BoxFit.fill),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 29,
            ),
            ListTile(
              title: Text("اسم الكتاب :    " +
                  "${viewbook.data["nameBook"]}" +
                  " \n" +
                  "اسم المؤلف :    " +
                  "${viewbook.data["authorName"]}"),
              subtitle: Text("الوصف :    " +
                  "${viewbook.data["description"]}" +
                  " \n" +
                  "المدينه :   " +
                  "${viewbook.data["city"]}" +
                  "   " +
                  " الجامعة:  " +
                  "${viewbook.data["university"]}" +
                  " تاريخ النشر*:  " +
                  "${viewbook.data["datePublication"]}"),
              trailing: Column(
                children: <Widget>[
                  Text(
                    "RS " + "${viewbook.data["price"].toString()}",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 40,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 45),
            Table(
              border: TableBorder.all(
                  style: BorderStyle.solid,
                  width: 0.9,
                  color: Colors.black.withOpacity(0.4)),
              columnWidths: {
                0: FlexColumnWidth(9.500),
                1: FlexColumnWidth(19),
              },
              children: [
                TableRow(children: [
                  TableCell(
                    child: Text(
                      "#",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 30,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Text(
                      "     " + "#",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 30,
                      ),
                    ),
                  ),
                ]),
                TableRow(children: [
                  TableCell(
                    child: Text(
                      "   الطبعة",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 30,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Text(
                      "     " + "${viewbook.data["edition"]}",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 35,
                      ),
                    ),
                  ),
                ]),
                TableRow(children: [
                  TableCell(
                    child: Text(
                      "  حال الكتاب ",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 30,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Text(
                      "     " + "${viewbook.data["productStatus"]}",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 35,
                      ),
                    ),
                  ),
                ]),
                TableRow(children: [
                  TableCell(
                    child: Text(
                      "  دار النشر",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 30,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Text(
                      "     " + "${viewbook.data["darAlNasher"]}",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 35,
                      ),
                    ),
                  ),
                ]),
                //
                TableRow(children: [
                  TableCell(
                    child: Text(
                      "  الفئة",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 30,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Text(
                      "     " + "${viewbook.data["category"]}",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 35,
                      ),
                    ),
                  ),
                ]),
                TableRow(children: [
                  TableCell(
                    child: Text(
                      "  لغة الكتاب",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 30,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Text(
                      "     " + "${viewbook.data["bookLanguage"]}",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 35),
                    ),
                  ),
                ]),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            RaisedButton(
              child: Text("التواصل مع البائع"),
              onPressed: () {
                setState(() {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // return object of type Dialog
                      return AlertDialog(
                        title: Text("رقم البائع"),
                        content: Text(
                          "${viewbook.data["iphone"]}",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: MediaQuery.of(context).size.height / 35,
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("الغاء"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
