import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ptint/1/mmm1.dart';
import 'package:ptint/themes/AppTheme.dart';
import 'package:ptint/themes/LightColor.dart';
import 'package:ptint/themes/TitleText.dart';
import 'package:path/path.dart' as p;
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class Balloons extends StatefulWidget {
  @override
  _BalloonsState createState() => _BalloonsState();
}

class _BalloonsState extends State<Balloons> {
  bool isSelected = false;
  List savePdf = [];

  bool isLoading = true;
  bool activation = true;

  PDFDocument document;

//!
  String radioItemHolder = 'اسود';

  // Group Value for Radio Button.
  int id = 1;
  int idColor = 1;
  int numOfItems = 1;

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

  List<NumberList> nList = [
    NumberList(
      index: 1,
      number: "أسود",
    ),
    NumberList(
      index: 2,
      number: "برتقالي",
    ),
    NumberList(
      index: 3,
      number: "بنفسجي",
    ),
    NumberList(
      index: 4,
      number: "أزرق سماوي",
    ),
    NumberList(
      index: 5,
      number: "أحمر",
    ),
    NumberList(
      index: 6,
      number: "أخضر",
    ),
    NumberList(
      index: 7,
      number: "أزرق",
    ),
    NumberList(
      index: 8,
      number: "ابيض",
    ),
  ];

  Future<String> download(String url, String filename) async {
    String dir = (await getTemporaryDirectory()).path;
    File file = File('$dir/$filename');
    if (await file.exists()) return file.path;
    await file.create(recursive: true);
    var response = await http.get(url).timeout(Duration(seconds: 60));

    if (response.statusCode == 200) {
      await file.writeAsBytes(response.bodyBytes);
      return file.path;
    }
    throw 'Download ${url} failed';
  }

  void downloadAndLaunch({String url, String filename}) {
    download(url, filename).then((String path) {
      OpenFile.open(path);
    });
  }

  @override
  Widget build(BuildContext context) {
    var _fullHeight = AppTheme.fullHeight(context);

    return Container(
        height: MediaQuery.of(context).size.height / 1.4,
        child: Scaffold(
            body: Column(children: <Widget>[
          Text(
            "لون المنتج",
            style: TextStyle(
                fontSize: _fullHeight / 60,
                color: LightColor.subTitleTextColor,
                fontWeight: FontWeight.w900),
          ),
          Container(
              height: AppTheme.fullHeight(context) / 2.3,
              child: Column(
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
                              })))
                      .toList())),

          Text(
            "اضافة ملف التصميم\n (ِAi-Psd-Eps-Cdr-Pdf)",
            style: TextStyle(
                fontSize: _fullHeight / 60,
                color: LightColor.subTitleTextColor,
                fontWeight: FontWeight.w900),
          ),
          isLoading == false
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.0),
                  child: viewPdf())
              : InkWell(
                  onTap: () {
                    uploadPhotos();
                  },
                  child: Icon(
                    Icons.cloud_download,
                    size: 50,
                  )),
          //
          Center(
              child: Text(
            "*عدد الطباعة",
            style: TextStyle(
                fontSize: _fullHeight / 60,
                color: LightColor.subTitleTextColor,
                fontWeight: FontWeight.w900),
          )),

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
          RaisedButton(
            child: Text("ارسال للسلة"),
            onPressed: () {},
          )
        ])));
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
                          Text("     رفع الملفات            ",
                              style: TextStyle(
                                color: LightColor.iconColor,
                              )),
                          Icon(
                            Ionicons.ios_images,
                            color: LightColor.iconColor,
                          )
                        ]),
                    onPressed: () {
                      loadDocument();
                    }),
                CupertinoActionSheetAction(
                    child: Text(
                      "cancel",
                      style: TextStyle(
                        color: LightColor.subTitleTextColor,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ]);
        });
  }

  String url;
  savePdfdata(List<int> asset, String name) async {
    Reference reference = FirebaseStorage.instance.ref().child(name);

    UploadTask uploadTask = reference.putData(asset);

    url = await (await uploadTask).ref.getDownloadURL();
    listdara.add(url);
  }

  File file;
  loadDocument() async {
    //-------------
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    file = File(result.files.single.path);

    if (result != null) {
      try {
        Random random = new Random();
        String randomNumber = random.nextInt(10000).toString();
        String dir = p.dirname(file.path);
        String fileName = '$randomNumber.pdf';
        String newPath = p.join(dir, fileName);

        File f = file.renameSync(newPath);
        savePdfdata(f.readAsBytesSync(), fileName);
        document = await PDFDocument.fromFile(f);
        setState(() => isLoading = false);

        savePdf.add(f);
      } catch (e) {
        print("Error: message here");
      }
    }
    downloadAndLaunch(url: result.files.single.path, filename: 'pdf.pdf');
    //----------------url: result.files.single.path, filename: ''
  }

  Widget viewPdf() {
    return ListView.builder(
        shrinkWrap: true,
/*         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ), */
        itemCount: savePdf.length,
        itemBuilder: (context, index) {
          return Card(
            shape: isSelected
                ? RoundedRectangleBorder(
                    side: BorderSide(color: Colors.indigoAccent, width: 2.0),
                    borderRadius: BorderRadius.circular(90))
                : RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey[200], width: 2.0),
                    borderRadius: BorderRadius.circular(10)),
            child: Column(children: [
              TEXT(
                txt: "الاسم :" + savePdf[index].path.split('/').last,
                size: 10,
                align: TextAlign.center,
                fontWeight: FontWeight.w700,
              ),
              TEXT(
                txt: document.count.toString(),
                size: 10,
                align: TextAlign.center,
                fontWeight: FontWeight.w700,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                FlatButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child:
                        Icon(Icons.visibility_rounded, color: LightColor.black),
                    onPressed: () async {
                      document = await PDFDocument.fromFile(savePdf[index]);
                      setState(() {
                        document = document;
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return SafeArea(
                              child: Scaffold(
                            appBar: AppBar(
                              elevation: 0,
                            ),
                            body: Container(
                                child: Center(
                                    child: isLoading
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
                InkWell(
                    onTap: () {
                      setState(() {
                        savePdf.removeWhere(
                            (element) => element == savePdf[index]);

                        //_savePdf.remove(_savePdf[index]);
                        document = document;
                      });
                    },
                    child: Icon(
                      Icons.delete_outline,
                    ))
              ])
            ]),
          );
        });
  }

  var idUsers;

  Future getidUsers() async {
    var idUser = FirebaseAuth.instance.currentUser;
    idUsers = idUser.uid;
    print(idUser.uid);
  }

  List listdara = [];
  void _saveData() async {
    await getidUsers();
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      FirebaseFirestore.instance.collection("viewPdf").doc().set({
        "userId": user.uid,
        "pdf": listdara,
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

//!

}
