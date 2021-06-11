import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ptint/1/tt.dart';
import 'package:ptint/Settings/HelpCenter.dart';
import 'package:ptint/Widget/users.dart';
import 'package:ptint/darkmode/pages/home_page.dart';
import 'package:ptint/login/sinin.dart';
import 'package:ptint/login/sized.dart';
import 'package:ptint/order/orderpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../themePprovider.dart';

class SettingProfile extends StatefulWidget {
  final bool tru;

  const SettingProfile({Key key, this.tru}) : super(key: key);

  @override
  _SettingProfileState createState() => _SettingProfileState();
}

class _SettingProfileState extends State<SettingProfile> {
  File imag;

  @override
  Widget build(BuildContext context) {
    //

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          sizedBox(),
          SizedBox(height: getProportionateScreenWidth(20)),
          profileMenu(
            text: "حسابي",
            icon: "assets/icon/app@60x60x1.png",
            press: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ProfileSevenPage()))
            },
          ),
          profileMenu(
            text: "طلبي",
            icon: "assets/icon/app@60x60x1.png",
            press: () => {
              Navigator.pushNamed(context, MyOrders.routeName),
            },
          ),
          profileMenu(
            text: "الوضع المظلم",
            icon: "assets/icon/app@60x60x1.png",
            press: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomePage()))
            },
          ),
          profileMenu(
            text: "التواصل مع الدعم الفني",
            icon: "assets/icon/app@60x60x1.png",
            press: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HelpCenter()));
            },
          ),
          profileMenu(
            text: " للتواصل عبر الواتس",
            icon: "assets/icon/app@60x60x1.png",
            press: () async {
              await canLaunch(whatsAppUrl)
                  ? launch(whatsAppUrl)
                  : Scaffold.of(context).showSnackBar(new SnackBar(
                      content: new Text("تحتاج إلى WhatsApp للوصول")));
            },
          ),
          profileMenu(
            text: "المزيد",
            icon: "assets/icon/app@60x60x1.png",
            press: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => MMMM()));
            },
          ),
          /*    profileMenu(
            text: "تسجيل خروج",
            icon: "assets/icon/app@60x60x1.png",
            press: () {
              FirebaseAuth.instance.signOut().then((_) {
                Route route =
                    MaterialPageRoute(builder: (context) => SignInScreen());
              }).catchError((onError) {});
            },
          ), */
        ],
      ),
    );
  }

  var whatsAppUrl = "https://wsend.co/966566677221";

  Widget profileMenu({String text, icon, VoidCallback press}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(10)),
      child: FlatButton(
        padding: EdgeInsets.all(getProportionateScreenWidth(20)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: widget.tru ? Color(0xFFF5F6F9) : Colors.grey,
        onPressed: press,
        child: Row(
          children: [
            Image.asset(
              icon,
              color: kPrimaryColor,
              width: getProportionateScreenWidth(22),
            ),
            SizedBox(width: getProportionateScreenWidth(20)),
            Expanded(child: Text(text)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }

  Widget sizedBox() {
    return SizedBox(
      height: getProportionateScreenHeight(115),
      width: getProportionateScreenWidth(115),
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          CircleAvatar(
            backgroundImage: imag != null
                ? FileImage(imag)
                : AssetImage("assets/icon/app@60x60x1.png"),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: getProportionateScreenHeight(46),
              width: getProportionateScreenWidth(46),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Colors.white),
                ),
                color: Color(0xFFF5F6F9),
                onPressed: () async {
                  final File image =
                      await ImagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    imag = image;
                  });
                },
                child: Image.asset(
                  'assets/icon/app@60x60x1.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
