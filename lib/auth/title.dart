import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ptint/themes/AppTheme.dart';
import 'package:ptint/themes/LightColor.dart';

class TitleC extends StatefulWidget {
  @override
  _TitleCState createState() => _TitleCState();
}

class _TitleCState extends State<TitleC> {
  LocationResult _pickedLocation;
  Position _currentPosition;
  TextEditingController _txtTitle = TextEditingController();
  TextEditingController _txtIphone = TextEditingController();
  TextEditingController _txtname = TextEditingController();
  TextEditingController _txtname2 = TextEditingController();

  _initCurrentLocation() async {
    _currentPosition =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  @override
  void initState() {
    super.initState();
    _initCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text("معلومات الموقع"),
            _pickedLocation == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("اضف عنوانا الان لنتمكن من توصيل طلبك"),
                      Card(
                        color: Colors.orange[800],
                        /*  shape: RoundedRectangleBorder(
                        side: BorderSide(color: LightColor.darkgrey, width: 1.0),
                        borderRadius: BorderRadius.circular(90)), */
                        child: FlatButton(
                            onPressed: () async {
                              LocationResult result = await showLocationPicker(
                                context,
                                "AIzaSyAZNopDsKMosigbcU3ObFbEN0EX_6vcCco",
                                initialCenter: LatLng(21.391229, 39.884106),
                                automaticallyAnimateToCurrentLocation: true,
                                myLocationButtonEnabled: true,
                                layersButtonEnabled: true,
                              );
                              print("result = $result");
                              setState(() => _pickedLocation = result);
                            },
                            child: Text("اضافة عنوان جديد")),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: LightColor.darkgrey,
                                          width: 1.0),
                                      borderRadius: BorderRadius.circular(1)),
                                  child: Text(
                                      _pickedLocation.address.toString()))),
                          FlatButton(
                              onPressed: () async {
                                LocationResult result =
                                    await showLocationPicker(
                                  context,
                                  "AIzaSyAZNopDsKMosigbcU3ObFbEN0EX_6vcCco",
                                  initialCenter: LatLng(21.391229, 39.884106),
                                  automaticallyAnimateToCurrentLocation: true,
                                  myLocationButtonEnabled: true,
                                  layersButtonEnabled: true,
                                );
                                print("result = $result");
                                setState(() => _pickedLocation = result);
                              },
                              child: Text("تعديل")),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            child: Card(
                              child: TextField(
                                onChanged: (value) {
                                  //global.dtl = value;
                                },
                                controller: _txtTitle,
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
                                  hintText: 'تفاصيل عنوان اضافية',
                                  labelText: 'ماهو عنوان توصيل الشحنه؟',
                                ),
                              ),
                            ),
                          ),

                          //-------

                          Text("معلومات شخصية"),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            child: Card(
                              child: TextField(
                                onChanged: (value) {
                                  //global.dtl = value;
                                },
                                controller: _txtIphone,
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
                                  hintText: 'رقم الجوال',
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            child: Card(
                              child: TextField(
                                onChanged: (value) {
                                  //global.dtl = value;
                                },
                                controller: _txtname,
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
                                  hintText: 'الاسم الاول',
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            child: Card(
                              child: TextField(
                                onChanged: (value) {
                                  //global.dtl = value;
                                },
                                controller: _txtname2,
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
                                  hintText: 'اسم العائلة',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
            RaisedButton(child: Text("data"), onPressed: _save),
          ],
        ),
      ),
    );
  }

  Future getidUsers() async {
    var idUser = FirebaseAuth.instance.currentUser;
    idUsers = idUser.uid;
    print(idUser.uid);
  }

  String idUsers;
  void _onSignInClick() async {
/*     List toSend = List();
    for (int i = 0; i < paints.length; i++) {
      if (paints[i].selected) {
        toSend.add(paints[i].title);
      }
    }
 */
    //
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // FirebaseAuth.instance.currentUser().then((user) {
      FirebaseFirestore.instance.collection("profile").doc(user.uid).update({
        "latitude": _pickedLocation.latLng.latitude,
        "longitude": _pickedLocation.latLng.longitude,
        "userId": user.uid,
        "_txtTitle": _txtTitle.text,
        "_txtIphone": _txtIphone.text,
        "_txtname": _txtname.text,
        "_txtname2": _txtname2.text,
        "done": true,
      }).then((_) {
        /*   Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => HomesScreen1())); */
      }).catchError((error) {
        /*   setState(() {
          isLoading = true;
          errors = error.toString();
        }); */
      });
      /* }); */
    }
  }

  void _save() async {
    await getidUsers();
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      FirebaseFirestore.instance.collection("profile").doc().set({
        "latitude": _pickedLocation.latLng.latitude,
        "longitude": _pickedLocation.latLng.longitude,
        "userId": user.uid,
        "_txtTitle": _txtTitle.text,
        "_txtIphone": _txtIphone.text,
        "_txtname": _txtname.text,
        "_txtname2": _txtname2.text
      }).then((_) {
        Fluttertoast.showToast(
            msg: "تم اضافة المنتج",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: LightColor.iconColor,
            textColor: LightColor.titleTextColor,
            fontSize: AppTheme.fullHeight(context) / 35);

        //   Navigator.of(context).pop();
      });
    }
  }
}

