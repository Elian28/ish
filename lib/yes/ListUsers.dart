import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ptint/1/mn.dart';
import 'package:ptint/2/AddRequest.dart';
import 'package:ptint/2/jj.dart';
import 'package:ptint/Server/help.dart';
import 'package:ptint/task/task.dart';
import 'package:ptint/themes/AppTheme.dart';
import 'package:ptint/themes/LightColor.dart';
import 'package:ptint/themes/TitleText.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';

class ListUsers extends StatefulWidget {
  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers>
    with SingleTickerProviderStateMixin {
  User _user;
  bool _hasEroor = false;
  bool _isLoading = true;
  bool isAdmin = true;
  String _eroorMassege;
  String name;
  String userType;
  bool doOffers = false;

  Position _currentPosition;

//!

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<int> _counter;

  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 0) + 1;

    setState(() {
      _counter = prefs.setInt("counter", counter).then((bool success) {
        return counter;
      });
    });
  }

//!
  //Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  double cDis;
  Future<double> getdis(double eLatitude, double eLongitude) async {
    //double eLatitude = 80.254320;
    //double eLongitude = -100.654320;
    double distanceInMeters =
        distanceBetween(52.2165157, 6.9437819, 52.3546274, 4.8285838);

    /*  Geolocator()
        .distanceBetween(_currentPosition.latitude,
         _currentPosition.longitude,
            eLatitude, eLongitude)
        .then((r) {
      // setState(() {
     return cDis = r / 1000;
      //   });
    });*/
  }

  _initCurrentLocation() async {
    _currentPosition =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

/*
    GeolocationStatus geolocationStatus =
        await Geolocator().checkGeolocationPermissionStatus();
    Geolocator()
      ..forceAndroidLocationManager = !false
      ..getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      ).then((position) {
        if (mounted) {
          setState(() => _currentPosition = position);
        }
      }).catchError((e) {
        //
      });
      */
  }

  ExpandableView expandableView = new ExpandableView();

  @override
  void initState() {
    super.initState();

    _counter = _prefs.then((SharedPreferences prefs) {
      return (prefs.getInt('counter') ?? 0);
    });
    _initCurrentLocation();
    //  _initCurrentLocation();

//    FirebaseAuth.instance.currentUser().then((user) {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      FirebaseFirestore.instance
          .collection("profile")
          .where('user_id', isEqualTo: user.uid)
          .get()
          .then((snapshotQuery) {
        setState(() {
          name = snapshotQuery.docs[0]['name'];
          userType = snapshotQuery.docs[0]['user_type'];

          if (snapshotQuery.docs[0]['user_type'] == 'admin') {
            isAdmin = true;
          }
          _user = user;
          _hasEroor = false;
          _isLoading = false;
        });
        return user;
      }).catchError((error) {
        setState(() {
          _hasEroor = true;
          _eroorMassege = error.toString();
        });
        return null;
      });
    } else {
      // No User signed In.
    }

/*     FirebaseAuth.instance.currentUser().then((user) {
      FirebaseFirestore.instance
          .collection("profile")
          .where('user_id', isEqualTo: user.uid)
          .get()
          .then((snapshotQuery) {
        setState(() {
          name = snapshotQuery.docs[0]['name'];
          userType = snapshotQuery.docs[0]['user_type'];
          if (snapshotQuery.docs[0]['user_type'] == 'admin') {
            isAdmin = true;
          }
          _user = user;
          _hasEroor = false;
          _isLoading = false;
        });
        return user;
      });
    }).catchError((error) {
      setState(() {
        _hasEroor = true;
        _eroorMassege = error.toString();
      });
      return null;
    }); */
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[50],
          elevation: 0,
          title: Text('قرطاسيات'),
        ),
        body: _isLoading
            ? _loading(context)
            : (_hasEroor ? _eroor(context, _eroorMassege) : _conTent(context)));
  }

  Widget _loading(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }

