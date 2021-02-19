import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
//import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ptint/themes/AppTheme.dart';
import 'package:ptint/themes/LightColor.dart';
import 'package:ptint/themes/TitleText.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ResumeModel {
  final String name;
  final String pathOrUrl;
  const ResumeModel({this.name, this.pathOrUrl});
}

class UploadFile112 extends StatefulWidget {
  @override
  _UploadFile112State createState() => _UploadFile112State();
}

class _UploadFile112State extends State<UploadFile112> {
  //File _image;
  bool isSelected = false;
  File pickedImage;
  String _imagepath;
  List _savePdf = [];
  List _saveImg = [];
  bool _isLoading = true;
  bool activation = true;
  PDFDocument document;
  int _radioValue = -1;
  String radioValue;
  var _autovalidate = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.7,
      child: Scaffold(
        appBar: AppBar(
          title: IconButton(icon: Icon(Icons.ac_unit), onPressed: _save),
        ),
        floatingActionButton: FloatingActionButton.extended(
            label: Text('اضافة ملف'),
            icon: Icon(Icons.chat),
            /* backgroundColor: Colors.orange[800],
          foregroundColor: Colors.white, */
            tooltip: 'طباعة',
            onPressed: () {
              uploadPhotos();
            }),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Column(
              children: <Widget>[
                Card(
                    child: ListTile(
                  title: Text("سسسس"
                      /*     "\n${a.data["name"]}"), //Text("الاسم" + " ، " + " الموقع"),
                        subtitle: Text(",${a.data["Delivery"]}" +
                            "  ,\n رقم الهاتف ," +
                            a.data["IPhone"].toString() +
                            "\n" */
                      ), //Text("طريقة الاستيلام" + " ، " + " من الفرع"),
                  trailing: Text("مسافة"), //Text("المسافة"),
                )),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Card(
                    child: TextField(
                      onChanged: (value) {
                        //global.dtl = value;
                      },
                      // controller: _txtTitle,
                      maxLines: 11,
                      maxLength: 500,
                      cursorColor: Colors.black54,
                      style: TextStyle(color: Colors.black54),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.black54),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        hintText: 'اكتب تفاصيل طلبك',
                      ),
                    ),
                  ),
                ),
                Container(
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
                    child: Text("طريقة الدفع")),
                // Text("اضف كوبون"),
                /*    RaisedButton(
                  onPressed: _save,
                ), */
              ],
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                child: Card(child: viewPdf())),
            buildGridView(),
          ]),
        ),
      ),
    );
  }

  Widget viewImage() {
    if (_imagepath == null) {
      return Icon(Icons.cloud_download, color: Colors.grey, size: 90);
    } else {
      return Image.file(
        File(_imagepath),
        fit: BoxFit.cover,
        // width: MediaQuery.of(context).size.width / 5,
        // height: MediaQuery.of(context).size.height / 2.3,
      );
    }
  }

  loadDocument() async {
    //-------------
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    File file = File(result.files.single.path);

    if (result != null) {
      try {
        Random random = new Random();
        int randomNumber = random.nextInt(10000);
        String dir = p.dirname(file.path);
        String newPath = p.join(dir, '$randomNumber.pdf');

        File f = file.renameSync(newPath);

        document = await PDFDocument.fromFile(f);
        setState(() => _isLoading = false);

        _savePdf.add(f);
      } catch (e) {
        print("Error: message here");
      }

      /*      String dir = (await getApplicationDocumentsDirectory()).path;
      //String dir = p.dirname(file.path);
      String newPath = p.join(dir, 'case01wd03id01.pdf');
      print('NewPath: $newPath');
      file.renameSync(newPath);
      File f = await File(file.path).copy(newPath); */
    }
    //-----------------
  }

  Widget buildGridView() {
    return Container(
      height: 100.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          /*       gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1), */
          itemCount: _saveImg.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
                children: _saveImg.map((imageModel) {
              return InkWell(
                  child: Image.file(
                    imageModel,
                    width: 160,
                  ),
                  onTap: () {
                    setState(() {
                      pickedImage = imageModel;
                    });
                  });
            }).toList());
          }),
    );
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
                          Text("      الصور       ",
                              style: TextStyle(color: Colors.black)),
                          Icon(Ionicons.ios_images, color: Colors.blue)
                        ]),
                    onPressed: () {
                      _loadPicker(ImageSource.gallery);
                    }),
                CupertinoActionSheetAction(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("     رفع الملفات            ",
                              style: TextStyle(color: Colors.black)),
                          Icon(Ionicons.ios_images, color: Colors.blue)
                        ]),
                    onPressed: () {
                      loadDocument();
                    }),
                CupertinoActionSheetAction(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("     ماسح ضوئي            ",
                              style: TextStyle(color: Colors.black)),
                          Icon(Ionicons.ios_images, color: Colors.blue)
                        ]),
                    onPressed: () {
                      //     _loadPicker(ImageSource.gallery);
                    }),
                CupertinoActionSheetAction(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("      رفع ملف من Google Drive            ",
                              style: TextStyle(color: Colors.black)),
                          Icon(Ionicons.ios_color_filter, color: Colors.blue)
                        ]),
                    onPressed: () {
                      // loadDocument();
                    }),
                CupertinoActionSheetAction(
                    child: Text(
                      "رفع ملف من DropBox",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                CupertinoActionSheetAction(
                    child: Text(
                      "cancel",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ]);
        });
  }

  _loadPicker(ImageSource source) async {
    File picked = await ImagePicker.pickImage(source: source);
    if (picked != null) {
      _cropImage(picked).then((File cropped) {
        saveImage(cropped.path);
        _saveImg.add(cropped);
      });
    }
    loadImage();
    Navigator.pop(context);
  }

  Widget viewPdf() {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: _savePdf.length,
        itemBuilder: (context, index) {
          return Column(children: [
            Card(
                color: LightColor.kShrinePink50,
                shape: isSelected
                    ? RoundedRectangleBorder(
                        side:
                            BorderSide(color: Colors.indigoAccent, width: 2.0),
                        borderRadius: BorderRadius.circular(90))
                    : RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey[200], width: 2.0),
                        borderRadius: BorderRadius.circular(90)),
                child: Stack(children: <Widget>[
                  FlatButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child:
                          Icon(Icons.picture_as_pdf, color: LightColor.black),
                      onPressed: () async {
                        document = await PDFDocument.fromFile(_savePdf[index]);
                        setState(() {
                          document = document;
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return SafeArea(
                                child: Scaffold(
                              appBar: AppBar(
                                elevation: 0,
                              ),
                              body: Container(
                                  child: Center(
                                      child: _isLoading
                                          ? null
                                          : PDFViewer(
                                              tooltip: PDFViewerTooltip(
                                                  jump: "مشاهدة الصفحات",
                                                  next: "التالي",
                                                  previous: "رجوع",
                                                  last: "صفحة النهاية",
                                                  first: "صفحة البداية"),
                                              // maxScale: 9,
                                              document: document,

                                              //    scrollDirection: Axis.vertical,
                                            ))),
                            ));
                          }));
                        });
                      }),
                  /*    FlatButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Icon(
                        Icons.picture_as_pdf,
                        color: LightColor.black,
                      ),
                      //
                      onPressed: () async {
                        document = await PDFDocument.fromFile(_savePdf[index]);
                        setState(() {
                          if (document != null) {
                            document = document;
                          } else {}
                        });
                      }), */
                  Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              _savePdf.removeWhere(
                                  (element) => element == _savePdf[index]);

                              //_savePdf.remove(_savePdf[index]);
                              document = document;
                            });
                          },
                          child: Icon(
                            Icons.ac_unit,
                            color: Colors.red,
                          )))
                ])),
            Expanded(
                child: InkWell(
                    onTap: () {},
                    child: Card(
                        child: Column(children: [
                      TEXT(
                        txt: "الاسم :" + _savePdf[index].path.split('/').last,
                        size: 10,
                        align: TextAlign.center,
                        fontWeight: FontWeight.w700,
                      )
                    ])))),
          ]);
        });
  }

  Widget viewPdf1() {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: _savePdf.length,
        itemBuilder: (context, index) {
          return Column(children: [
            Card(
                color: LightColor.kShrinePink50,
                shape: isSelected
                    ? RoundedRectangleBorder(
                        side:
                            BorderSide(color: Colors.indigoAccent, width: 2.0),
                        borderRadius: BorderRadius.circular(90))
                    : RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey[200], width: 2.0),
                        borderRadius: BorderRadius.circular(90)),
                child: Stack(children: <Widget>[
                  FlatButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child:
                          Icon(Icons.picture_as_pdf, color: LightColor.black),
                      onPressed: () async {
                        document = await PDFDocument.fromFile(_savePdf[index]);
                        setState(() {
                          document = document;
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return SafeArea(
                                child: Scaffold(
                              appBar: AppBar(
                                elevation: 0,
                              ),
                              body: Container(
                                  child: Center(
                                      child: _isLoading
                                          ? null
                                          : PDFViewer(
                                              tooltip: PDFViewerTooltip(),
                                              // maxScale: 9,
                                              document: document,
                                              //    scrollDirection: Axis.vertical,
                                            ))),
                            ));
                          }));
                        });
                      }),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: InkWell(
                          onTap: () {
                            setState(() async {
                              _savePdf.remove(_savePdf[index]);
                              setState(() {
                                document = document;
                              });
                            });
                          },
                          child: Icon(
                            Icons.ac_unit,
                            color: Colors.red,
                          ))),
                ])),
          ]);
        });
  }

