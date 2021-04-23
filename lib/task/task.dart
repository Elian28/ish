import 'dart:io';
import 'dart:math';

import 'package:badges/badges.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:ptint/themes/LightColor.dart';
import 'package:path/path.dart' as p;
import 'package:ptint/themes/TitleText.dart';

class Item {
  final String title;
  final double price;
  bool isCheck;
  Item({this.title, this.price, this.isCheck});
}

class Cart extends ChangeNotifier {
  List<Item> _items = [];
  double _totaPrice = 0.0;

  void add(Item items) {
    _items.add(items);
    _totaPrice += items.price;
    notifyListeners();
  }

  void remove(Item items) {
    _totaPrice -= items.price;
    _items.remove(items);
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totaPrice {
    return totaPrice;
  }

  List<Item> get basketItems {
    return _items;
  }
}

class HomeItem extends StatefulWidget {
  @override
  _HomeItemState createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> {
  final List<Item> items = [
    Item(title: '1', price: 500.0, isCheck: false),
    Item(title: '2', price: 400.0, isCheck: false),
    Item(title: '3', price: 50.0, isCheck: false),
    Item(title: '4', price: 50.0, isCheck: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, child) {
      return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.blue[700],
              child: Icon(Icons.add),
              onPressed: uploadPhotos),
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    child: Badge(
                  badgeColor: LightColor.iconColor,
                  badgeContent: Text(
                    '${cart.count.toString()}',
                    style: TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => ChecKoutPage()));
                      }),
                )),
              )
            ],
          ),
          body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    /*  onTap: () {
                      if (cart.basketItems.contains(index)) {
                        cart.add(items[index]);
                      } else {
                        cart.add(items[index]);
                      }
                    },*/
                    title: Text(items[index].title),
                    subtitle: Text(items[index].price.toString()),
                    leading: Icon(Icons.add),
                    trailing: Checkbox(
                        value: items[index].isCheck,
                        onChanged: (bool value) {
                          setState(() {
                            items[index].isCheck = !items[index].isCheck;
                            if (items[index].isCheck) {
                              cart.basketItems.add(items[index]);
                            } else {
                              cart.basketItems.remove(items[index]);
                            }
                          });
                        }));
              })

          //!

          /*  return ListView.builder(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Icon(Icons.visibility_rounded,
                          color: LightColor.black),
                      onPressed: () async {
                        document = await PDFDocument.fromFile(savePdf[index]);
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
                          savePdf.removeWhere(
                              (element) => element == savePdf[index]);

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
        });*/

          );
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

  bool isLoading = true;

  File file;
  PDFDocument document;
  List savePdf = [];

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
    //-----------------
  }

  String url;
  savePdfdata(List<int> asset, String name) async {
    Reference reference = FirebaseStorage.instance.ref().child(name);

    UploadTask uploadTask = reference.putData(asset);

    url = await (await uploadTask).ref.getDownloadURL();
    // listdara.add(url);
  }

  bool isSelected = false;

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Icon(Icons.visibility_rounded,
                          color: LightColor.black),
                      onPressed: () async {
                        document = await PDFDocument.fromFile(savePdf[index]);
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
                      /*   onTap: () {
                        //TODO
                        setState(() {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => builds(context)));
                        });
                      },*/
                      child: Icon(Icons.local_printshop_outlined)),
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
                      )),
                ],
              ),
            ]),
          );
        });
  }

  //!

}

//
class ChecKoutPage extends StatefulWidget {
  @override
  _ChecKoutPageState createState() => _ChecKoutPageState();
}

class _ChecKoutPageState extends State<ChecKoutPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("السعر [\RS ${cart._totaPrice}]"),
          ),
          body: cart.basketItems.length == 0
              ? Text("no")
              : ListView.builder(
                  itemCount: cart.basketItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(cart.basketItems[index].title),
                      subtitle: Text(cart.basketItems[index].price.toString()),
                      trailing: InkWell(
                          onTap: () {
                            cart.remove(cart.basketItems[index]);
                          },
                          child: Icon(Icons.delete)),
                    );
                  },
                ),
        );
      },
    );
  }
}