// orderBy معناها الترتيب حسب
//descending معناه تنازلي
  Widget _conTent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(collections['Contents'])
              .where("user_id", isEqualTo: _user.uid)
              //.orderBy("done", descending: false)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return _eroor(context, "لم يحدث شى");
                break;
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return _eroor(context, snapshot.error.toString());
                }
                if (!snapshot.hasData) {
                  return _eroor(context, "لايوجد بيانات");
                }
                return _form(context, snapshot.data);
                break;
            }
            return Container();
          }),
    );
  }

  Widget _eroor(BuildContext context, String masseg) {
    return Center(
        child: Text(
      masseg,
      style: TextStyle(color: Colors.red, fontSize: 15),
    ));
  }

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
                      if (_currentPosition != null) {
                        getdis(snapshot.data.docs[index]["latitude"],
                            snapshot.data.docs[index]['longitude']);
                      }
                      return Card(
                        child: Column(
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        AddRequest /* News */ ()));
                                // ViewHom(snapshot.data.documents[index])));
                              },
                              child: ListTile(
                                  leading: Container(
                                    color: Colors.black,
                                    width: 50,
                                    height: 50,
                                  ),
                                  trailing: Column(children: [
                                    TEXT(
                                      size: 9,
                                      txt: ((Geolocator.distanceBetween(
                                                      snapshot.data.docs[index]
                                                          ["latitude"],
                                                      snapshot.data.docs[index]
                                                          ['longitude'],
                                                      _currentPosition.latitude,
                                                      _currentPosition
                                                          .longitude)) /
                                                  1000)
                                              .floorToDouble()
                                              . /*.sign.*/ toString() +
                                          " كم",
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: LightColor.iconColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: TEXT(
                                        size: 9,
                                        txt: "    " +
                                            "${snapshot.data.docs[index]["Delivery"]}" +
                                            "    ".toString(),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ]),
                                  title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(children: <Widget>[]),
                                        TEXT(
                                          txt:
                                              "${snapshot.data.docs[index]["name"]}"
                                                  .toString(),
                                        ),
                                        TEXT(
                                          txt: "خلال 24 ساعة ",
                                        ),
                                        TEXT(
                                          txt: "مكة المكرمة , حي الرصيفة ",
                                        ),
                                        /*   Center(
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10),
                                                  ))),
                                        ), */
                                        /*          Text(
                'Latitude: ${snapshot.data.docs[index]["latitude"] != null ?snapshot.data.docs[index]["latitude"].toString() : '0'},\n'
                    ' Longitude: ${snapshot.data.docs[index]["longitude"] != null ? snapshot.data.docs[index]["longitude"].toString() : '0'}'
                   // ' Longitude: ${_currentPosition != null ? _currentPosition.longitude.toString() : '0'}'
            )*/
                                      ])),
                            ),
                            Container(
                              width: double.infinity,
                              child: Card(
                                color: Colors.grey[700].withAlpha(9),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text("ساعات العمل"),
                                            content: Text("من الساعة ٢ الا ١٠" +
                                                "\n" +
                                                "من الساعة ٢ الا ١٠" +
                                                "\n" +
                                                "من الساعة ٢ الا ١٠" +
                                                "\n" +
                                                "من الساعة ٢ الا ١٠" +
                                                "\n" +
                                                "من الساعة ٢ الا ١٠" +
                                                "\n" +
                                                "من الساعة ٢ الا ١٠" +
                                                "\n" +
                                                "من الساعة ٢ الا ١٠" +
                                                "\n" +
                                                "من الساعة ٢ الا ١٠" +
                                                "\n" +
                                                "من الساعة ٢ الا ١٠" +
                                                "\n" +
                                                "من الساعة ٢ الا ١٠" +
                                                "\n" +
                                                "من الساعة ٢ الا ١٠"),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Text(
                                            'ساعات العمل',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10),
                                          ),
                                          Icon(Icons.timer_sharp),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _incrementCounter();
                                      },
                                      child: Column(
                                        children: [
                                          Center(
                                              child: FutureBuilder<int>(
                                                  future: _counter,
                                                  builder:
                                                      (BuildContext context,
                                                          AsyncSnapshot<int>
                                                              snapshot) {
                                                    switch (snapshot
                                                        .connectionState) {
                                                      case ConnectionState
                                                          .waiting:
                                                        return const CircularProgressIndicator();
                                                      default:
                                                        if (snapshot.hasError) {
                                                          return TEXT(
                                                              txt:
                                                                  'Error: ${snapshot.error}');
                                                        } else {
                                                          return TEXT(
                                                              color:
                                                                  Colors.white,
                                                              txt:
                                                                  ' ${snapshot.data}${snapshot.data == 1 ? '' : ''}');
                                                        }
                                                    }
                                                  })),
                                          Icon(Icons.star),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'العنوان',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10),
                                        ),
                                        Icon(Icons.location_on_rounded),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ]);
          }
        });
  }
}

/* 
customer (customerLat,customerLon)

 Dealer٠١ (Dealer٠١Lat,Dealer٠١Lon)

 
geolocator
final ElleDistance = GeolocatorPlatform.distanceBetween(21.485711, 39.793571,21.946907, 39.794470);
final alsharidDistance = GeolocatorPlatform.distanceBetween(21.485711, 39.793571,21.946907, 39.794470);
 */

/* 
1- 
2-
 */

/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ptint/Server/help.dart';
import 'package:ptint/themes/AppTheme.dart';
import 'package:ptint/themes/LightColor.dart';
import 'package:ptint/themes/TitleText.dart';

