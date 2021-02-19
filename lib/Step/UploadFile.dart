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
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ptint/1/ListPrint.dart';
import 'package:ptint/1/mmm1.dart';
import 'package:ptint/themes/AppTheme.dart';
import 'package:ptint/themes/LightColor.dart';
import 'package:ptint/themes/TitleText.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as p;

class ResumeModel {
  final String name;
  final String pathOrUrl;
  const ResumeModel({this.name, this.pathOrUrl});
}

class UploadFile extends StatefulWidget {
  @override
  _UploadFileState createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
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
    loadCity();
    loadstr();
    loadNbrhood();
    nameXstr();
    //  hotelstr();
    return Container(
        height: MediaQuery.of(context).size.height / 1.7,
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: <Widget>[
          _isLoading == false
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.0),
                  child: viewPdf())
              : InkWell(
                  onTap: () {
                    uploadPhotos();
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        color: LightColor.backgroundPage,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Column(children: [
                        Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TEXT(
                                txt: "  اضافة ملف  ",
                                color: LightColor.kShrineSurfaceWhite))
                      ]))),
          _isLoading != false
              ? Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TEXT(
                      txt: "  اضافة ملف  ",
                      color: LightColor.kShrineSurfaceWhite))
              : InkWell(
                  onTap: uploadPhotos,
                  child: Container(
                      decoration: BoxDecoration(
                        color: LightColor.backgroundPage,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TEXT(
                              txt: "  اضافة ملف اخر  ",
                              color: LightColor.kShrineSurfaceWhite)))),
          buildGridView()
        ]))));
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

  Widget buildGridView1() {
    return Container(
      height: 100.0,
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemCount: _saveImg.length,
          itemBuilder: (BuildContext context, int index) {
            /* 
            images: _images.map((GallariesModel image) {
      return new NetworkImage(
       "www.imagelink.com/"+image.file));
      }).toList(),
             */
            return Row(
                children: _saveImg.map((imageModel) {
              return InkWell(
                  enableFeedback: false,
                  excludeFromSemantics: false,
                  radius: 90,
                  canRequestFocus: false,
                  autofocus: false,
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

  Widget buildGridView() {
    return SizedBox(
        height: 200.0,
        width: double.infinity,
        child: new GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 9,
              crossAxisSpacing: 0.1,
            ),
            //scrollDirection: Axis.horizontal,
            itemCount: _saveImg.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                      child: Image.file(pickedImage, width: 200, height: 200)));
            }));
  }
//

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

  String url;
  savePdfdata(List<int> asset, String name) async {
    // for (var index = 0; index < _savePdf.length; index++) {
    Reference reference = FirebaseStorage.instance.ref().child(name);

    UploadTask uploadTask = reference.putData(asset);

    url = await (await uploadTask).ref.getDownloadURL();
    listdara.add(url);
    //  }
    // documentFileUpload(url);
    //function call
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
        setState(() => _isLoading = false);

        _savePdf.add(f);
      } catch (e) {
        print("Error: message here");
      }
    }
    //-----------------
  }

  Widget viewPdf() {
    return ListView.builder(
        shrinkWrap: true,
/*         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ), */
        itemCount: _savePdf.length,
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
                txt: "الاسم :" + _savePdf[index].path.split('/').last,
                size: 10,
                align: TextAlign.center,
                fontWeight: FontWeight.w700,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Icon(Icons.visibility_rounded,
                          color: LightColor.black),
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
                  InkWell(
                      onTap: () {
                        //TODO
                        setState(() {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => builds(context)));
                        });
                      },
                      child: Icon(Icons.local_printshop_outlined)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          _savePdf.removeWhere(
                              (element) => element == _savePdf[index]);

                          //_savePdf.remove(_savePdf[index]);
                          document = document;
                        });
                      },
                      child: Icon(
                        Icons.delete_outline,
                      )),
                ],
              ),
            ]),
          );
        });
  }

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

  List listdara = [];
  void _saveData() async {
    for (var index = 0; index < listdara.length; index++) {
      listdara.add(url);
      listdara.add(_txtDescription.toString());
      listdara.add(listdata[selected_city].name);
      listdara.add(listdata[selected_city].Nbrhood[selected_Nbrhood].name);
      listdara.add(
        listdata[selected_city]
            .Nbrhood[selected_Nbrhood]
            .strt[selected_str]
            .name_x[selected_Hotel]
            .name,
      );
      listdara.add(numOfItems);
      listdara.add(selectedDate);
      listdara.add(
        selectedTime.format(context),
      );
      listdara.add(
        selected_city == 4 ? radioItemHolderColor : "",
      );
      listdara.add(
        selected_city == 5 || selected_city == 4 ? radioItemHolder : "",
      );
    }
    await getidUsers();
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      FirebaseFirestore.instance.collection("viewPdf").doc().set({
        "userId": user.uid,
        "pdf": listdara,
/*         "_txtDescription": _txtDescription != null
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
        "radioItemHolderColor": selected_city == 4 ? radioItemHolderColor : "", */
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

//
  Widget txt({String txt, Color color = Colors.black, double size = 12}) {
    return TEXT(txt: txt, color: color, size: size);
  }

//!

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

  int _radioValue1 = -1;
  String radioValue1;

  final _fromkey = GlobalKey<FormState>();

  bool _osLoading = false;

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

  Widget builds(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
              key: _fromkey,
              child: ListView(children: <Widget>[
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
                            child: TEXT(txt: 'اختر'),
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
                            hint: TEXT(txt: 'اخر'),
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
                            hint: TEXT(txt: 'اختر'),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40 / 2),
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
                                          borderRadius:
                                              BorderRadius.circular(15.0),
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
                                        borderRadius:
                                            BorderRadius.circular(15.0),
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
                                _saveData /* () {
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
        ));
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
}
