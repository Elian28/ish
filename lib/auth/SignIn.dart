/* import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
/* import 'package:geolocator/geolocator.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
 */
import '../HomesScreen.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

//
class _SignInState extends State<SignIn> {
  final _key = GlobalKey<FormState>();
  final fromkeyCountry = GlobalKey<FormState>();

  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtEmail = TextEditingController();
  TextEditingController _txtMobile = TextEditingController();
  TextEditingController _txtPassword = TextEditingController();
  TextEditingController _txtConfirmPassword = TextEditingController();
  TextEditingController _txtCity = TextEditingController();
  String _imagepath;
  File _pickedImage;

  String serviceType = "نوع الخدمة المقدمة";
  var _error;
  bool isError = false;
  bool available = false;
  //Position _currentPosition;
  bool _hidePassword = true;
  bool _hideConfirmPassword = true;
  var password;
  String dropdownValue = 'توصيل';
  var listOfPets = ["توصيل", "الاستيلام من الفرع", "كلها"];
  //ااجلها شوي

  String lisrDropdownviewCountry;
//

/*   LocationResult _pickedLocation;
  Position _currentPosition;

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
 */
  @override
  void dispose() {
    _txtName.dispose();
    _txtEmail.dispose();
    _txtMobile.dispose();
    _txtPassword.dispose();
    _txtConfirmPassword.dispose();
    _txtCity.dispose();
    super.dispose();
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: (_isLoading) ? loading() : registration());
  }

  Widget loading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget registration() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Form(
          key: _key,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                Text(
                  "انشاء المتجر ",
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(children: <Widget>[
                    Center(
                      child: InkWell(
                        onTap: () {
                          uploadPhotos();
                        },
                        child: CircleAvatar(
                          minRadius: 100,
                          child: _imagepath == null
                              ? Text('الصوره الشخصيه')
                              : null,
                          backgroundImage: _imagepath != null
                              ? FileImage(File(_imagepath))
                              : null,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    /*   RaisedButton(
                        child: Text('اختر صورة'),
                        onPressed: () {
                          _showPickOptionDialog(context);
                        }) */
                  ]),
                ),
                TextFormField(
                  controller: _txtName,
                  cursorColor: Colors.black54,
                  style: TextStyle(color: Colors.black54),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black54),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    labelText: "الاسم الكامل* ",
                    hintText: "renad",
                  ),
                  validator: (val) {
                    if (val.isEmpty) {
                      return "الرجاء تعبية البيانات";
                    } else if (val.length > 11) {
                      return 'اسم المستخدم طويل جدا';
                    }
                    return null;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 55),
                TextFormField(
                  controller: _txtCity,
                  cursorColor: Colors.black54,
                  style: TextStyle(color: Colors.black54),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black54),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    labelText: "المدينه* ",
                    hintText: "  مكة",
                  ),
                  validator: (val) {
                    if (val.isEmpty) {
                      return "الرجاء تعبية البيانات";
                    } else if (val.length > 11) {
                      return 'اسم المستخدم طويل جدا';
                    }
                    return null;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 55),
                TextFormField(
                  controller: _txtEmail,
                  cursorColor: Colors.black54,
                  style: TextStyle(color: Colors.black54),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      labelText: 'البريد الالكتروني*',
                      hintText: "renad@gmail.com"),
                  validator: (val) {
                    if (val.isEmpty) {
                      return "الرجاء تعبية البيانات";
                    }
                    Pattern pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex = new RegExp(pattern);
                    if (!regex.hasMatch(val)) {
                      return 'تنسيق البريد الإلكتروني غير صالح';
                    }
                    return null;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 55),
                TextFormField(
                  controller: _txtMobile,
                  keyboardType: TextInputType.phone,
                  cursorColor: Colors.black54,
                  style: TextStyle(color: Colors.black54),
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      labelText: "رقم الجوال",
                      hintText: "+966555555555"),
                  validator: (val) {
                    if (val.isEmpty) {
                      return "الرجاء تعبية البيانات";
                    } else if (val.length <= 9) {
                      return "يجب ان يكون رقم الهاتف من 10 ارقام";
                    }
                    return null;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 55),
                TextFormField(
                  controller: _txtPassword,
                  obscureText: _hidePassword,
                  cursorColor: Colors.black54,
                  style: TextStyle(color: Colors.black54),
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      labelText: 'كلمة السر*',
                      hintText: _hidePassword ? '**********' : 'كلمة السر',
                      suffixIcon: FlatButton(
                          onPressed: () {
                            setState(() {
                              _hidePassword = !_hidePassword;
                            });
                          },
                          child: Icon(
                              _hidePassword
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off,
                              color: _hidePassword
                                  ? Colors.black12
                                  : Colors.black54))),
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  validator: (val) {
                    if (val.isEmpty) {
                      return "الرجاء تعبية البيانات";
                    } else if (val.length < 8) {
                      return 'يجب أن تكون كلمة المرور أطول من 8 أحرف';
                    }
                    return null;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 55),
                TextFormField(
                  controller: _txtConfirmPassword,
                  obscureText: _hideConfirmPassword,
                  cursorColor: Colors.black54,
                  style: TextStyle(color: Colors.black54),
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      labelText: 'التاكد من كلمة السر*',
                      hintText: _hideConfirmPassword
                          ? '**********'
                          : 'التاكد من كلمة السر',
                      suffixIcon: FlatButton(
                          onPressed: () {
                            setState(() {
                              _hideConfirmPassword = !_hideConfirmPassword;
                            });
                          },
                          child: Icon(
                              _hideConfirmPassword
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off,
                              color: _hideConfirmPassword
                                  ? Colors.black12
                                  : Colors.black54))),
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  validator: (val) {
                    if (val.isEmpty) {
                      return "الرجاء تعبية البيانات";
                    } else if (val.length < 8) {
                      return 'يجب أن تكون كلمة المرور أطول من 8 أحرف';
                    }
                    return null;
                  },
                ),
                /*       RaisedButton(
                  onPressed: () async {
                    LocationResult result = await showLocationPicker(
                      context,
                      "AIzaSyAe5SZG35WFBD6BbRO1FDu017Tv_pn4HUY",
                      initialCenter: LatLng(31.1975844, 29.9598339),
                      automaticallyAnimateToCurrentLocation: true,
                      myLocationButtonEnabled: true,
                      layersButtonEnabled: true,
                    );
                    print("result = $result");
                    setState(() => _pickedLocation = result);
                  },
                  child: Text('Pick location'),
                ), */
                SizedBox(height: MediaQuery.of(context).size.height / 55),
                _eroorMassenger(context),
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                CupertinoButton(
                    color: Colors.cyan,
                    child: Text("التسجيل"),
                    onPressed: _onSignInClick),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSignInClick() async {
    if (!_key.currentState.validate()) {
      setState(() {
        _isLoading = false;
        available = true;
      });
    } else {
      setState(() {
        _isLoading = true;
        available = false;
      });
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _txtEmail.text, password: _txtPassword.text)
          .then((authResult) async {
        var images1 = await downloadImages(_pickedImage);
        Firestore.instance
            .collection("profile")
            .document(authResult.user.uid)
            .setData({
          "name": _txtName.text,
          'user_id': authResult.user.uid,
          'user_type': 'customer',
          'IPhone': _txtMobile.text,
          "Delivery": dropdownValue,
          'City': _txtCity.text,
          "image": images1,
        }).then((_) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => HomesScreen()));
        }).catchError((error) {
          setState(() {
            _isLoading = false;
            _error = error.toString();
          });
        });
      });
    }
  }

  Future<String> downloadImages(File image) async {
    String name = Random().nextInt(1000).toString() + "products";
    final StorageReference storageReference =
        FirebaseStorage().ref().child(name);
    final StorageUploadTask uploadTask = storageReference.putFile(image);
    StorageTaskSnapshot responseSnapshot = await uploadTask.onComplete;
    String url = await responseSnapshot.ref.getDownloadURL();
    return url;
  }

  Widget _eroorMassenger(BuildContext context) {
    if (_error == null) {
      return Container();
    }
    return Container(
      child: Text(
        _error,
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  _loadPicker(ImageSource source) async {
    File picked = await ImagePicker.pickImage(source: source);

    if (picked != null) {
      _cropImage(picked).then((File cropped) {
        saveImage(cropped.path);
      });
      //  _save.add(file);
    }
    loadImage();
    Navigator.pop(context);
  }

  //
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
        _pickedImage = cropped;
      });
    }
    return cropped;
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
                      "     camera            ",
                      style: TextStyle(color: Colors.black),
                    ),
                    Icon(
                      Ionicons.ios_images,
                      color: Colors.blue,
                    ),
                  ],
                ),
                onPressed: () {
                  _loadPicker(ImageSource.camera);
                },
              ),
              CupertinoActionSheetAction(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "     photo            ",
                      style: TextStyle(color: Colors.black),
                    ),
                    Icon(
                      Ionicons.ios_images,
                      color: Colors.blue,
                    ),
                  ],
                ),
                onPressed: () {
                  _loadPicker(ImageSource.gallery);
                },
              ),
              CupertinoActionSheetAction(
                child: Text(
                  "cancel",
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
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ptint/3/HomesScreen.dart';
import 'package:ptint/themes/LightColor.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

//
class _SignInState extends State<SignIn> {
  final _key = GlobalKey<FormState>();
  final fromkeyCountry = GlobalKey<FormState>();

  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtEmail = TextEditingController();
  TextEditingController _txtMobile = TextEditingController();
  TextEditingController _txtPassword = TextEditingController();
  TextEditingController _txtConfirmPassword = TextEditingController();
  TextEditingController _txtCity = TextEditingController();
  String _imagepath;
  // File _pickedImage;

  String serviceType = "نوع الخدمة المقدمة";
  var _error;
  bool isError = false;
  bool available = false;
  bool _hidePassword = true;
  bool _hideConfirmPassword = true;
  var password;
  String dropdownValue = 'توصيل';
  var listOfPets = ["توصيل", "الاستيلام من الفرع", "كلها"];
  //ااجلها شوي

  String lisrDropdownviewCountry;
//
  int getTotals = 0;
  List yourItemList = [];
  LocationResult _pickedLocation;
  Position _currentPosition;

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
  void dispose() {
    _txtName.dispose();
    _txtEmail.dispose();
    _txtMobile.dispose();
    _txtPassword.dispose();
    _txtConfirmPassword.dispose();
    _txtCity.dispose();
    super.dispose();
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: (_isLoading) ? loading() : registration());
  }

  Widget loading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget registration() {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(40),
            child: Form(
                key: _key,
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  Text(
                    "مستخدم جديد ",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  /*  Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: Column(children: <Widget>[
                         Center(
                      child: InkWell(
                        onTap: () {
                          uploadPhotos();
                        },
                        child: CircleAvatar(
                          minRadius: 100,
                          child: _imagepath == null
                              ? Text('الصوره الشخصيه')
                              : null,
                          backgroundImage: _imagepath != null
                              ? FileImage(File(_imagepath))
                              : null
                        )
                      )
                    ),
                        SizedBox(height: 10)
                        /*   RaisedButton(
                        child: Text('اختر صورة'),
                        onPressed: () {
                          _showPickOptionDialog(context);
                        }) */
                      ])),*/
                  TextFormField(
                      controller: _txtName,
                      cursorColor: Colors.black54,
                      style: TextStyle(color: Colors.black54),
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.black54),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        labelText: "الاسم الكامل* ",
                        hintText: "renad",
                      ),
                      validator: (val) {
                        if (val.isEmpty) {
                          return "الرجاء تعبية البيانات";
                        } else if (val.length > 11) {
                          return 'اسم المستخدم طويل جدا';
                        }
                        return null;
                      }),
                  SizedBox(height: MediaQuery.of(context).size.height / 55),
                  TextFormField(
                      controller: _txtCity,
                      cursorColor: Colors.black54,
                      style: TextStyle(color: Colors.black54),
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.black54),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        labelText: "المدينه* ",
                        hintText: "  مكة",
                      ),
                      validator: (val) {
                        if (val.isEmpty) {
                          return "الرجاء تعبية البيانات";
                        } else if (val.length > 11) {
                          return 'اسم المستخدم طويل جدا';
                        }
                        return null;
                      }),
                  Text("الرجاء اضافة موقعك"),
                  _pickedLocation == null
                      ? Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: LightColor.darkgrey, width: 1.0),
                              borderRadius: BorderRadius.circular(90)),
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
                              child: Text("حدد الموقع")),
                        )
                      : Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: LightColor.darkgrey, width: 1.0),
                              borderRadius: BorderRadius.circular(1)),
                          child: Text(_pickedLocation.address.toString())),
                  SizedBox(height: MediaQuery.of(context).size.height / 55),
                  TextFormField(
                      controller: _txtEmail,
                      cursorColor: Colors.black54,
                      style: TextStyle(color: Colors.black54),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          labelText: 'البريد الالكتروني*',
                          hintText: "renad@gmail.com"),
                      validator: (val) {
                        if (val.isEmpty) {
                          return "الرجاء تعبية البيانات";
                        }
                        Pattern pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regex = new RegExp(pattern);
                        if (!regex.hasMatch(val)) {
                          return 'تنسيق البريد الإلكتروني غير صالح';
                        }
                        return null;
                      }),
                  SizedBox(height: MediaQuery.of(context).size.height / 55),
                  TextFormField(
                      controller: _txtMobile,
                      keyboardType: TextInputType.phone,
                      cursorColor: Colors.black54,
                      style: TextStyle(color: Colors.black54),
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          labelText: "رقم الجوال",
                          hintText: "+966555555555"),
                      validator: (val) {
                        if (val.isEmpty) {
                          return "الرجاء تعبية البيانات";
                        } else if (val.length <= 9) {
                          return "يجب ان يكون رقم الهاتف من 10 ارقام";
                        }
                        return null;
                      }),
                  SizedBox(height: MediaQuery.of(context).size.height / 55),
                  TextFormField(
                      controller: _txtPassword,
                      obscureText: _hidePassword,
                      cursorColor: Colors.black54,
                      style: TextStyle(color: Colors.black54),
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          labelText: 'كلمة السر*',
                          hintText: _hidePassword ? '**********' : 'كلمة السر',
                          suffixIcon: FlatButton(
                              onPressed: () {
                                setState(() {
                                  _hidePassword = !_hidePassword;
                                });
                              },
                              child: Icon(
                                  _hidePassword
                                      ? Icons.remove_red_eye
                                      : Icons.visibility_off,
                                  color: _hidePassword
                                      ? Colors.black12
                                      : Colors.black54))),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      validator: (val) {
                        if (val.isEmpty) {
                          return "الرجاء تعبية البيانات";
                        } else if (val.length < 8) {
                          return 'يجب أن تكون كلمة المرور أطول من 8 أحرف';
                        }
                        return null;
                      }),
                  SizedBox(height: MediaQuery.of(context).size.height / 55),
                  TextFormField(
                      controller: _txtConfirmPassword,
                      obscureText: _hideConfirmPassword,
                      cursorColor: Colors.black54,
                      style: TextStyle(color: Colors.black54),
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          labelText: 'التاكد من كلمة السر*',
                          hintText: _hideConfirmPassword
                              ? '**********'
                              : 'التاكد من كلمة السر',
                          suffixIcon: FlatButton(
                              onPressed: () {
                                setState(() {
                                  _hideConfirmPassword = !_hideConfirmPassword;
                                });
                              },
                              child: Icon(
                                  _hideConfirmPassword
                                      ? Icons.remove_red_eye
                                      : Icons.visibility_off,
                                  color: _hideConfirmPassword
                                      ? Colors.black12
                                      : Colors.black54))),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      validator: (val) {
                        if (val.isEmpty) {
                          return "الرجاء تعبية البيانات";
                        } else if (val.length < 8) {
                          return 'يجب أن تكون كلمة المرور أطول من 8 أحرف';
                        }
                        return null;
                      }),

                  /*  Text(
                'Latitude: ${_pickedLocation.toString() != null ? _pickedLocation.latLng.toString() : '0'},\n'
                'Latitude: ${_pickedLocation.toString() != null ? _pickedLocation.address.toString() : '0'},\n'

                      ),*/
                  SizedBox(height: MediaQuery.of(context).size.height / 55),
                  _eroorMassenger(context),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  CupertinoButton(
                      color: Colors.cyan,
                      child: Text("التسجيل"),
                      onPressed: _onSignInClick),
                ])))));
  }

  var _instance = Firestore.instance;

  Future<bool> userExists(String username) async =>
      (await _instance
              .collection("users")
              .where("username", isEqualTo: username)
              .getDocuments())
          .documents
          .length >
      0;
  void _onSignInClick() async {
    if (!_key.currentState.validate()) {
      setState(() {
        _isLoading = false;
        available = true;
      });
    } else {
      setState(() {
        _isLoading = true;
        available = false;
      });
      final newUser = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: _txtEmail.text.trim(),
        password: _txtPassword.text.trim(),
      )
          .then((authResult) {
        FirebaseFirestore.instance
            .collection("profile")
            .doc(authResult.user.uid)
            .set({
          "name": _txtName.text,
          'user_id': authResult.user.uid,
          "Email": _txtEmail.text,
          'user_type': 'customer',
          'City': _txtCity.text,
          'IPhone': _txtMobile.text,
          "Delivery": dropdownValue,
          "latitude": _pickedLocation.latLng.latitude,
          "longitude": _pickedLocation.latLng.longitude,
          "Time": DateTime.now(),
        }).then((_) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => HomesScreen()));
        }).catchError((error) {
          setState(() {
            _isLoading = false;
            _error = error.toString();
          });
        });
      }).catchError((err) {
        if (err is PlatformException) {
          if (err.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    elevation: 0,
                    contentTextStyle: TextStyle(
                      color: Colors.grey[700],
                      //  wordSpacing: 1.0,
                      //   fontWeight: FontWeight.normal,
                      //textBaseline: TextBaseline.ideographic,
                      //decorationThickness: 90,
                      //inherit: true,
                      decorationStyle: TextDecorationStyle.dotted,
                      // height: 2,
                    ),
                    //  titlePadding: EdgeInsetsGeometry.infinity,
                    title: Center(child: Text("يرجى اعادة المحاولة")),
                    // content: Text(err.message),
                    content: Text("هذا الايميل مسجل مسبقا"),
                    actions: [
                      FlatButton(
                        child: Text("اعادة المحاولة"),
                        onPressed: () {
                          setState(() {
                            _isLoading = false;
                            available = false;
                            Navigator.of(context).pop();
                          });
                        },
                      )
                    ],
                  );
                });
          }
        }
      });
    }
  }

  void _onSignInClick1() async {
    if (!_key.currentState.validate()) {
      setState(() {
        _isLoading = false;
        available = true;
      });
    } else {
      setState(() {
        _isLoading = true;
        available = false;
      });
      // var images1 = await downloadImages(_pickedImage);

      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _txtEmail.text, password: _txtPassword.text)
          .then((authResult) {
        FirebaseFirestore.instance
            .collection("profile")
            .doc(authResult.user.uid)
            .set({
          "name": _txtName.text,
          'user_id': authResult.user.uid,
          "Email": _txtEmail.text,
          'user_type': 'customer',
          'City': _txtCity.text,
          'IPhone': _txtMobile.text,
          "Delivery": dropdownValue,
          "latitude": _pickedLocation.latLng.latitude,
          "longitude": _pickedLocation.latLng.longitude,
          "Time": DateTime.now(),
        }).then((_) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => HomesScreen()));
        }).catchError((error) {
          setState(() {
            _isLoading = false;
            _error = error.toString();
          });
        });
      });
    }
  }

  Widget _eroorMassenger(BuildContext context) {
    if (_error == null) {
      return Container();
    }
    return Container(child: Text(_error, style: TextStyle(color: Colors.red)));
  }

  //
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
                          "     camera            ",
                          style: TextStyle(color: Colors.black),
                        ),
                        Icon(Icons.image, color: Colors.blue)
                      ]),
                  onPressed: () {
                    // _loadPicker(ImageSource.camera);
                  }),
              CupertinoActionSheetAction(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("     photo            ",
                          style: TextStyle(color: Colors.black)),
                      Icon(Icons.image, color: Colors.blue)
                    ]),
                onPressed: () {
                  //    _loadPicker(ImageSource.gallery);
                },
              ),
              CupertinoActionSheetAction(
                child: Text(
                  "cancel",
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