import '../_New.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class ListUsers extends StatefulWidget {
  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  User _user;
  bool _hasEroor = false;
  bool _isLoading = true;
  bool isAdmin = true;
  String _eroorMassege;
  String name;
  double latitude;
  double longitude;
  String userType;
  bool doOffers = false;

  Position _currentPosition;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  double cDis = 0;
    void getdis(double eLatitude, double eLongitude) async {
    eLatitude = 4.8285838;
    eLongitude = -52.3546274;

    double distanceInMeters =await Geolocator().distanceBetween(52.2165157, 6.9437819, eLatitude, eLongitude);
    print(distanceInMeters.toString());
 /*   await Geolocator()
        .distanceBetween(_currentPosition.latitude, _currentPosition.longitude,
            eLatitude, eLongitude)
        .then((r) {
      cDis = r / 1000;

      print(r.toString());
    });*/
  }
  /*
  double distanceInMeters = distanceBetween(52.2165157, 6.9437819, 52.3546274, 4.8285838);
   */

/*  void getdis(double eLatitude, double eLongitude) async {
 try {
       await Geolocator()
        .distanceBetween(eLatitude,eLongitude,
            latitude, longitude)
        .then((r) {
          if (cDis != null)  cDis = r / 1000;

          else{
            cDis = 0;
          }
    });
 } catch (e) {
   print(e.toString());
 }

  }*/

  _initCurrentLocation() async {
    GeolocationStatus geolocationStatus =
        await Geolocator().checkGeolocationPermissionStatus();
    Geolocator()
      ..forceAndroidLocationManager = !false
      ..getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      ).then((position) {
        if (mounted) {
          setState(() => _currentPosition = position);
        }
      }).catchError((e) {
        //
      });
  }

  @override
  void initState() {
    super.initState();
    _initCurrentLocation();
    
    //  _initCurrentLocation();

//    FirebaseAuth.instance.currentUser().then((user) {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      FirebaseFirestore.instance
          .collection("profile")
          .where('user_id', isEqualTo: user.uid)
          .get()
          .then((snapshotQuery) {
        setState(() {
          name = snapshotQuery.docs[0]['name'];
          userType = snapshotQuery.docs[0]['user_type'];
           latitude  =  snapshotQuery.docs[0]['latitude'];
     longitude   =   snapshotQuery.docs[0]['longitude'];
          if (snapshotQuery.docs[0]['user_type'] == 'admin') {
            isAdmin = true;
          }
          _user = user;
          _hasEroor = false;
          _isLoading = false;
        });
        return user;
      }).catchError((error) {
        setState(() {
          _hasEroor = true;
          _eroorMassege = error.toString();
        });
        return null;
      });
    } else {
      // No User signed In.
    }

    return null;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isLoading
            ? _loading(context)
            : (_hasEroor ? _eroor(context, _eroorMassege) : _conTent(context)));
  }

  Widget _loading(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }

// orderBy معناها الترتيب حسب
//descending معناه تنازلي
  Widget _conTent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(collections['Contents'])
              .where("user_id", isEqualTo: _user.uid)
              //.orderBy("done", descending: false)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return _eroor(context, "لم يحدث شى");
                break;
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return _eroor(context, snapshot.error.toString());
                }
                if (!snapshot.hasData) {
                  return _eroor(context, "لايوجد بيانات");
                }
                return _form(context, snapshot.data);
                break;
            }
            return Container();
          }),
    );
  }

  Widget _eroor(BuildContext context, String masseg) {
    return Center(
        child: Text(
      masseg,
      style: TextStyle(color: Colors.red, fontSize: 15),
    ));
  }

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
                      if (_currentPosition != null) {
                        getdis(snapshot.data.docs[index]['latitude'],
                            snapshot.data.docs[index]['longitude']);
                      }
                      return Card(
                          child: ListTile(
                              trailing: Column(children: [
                               
                               TEXT(
                                      txt: cDis.ceilToDouble().toString() + " كم",
                                    ),
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
                                              "${snapshot.data.docs[index]["latitude"]}"
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
                                        borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            '50% (خصم)',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10),
                                          ))),
                                     ),
                            Text(
                'Latitude: ${snapshot.data.docs[index]["latitude"] != null ?snapshot.data.docs[index]["latitude"].toString() : '0'},\n'
                    ' Longitude: ${snapshot.data.docs[index]["longitude"] != null ? snapshot.data.docs[index]["longitude"].toString() : '0'}'
                   // ' Longitude: ${_currentPosition != null ? _currentPosition.longitude.toString() : '0'}'
            )
          
                                  ])));
                    }),
              ]);
          }
        });
  }


}


 */