class ViewTitle extends StatefulWidget {
  @override
  _ViewTitleState createState() => _ViewTitleState();
}

class _ViewTitleState extends State<ViewTitle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("عنوان"),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddC()));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: AppTheme.fullWidth(context) / 5,
                  ),
                  Icon(Ionicons.ios_add_circle_outline,
                      size: AppTheme.fullWidth(context) / 11),
                ],
              ),
            ),
          ],
        ),
        body: viewbook());
  }

  Widget viewbook() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('ViewTitle').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                  child: CircularProgressIndicator(
                semanticsLabel: "جاري التحميل...",
              ));
            default:
              return new GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.73),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new InkWell(
                      child: new Card(
                        elevation: 0,
                        child: Stack(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                  padding: EdgeInsets.all(9),
                                  /*    decoration: BoxDecoration(
                                      color: LightColor.titleTextColor,
                                      borderRadius: BorderRadius.circular(24)), */
                                  child: Image.network(
                                      "${snapshot.data.docs[index]["image"]}",
                                      width: AppTheme.fullWidth(context),
                                      height: AppTheme.fullHeight(context),
                                      fit: BoxFit.fill),
                                )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 9 / 4),
                                  child: Text(
                                    // products is out demo list
                                    snapshot.data.docs[index]["nameBook"],
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
                                              text: snapshot
                                                  .data.docs[index]["price"]
                                                  .toString(),
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
                            //8
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddTltle(snapshot
                                          .data
                                          .docs[index])), // اهنا نمرر البيانات
                                );
                              },
                              /*    onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      DoctorsInfo(
                                        idBook: snapshot.data.docs[index].id,
                                        authorName:
                                            snapshot.data.docs[index].data()["authorName"],
                                      )));
                            }, */
                              child: Container(
                                width: 150,
                                margin: EdgeInsets.only(right: 16),
                                padding: EdgeInsets.only(
                                    top: 16, right: 16, left: 16),
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
                  });
          }
        });
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

//--------------------------
class AddTltle extends StatefulWidget {
  final viewbook; // ************
  AddTltle(this.viewbook); // ************
  @override
  _AddTltleState createState() => _AddTltleState(viewbook);
}

class _AddTltleState extends State<AddTltle> {
  LocationResult _pickedLocation;
  Position _currentPosition;
  TextEditingController _txtTitle = TextEditingController();
  TextEditingController _txtIphone = TextEditingController();
  TextEditingController _txtname = TextEditingController();
  TextEditingController _txtname2 = TextEditingController();