/*  generateRoute(RouteSettings settings) {
    final path = settings.name.split('/');
    final title = path[1];

    UploadFile book = books.firstWhere((it) => it.title == title);
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => UploadFile(book,settings.name), // <-- This is your path as parameter.
    );
  } */
  Widget _form(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
            child: Form(
                autovalidate: _autovalidate,
                // key: _key,
                child: Column(children: <Widget>[
                  ListTile(
                    title: Text(
                      'تحديد متصل',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  _radioValue == 0
                      ? Row(children: [
                          Expanded(
                              child: Card(
                                  child: TextFormField(
                                      //  controller: _txtTitle,
                                      maxLength: 4,
                                      cursorColor: Colors.black54,
                                      style: TextStyle(color: Colors.black54),
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        labelStyle:
                                            TextStyle(color: Colors.black54),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black54)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        hintText: ' من صفحة',
                                      )))),
                          Expanded(
                              child: Card(
                                  child: TextFormField(
                                      //  controller: _txtTitle,
                                      maxLength: 4,
                                      cursorColor: Colors.black54,
                                      style: TextStyle(color: Colors.black54),
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        labelStyle:
                                            TextStyle(color: Colors.black54),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black54)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        hintText: 'الى صفحة',
                                      ))))
                        ])
                      : Text(""),
                  _radioValue == 1
                      ? Card(
                          child: TextFormField(
                              // controller:
                              cursorColor: Colors.black54,
                              style: TextStyle(color: Colors.black54),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.black54),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black54)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                labelText: "مثال 1.2.3.9.100",
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "الرجاء تعبية البيانات";
                                }
                                return null;
                              }))
                      : Text(""),
                ]))));
  }

