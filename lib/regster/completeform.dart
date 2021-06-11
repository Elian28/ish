import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ptint/login/erroretextfeld.dart';
import 'package:ptint/login/sized.dart';
import 'package:ptint/loginsec/secssfly.dart';
import 'package:ptint/tools/dielog/dieloglogin.dart';
import 'package:ptint/tools/dielog/errordielog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../themePprovider.dart';

class CompleteProfileForm extends StatefulWidget {
  final String email;
  final String password;

  const CompleteProfileForm({Key key, this.email, this.password})
      : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _address = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName;
  String lastName;
  String phoneNumber;
  String address;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

//!

  SharedPreferences sharedPreferences;
  User user;
  FirebaseAuth auth;
  FirebaseFirestore firestore;

  String collectionUser = "users";
  String collectionOrders = "orders";
  String userCartList = 'userCart';
  String subCollectionAddress = 'userAddress';

  String userName = 'name';
  String userEmail = 'email';
  String userPhotoUrl = 'photoUrl';
  String userUID = 'uid';
  String userAvatarUrl = 'url';

  String addressID = 'addressID';
  String totalAmount = 'totalAmount';
  String productID = 'productIDs';
  String paymentDetails = 'paymentDetails';
  String orderTime = 'orderTime';
  String isSuccess = 'isSuccess';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          sizedBox(
            text: "متابعه",
            press: () async {
              if (_formKey.currentState.validate()) {
                showDialog(
                    context: context,
                    builder: (co) {
                      return LoadingAlertDialog();
                    });
                await _registerUser();
                // Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      controller: _address,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "العنوان",
        hintText: "ادخل عنوانك",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: customSurff(svgIcon: "assets/icon/app@60x60x1.png"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: _phone,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: " رقم الهاتف",
        hintText: "ادخل رقم الهاتف",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: customSurff(svgIcon: "assets/icon/app@60x60x1.png"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: customSurff(svgIcon: "assets/icon/app@60x60x1.png"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      controller: _name,
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "الاسم",
        hintText: "ادخل الاسم و لقب",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: customSurff(svgIcon: "assets/icon/app@60x60x1.png"),
      ),
    );
  }

  customSurff({String svgIcon}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        getProportionateScreenWidth(10),
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
      ),
      child: Image.asset(
        svgIcon,
        height: getProportionateScreenWidth(18),
      ),
    );
  }

  sizedBox({String text, Function press}) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: kPrimaryColor,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _registerUser() async {
    User firebaseUser;
    await _auth
        .createUserWithEmailAndPassword(
            email: widget.email.trim(), password: widget.password.trim())
        .then((auth) {
      firebaseUser = auth.user;
      Route route =
          MaterialPageRoute(builder: (context) => LoginSuccessScreen());
      Navigator.pushReplacement(context, route);
    }).catchError((error) {
      Navigator.pop(context);
      return showDialog(
          context: context,
          builder: (c) {
            return ErrorAlertDialog(
              message: error.massage.toString(),
            );
          });
    });
    /*    if (firebaseUser != null) {
      saveUserInfoToFireStorage(firebaseUser).then((value) {
        print(sharedPreferences.getString("email"));
      
      });
    } */
  }

  Future<void> saveUserInfoToFireStorage(User fusre) async {
    FirebaseFirestore.instance.collection('users').doc(fusre.uid).set({
      'uid': fusre.uid,
      'email': fusre.email,
      'name': _name.text,
      "phone": _phone.text,
      "address": _address.text,
      userCartList: ['garbageValue'],
      "fiv": ['fiv'],
    });
    await sharedPreferences.setString('uid', fusre.uid);
    await sharedPreferences.setString('phone', _phone.text);
    await sharedPreferences.setString('address', _address.text);
    await sharedPreferences.setString(userEmail, fusre.email);
    await sharedPreferences.setString(userName, _name.text);
    await sharedPreferences.setStringList(userCartList, ['garbageValue']);
    await sharedPreferences.setStringList("fiv", ['fiv']);
  }
}