  _initCurrentLocation() async {
    _currentPosition =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  @override
  void initState() {
    super.initState();
    _initCurrentLocation();
  }

  //---------------------
  var shiftbook; // ************
  bool activation = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController txtinp = TextEditingController();
  _AddTltleState(this.shiftbook); // ************
  Color _color = Colors.grey;
  bool _mycolor = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(shiftbook.data()["nameBook"]),
        ),
        body: bookDetails());
  }

  Widget mm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text("معلومات الموقع"),
              _pickedLocation == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text("اضف عنوانا الان لنتمكن من توصيل طلبك"),
                        Card(
                          color: Colors.orange[800],
                          /*  shape: RoundedRectangleBorder(
                        side: BorderSide(color: LightColor.darkgrey, width: 1.0),
                        borderRadius: BorderRadius.circular(90)), */
                          child: FlatButton(
                              onPressed: () async {
                                LocationResult result =
                                    await showLocationPicker(
                                  context,
                                  "AIzaSyAZNopDsKMosigbcU3ObFbEN0EX_6vcCco",
                                  initialCenter: LatLng(21.391229, 39.884106),
                                  automaticallyAnimateToCurrentLocation: true,
                                  myLocationButtonEnabled: true,
                                  layersButtonEnabled: true,
                                );
                                print("result = $result");
                                setState(() => _pickedLocation = result);
                              },
                              child: Text("اضافة عنوان جديد")),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: LightColor.darkgrey,
                                            width: 1.0),
                                        borderRadius: BorderRadius.circular(1)),
                                    child: Text(
                                        _pickedLocation.address.toString()))),
                            FlatButton(
                                onPressed: () async {
                                  LocationResult result =
                                      await showLocationPicker(
                                    context,
                                    "AIzaSyAZNopDsKMosigbcU3ObFbEN0EX_6vcCco",
                                    initialCenter: LatLng(21.391229, 39.884106),
                                    automaticallyAnimateToCurrentLocation: true,
                                    myLocationButtonEnabled: true,
                                    layersButtonEnabled: true,
                                  );
                                  print("result = $result");
                                  setState(() => _pickedLocation = result);
                                },
                                child: Text("تعديل")),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              child: Card(
                                child: TextField(
                                  onChanged: (value) {
                                    //global.dtl = value;
                                  },
                                  controller: _txtTitle,
                                  cursorColor: Colors.black54,
                                  style: TextStyle(color: Colors.black54),
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelStyle:
                                        TextStyle(color: Colors.black54),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black54)),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    hintText: 'تفاصيل عنوان اضافية',
                                    labelText: 'ماهو عنوان توصيل الشحنه؟',
                                  ),
                                ),
                              ),
                            ),

                            //-------

                            Text("معلومات شخصية"),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              child: Card(
                                child: TextField(
                                  onChanged: (value) {
                                    //global.dtl = value;
                                  },
                                  controller: _txtIphone,
                                  cursorColor: Colors.black54,
                                  style: TextStyle(color: Colors.black54),
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelStyle:
                                        TextStyle(color: Colors.black54),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black54)),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    hintText: 'رقم الجوال',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              child: Card(
                                child: TextField(
                                  onChanged: (value) {
                                    //global.dtl = value;
                                  },
                                  controller: _txtname,
                                  cursorColor: Colors.black54,
                                  style: TextStyle(color: Colors.black54),
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelStyle:
                                        TextStyle(color: Colors.black54),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black54)),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    hintText: 'الاسم الاول',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              child: Card(
                                child: TextField(
                                  onChanged: (value) {
                                    //global.dtl = value;
                                  },
                                  controller: _txtname2,
                                  cursorColor: Colors.black54,
                                  style: TextStyle(color: Colors.black54),
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelStyle:
                                        TextStyle(color: Colors.black54),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black54)),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    hintText: 'اسم العائلة',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
              //    RaisedButton(child: Text("data"), onPressed: _save),
            ],
          ),
        ),

/*         Container(
          color: Colors.yellow[600],
          width: 390,
          child: Table(
            border: TableBorder.all(
                style: BorderStyle.none,
                width: 0.9,
                color: Colors.black.withOpacity(0.4)),
            columnWidths: {
              0: FlexColumnWidth(19.500),
              1: FlexColumnWidth(9),
            },
            children: [
              TableRow(children: [
                TableCell(
                  child: Table(
                    border: TableBorder.all(
                        style: BorderStyle.none,
                        width: 0.9,
                        color: Colors.black.withOpacity(0.4)),
                    columnWidths: {
                      0: FlexColumnWidth(11),
                      1: FlexColumnWidth(19),
                    },
                    children: [
                      TableRow(children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("${shiftbook.data()["productName"]}"),
                                //  text(book.title,
                                // size: 16, isBold: true, padding: EdgeInsets.only(top: 16.0)),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 8.0, bottom: 16.0, right: 1),
                                  child: Text(
                                    "${shiftbook.data()["price"].toString()}",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 15),
                                    //'by ${book.writer}',
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Text(
                                        "${shiftbook.data()["quantity"].toString()}",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12),
                                        //'by ${book.writer}',
                                      ),
                                    ),

                                    // RatingBar(rating: book.rating)
                                  ],
                                ),
                                SizedBox(height: 32.0),
                                Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Colors.blue.shade200,
                                  elevation: 5.0,
                                  child: MaterialButton(
                                    onPressed: () {},
                                    minWidth: 160.0,
                                    color: Colors.blue,
                                    child: Text(
                                      'الكمية المتبقية', /* color: Colors.white, size: 13 */
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        TableCell(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 200,
                                //   width: 180,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 90, left: 30),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    child: Image.network(
                                        "${shiftbook.data()["image"].toString()}",
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        fit: BoxFit.fitHeight),
                                  ),
                                ),
                              ),
                              SizedBox(height: 32.0),
                            ],
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ]),

              //
            ],
          ),
        ),
        SizedBox(
          height: 42,
        ),
        Text("وصف المنتج"),
        Container(
          height: 220.0,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "${shiftbook.data()["description"]}",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 13.0,
                height: 1.5,
              ),
            ),
          ),
        )
     */
      ],
    );
  }