/*   void _selectImage(Future<File> pickImage) async {
    File addImage = await pickImage;
    setState(() {
      return pickedImage = addImage;
    });
  }
 */
  void saveImage(path) async {
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    saveimage.setString("imagepath", path);
  }

  void loadImage() async {
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    setState(() {
      _imagepath = saveimage.getString("imagepath");
    });
  }

//
  Future<File> _cropImage(File picked) async {
    File cropped = await ImageCropper.cropImage(
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: "Modifica immagine",
        statusBarColor: Colors.green,
        toolbarColor: Colors.green,
        toolbarWidgetColor: Colors.white,
      ),
      sourcePath: picked.path,
//      aspectRatioPresets: [
//        CropAspectRatioPreset.original,
//        CropAspectRatioPreset.ratio16x9,
//        CropAspectRatioPreset.ratio4x3,
//      ],
      maxWidth: 800,
    );
    if (cropped != null) {
      setState(() {
        pickedImage = cropped;
      });
    }
    return cropped;
  }

  var idUsers;

  Future getidUsers() async {
    var idUser = FirebaseAuth.instance.currentUser;
    idUsers = idUser.uid;
    print(idUser.uid);
  }

  void _save() async {
    await getidUsers();
    var index;
    for (index = 0; index < _savePdf.length; index++) {
      final Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('RenadPDF.pdf');
      final UploadTask task = firebaseStorageRef.putFile(_savePdf[index]);
    }
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var pdf = str();
      FirebaseFirestore.instance.collection("viewPdf").doc().set({
        "userId": user.uid,
        //  "pdf": FieldValue.arrayUnion(_savePdf[index]),
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

  void str() {
    for (var index = 0; index < _savePdf.length; index++) {
      final Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('RenadPDF.pdf');
      final UploadTask task = firebaseStorageRef.putFile(_savePdf[index]);
    }
  }

//
  Widget txt({String txt, Color color = Colors.black, double size = 12}) {
    return TEXT(txt: txt, color: color, size: size);
  }
/*   void search(String value) {
    //
   if(value.isNotEmpty){
     List<dynamic> result = List<dynamic>();
     _backUp.forEach((obj) { //_backup is the complete list of objects, will not change
       if(obj.name.toLowerCase().contains(value.toLowerCase())) {
         result.add(obj);
       }
     });
     setState(() {
       _objectList = result;
     });
   }else {
     setState(() {
       _objectList = _backUp;
     });
   }
 }*/
}

const backgroundDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Colors.red, //.fromRGBO(76, 61, 243, 1),
      Colors.yellow //fromRGBO(120, 58, 183, 1),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
);