// شراء الكتاب
  Widget orderBooks() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: StreamBuilder<QuerySnapshot>(
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
              return new ListView(
                children: snapshot.data.docs.map((DocumentSnapshot document) {
                  return SizedBox(
                    child: Card(
                        //   color: Colors.white12,
                        elevation: 1,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              title: Row(
                                children: <Widget>[
                                  Text(
                                    document["price"].toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 23),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    document["price"].toString(),
                                    style: TextStyle(
                                        fontSize: 23,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            Icons.share,
                                            color: Colors.grey,
                                            size: 25,
                                          ),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.favorite,
                                            color: _color,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              if (_mycolor) {
                                                _color = Colors.grey;
                                                _mycolor = false;
                                              } else {
                                                _color = Colors.red;
                                                _mycolor = true;
                                              }
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    document["description"],
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                  );
                }).toList(),
              );
          }
        },
      ),
    );
  }

//######
  Widget bookDetails() {
    var width = AppTheme.fullHeight(context);
    var height = AppTheme.fullWidth(context);
    return Stack(
      children: [
        ListView(children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Image.network(
                            "${shiftbook.data()["image"].toString()}",
                            width: width / 2,
                            height: height / 1.3,
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                  ],
                ),
                Card(
                    //   color: Colors.white12,
                    elevation: 1,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          title: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  shiftbook.data()["nameBook"],
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 23),
                                ),
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: shiftbook.data()["price"].toString(),
                                    style: TextStyle(
                                        fontSize: 23,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w600)),
                                TextSpan(
                                  text: "RS",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                )
                              ])),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: AppTheme.fullHeight(context)),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "الوصف\n",
                                    style: TextStyle(
                                        fontSize: 23,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600)),
                                TextSpan(
                                  text: "\n" +
                                      shiftbook
                                          .data()["description"]
                                          .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                )
                              ])),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(
                                        Icons.share,
                                        color: Colors.grey,
                                        size: 25,
                                      ),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.favorite,
                                        color: _color,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (_mycolor) {
                                            _color = Colors.grey;
                                            _mycolor = false;
                                          } else {
                                            _color = Colors.red;
                                            _mycolor = true;
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    )),
                SizedBox(height: 24),
                Row(children: <Widget>[
                  Column(children: <Widget>[
                    Row(children: <Widget>[
                      Image.network(
                        "https://img.favpng.com/22/22/0/computer-icons-gmail-portable-network-graphics-email-download-png-favpng-wpF3BYjuvSNLqtVN5LCyamdJn.jpg",
                        width: 150,
                      ),
                      SizedBox(width: 20),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("تفاصيل الكتاب",
                                style: TextStyle(
                                    color: Colors.black87.withOpacity(0.7),
                                    fontSize: 20)),
                            SizedBox(height: 3),
                            /*        ListTile(
                        title: Text(
                          "اسم الكتاب :    " +
                              viewbook.data()["nameBook"] +
                              " \n" +
                              "اسم المؤلف :    " +
                              viewbook.data()["authorName"],
                        ),
                        subtitle: Text(viewbook.data()["description"] +
                            " \n" +
                            viewbook.data()["city"] +
                            "   " +
                            viewbook.data()["datePublication"] +
                            "   " +
                            viewbook.data()["university"]),
                        trailing: Text(
                          viewbook.data()["price"].toString(),
                        ),
                      ), */
                            Container(
                                width: MediaQuery.of(context).size.width - 250,
                                child: Text(
                                    " الكتاب-" +
                                        shiftbook.data()["nameBook"] +
                                        " \n" +
                                        "الفئة :" +
                                        shiftbook.data()["category"] +
                                        " \n" +
                                        "المؤلف :" +
                                        shiftbook.data()["authorName"] +
                                        " \n" +
                                        "اللغة :" +
                                        shiftbook.data()["bookLanguage"] +
                                        " \n" +
                                        " دار النشر :" +
                                        shiftbook.data()["darAlNasher"] +
                                        " \n" +
                                        // " :" +   viewbook.data()["datePublication"]+" \n",
                                        "النسخة :" +
                                        shiftbook.data()["edition"] +
                                        " \n" +
                                        "حالة الكتاب :" +
                                        shiftbook.data()["productStatus"] +
                                        " \n",

                                    //   "House # 2, Road # 5, Green Road Dhanmondi, Dhaka, Bangladesh",
                                    style: TextStyle(color: Colors.grey)))
                          ])
                    ]),
                    SizedBox(height: 20),
                    /*      Row(children: <Widget>[
                          Container(
                              width: 120,
                              child: Expanded(
                                  child: Image.network(
                                      "https://www.google.com/maps/d/thumbnail?mid=1QzkPZ1ne4kuvPFjmbI57w1E3wCU"))),
                          SizedBox(width: 20),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("معلومات البائع",
                                    style: TextStyle(
                                        color:
                                            Colors.black87.withOpacity(0.7),
                                        fontSize: 20)),
                                Container(
                                  width: MediaQuery.of(context).size.width -
                                      268,
                                  /*  child: Text(
                                                  " :" +
                                                      viewbook.data()["done"] +
                                                      " \n" +
                                                      " :" +
                                                      viewbook.data()["done"] +
                                                      " \n" +
                                                      " :" +
                                                      viewbook.data()["done"] +
                                                      " \n",
                                                  style: TextStyle(
                                                      color: Colors.grey)) */
                                )
                              ])
                        ])
                    */
                  ])
                ]),
                Text("Activity",
                    style: TextStyle(
                        color: Color(0xff242424),
                        fontSize: 28,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 22),
                Row(children: <Widget>[
                  /*         Expanded(
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 24, horizontal: 16),
                              decoration: BoxDecoration(
                                  color: Color(0xffFBB97C),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: <Widget>[
                                 /*    Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: Color(0xffFCCA9B),
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Image.network(
                                          "https://png.pngtree.com/png-vector/20190828/ourlarge/pngtree-file-clip-board-paper-board-details-icon-vector-desige-png-image_1706888.jpg",
                                          width: 20,
                                        )), */
                                    SizedBox(width: 16),
                                  /*   Container(
                                        width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2 -
                                            130,
                                        child: Text("List Of Schedule",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17))) */
                                  ]))),
                      SizedBox(width: 16),
                 */
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 24, horizontal: 16),
                          decoration: BoxDecoration(
                              color: Color(0xffA5A5A5),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Color(0xffBBBBBB),
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Image.network(
                                      "https://img.favpng.com/22/22/0/computer-icons-gmail-portable-network-graphics-email-download-png-favpng-wpF3BYjuvSNLqtVN5LCyamdJn.jpg",
                                      width: 20,
                                    )),
                                SizedBox(
                                  width: 16,
                                ),
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              // return object of type Dialog
                                              return AlertDialog(
                                                  title: new Text("رقم البائع"),
                                                  content: new Text(shiftbook
                                                      .data()["iphone"]
                                                      .toString()),
                                                  actions: <Widget>[
                                                    new FlatButton(
                                                        child:
                                                            new Text("الغاء"),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        })
                                                  ]);
                                            });
                                      });
                                    },
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                130,
                                        child: Text(
                                          "التواصل",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17),
                                        )))
                              ])))
                ])
              ]))
        ]),
      ],
    );
  }
}

class AddC extends StatefulWidget {
  @override
  _AddCState createState() => _AddCState();
}

class _AddCState extends State<AddC> {
  LocationResult _pickedLocation;
  Position _currentPosition;
  TextEditingController _txtTitle = TextEditingController();
  TextEditingController _txtIphone = TextEditingController();
  TextEditingController _txtname = TextEditingController();
  TextEditingController _txtname2 = TextEditingController();

  _initCurrentLocation() async {
    _currentPosition =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  @override
  void initState() {
    super.initState();
    _initCurrentLocation();
  }

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
    return Scaffold(
        appBar: AppBar(
          title: Text("اضافة كتاب"),
        ),
        body: mmm());
  }

  Widget _form() {
    double width = AppTheme.fullWidth(context);
    double height = AppTheme.fullHeight(context);
    SingleChildScrollView(
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
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
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
                              textCapitalization: TextCapitalization.words,
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
                          textCapitalization: TextCapitalization.words,
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
                              height: height / 10.6,
                              child: TextFormField(
                                  keyboardType: TextInputType.datetime,
                                  autocorrect: true,
                                  textCapitalization: TextCapitalization.words,
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
                              height: height / 10.6,
                              child: TextFormField(
                                  keyboardType: TextInputType.datetime,
                                  autocorrect: true,
                                  textCapitalization: TextCapitalization.words,
                                  enableSuggestions: false,
                                  maxLength: 4,
                                  controller: _txtDarAlNasher,
                                  decoration: InputDecoration(
                                    hintText: "تاريخ النشر",
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
                      ]),
                      SizedBox(height: height / 65),

                      //
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.5),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(5)),
                              width: width,
                              height: height / 10.6,
                              child: TextFormField(
                                autocorrect: true,
                                textCapitalization: TextCapitalization.words,
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
                                      color: Colors.grey.withOpacity(0.5),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  width: width,
                                  height: height / 10.6,
                                  child: TextFormField(
                                      keyboardType: TextInputType.text,
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
                                        if (val.isEmpty || val.length < 4) {
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
                                color: Colors.grey.withOpacity(0.5), width: 1),
                            borderRadius: BorderRadius.circular(5)),
                        width: width,
                        height: height / 10.6,
                        child: TextFormField(
                          autocorrect: true,
                          textCapitalization: TextCapitalization.words,
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
                          textCapitalization: TextCapitalization.words,
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
                                color: Colors.grey.withOpacity(0.5), width: 1),
                            borderRadius: BorderRadius.circular(5)),
                        width: width,
                        height: height / 10.6,
                        child: TextFormField(
                          autocorrect: true,
                          textCapitalization: TextCapitalization.words,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mmm() {
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text("معلومات الموقع"),
          _pickedLocation == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("اضف عنوانا الان لنتمكن من توصيل طلبك"),
                    Card(
                      color: Colors.orange[800],
                      /*  shape: RoundedRectangleBorder(
                        side: BorderSide(color: LightColor.darkgrey, width: 1.0),
                        borderRadius: BorderRadius.circular(90)), */
                      child: FlatButton(
                          onPressed: () async {
                            LocationResult result = await showLocationPicker(
                              context,
                              "AIzaSyAZNopDsKMosigbcU3ObFbEN0EX_6vcCco",
                              initialCenter: LatLng(21.391229, 39.884106),
                              automaticallyAnimateToCurrentLocation: true,
                              myLocationButtonEnabled: true,
                              layersButtonEnabled: true,
                            );
                            print("result = $result");
                            setState(() => _pickedLocation = result);
                          },
                          child: Text("اضافة عنوان جديد")),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: LightColor.darkgrey, width: 1.0),
                                    borderRadius: BorderRadius.circular(1)),
                                child:
                                    Text(_pickedLocation.address.toString()))),
                        FlatButton(
                            onPressed: () async {
                              LocationResult result = await showLocationPicker(
                                context,
                                "AIzaSyAZNopDsKMosigbcU3ObFbEN0EX_6vcCco",
                                initialCenter: LatLng(21.391229, 39.884106),
                                automaticallyAnimateToCurrentLocation: true,
                                myLocationButtonEnabled: true,
                                layersButtonEnabled: true,
                              );
                              print("result = $result");
                              setState(() => _pickedLocation = result);
                            },
                            child: Text("تعديل")),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          child: Card(
                            child: TextField(
                              onChanged: (value) {
                                //global.dtl = value;
                              },
                              controller: _txtTitle,
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
                                hintText: 'تفاصيل عنوان اضافية',
                                labelText: 'ماهو عنوان توصيل الشحنه؟',
                              ),
                            ),
                          ),
                        ),

                        //-------

                        Text("معلومات شخصية"),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          child: Card(
                            child: TextField(
                              onChanged: (value) {
                                //global.dtl = value;
                              },
                              controller: _txtIphone,
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
                                hintText: 'رقم الجوال',
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          child: Card(
                            child: TextField(
                              onChanged: (value) {
                                //global.dtl = value;
                              },
                              controller: _txtname,
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
                                hintText: 'الاسم الاول',
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          child: Card(
                            child: TextField(
                              onChanged: (value) {
                                //global.dtl = value;
                              },
                              controller: _txtname2,
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
                                hintText: 'اسم العائلة',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
          RaisedButton(child: Text("data"), onPressed: _save),
        ],
      ),
    );
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
