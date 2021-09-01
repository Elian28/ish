/* /* import 'dart:async';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashState();
  }
}

class SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  startTimer() async {
    Timer(Duration(seconds: 3), nextScreen);
  }

  void nextScreen() {}
}
 */
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ptint/3/HomesScreen.dart';
import 'dart:async';

import 'package:ptint/themes/LightColor.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 3,
      vsync: this,
    );

    Timer.run(() {
      try {
        InternetAddress.lookup('google.com').then((result) {
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            print('متصل بالشبكة');
          } else {
            _showDialog(); // show dialog
          }
        }).catchError((error) {
          _showDialog(); // show dialog
        });
      } on SocketException catch (_) {
        _showDialog();
        print('غير متصل'); // show dialog
      }
    });
    Timer(
        Duration(seconds: 2),
        () => Navigator(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => HomesScreen())));
  }

  void _showDialog() {
    // dialog implementation
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("الرجاء الاتصال بالانترنت!"),
        content: Text("نعتذر منك لا يمكن عرض الصفحة بدون شبكة"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colorx.backgroundPage),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Stack(
                          children: [
                            Image.asset('assets/icon/app@60x60x1.png',
                                width: 200, fit: BoxFit.fitWidth),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 120, 20, 0),
                              child: Text(
                                "made work easy",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.grey[700]),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 0.0),
                    ),
                    /*     Text(
                      "made work easy.",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colorx.iconColor),
                    ) */
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
 */

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ptint/3/HomesScreen.dart';
import 'package:ptint/themes/LightColor.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash2 extends StatelessWidget {
  @override
  // ignore: override_on_non_overriding_member
  void initState() {
    Timer.run(() {
      try {
        InternetAddress.lookup('google.com').then((result) {
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            print('متصل بالشبكة');
          } else {
            _showDialog(); // show dialog
          }
        }).catchError((error) {
          _showDialog(); // show dialog
        });
      } on SocketException catch (_) {
        _showDialog();
        print('غير متصل'); // show dialog
      }
    });
  }

  void _showDialog({BuildContext context}) {
    // dialog implementation
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text("الرجاء الاتصال بالانترنت!"),
          content: Text("نعتذر منك لا يمكن عرض الصفحة بدون شبكة"),
          actions: [
            FlatButton(
                child: Text("اعادة المحاولة"),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        backgroundColor: LightColor.black,
        seconds: 1,
        navigateAfterSeconds: new HomesScreen(),
        title: new Text(
          'made work easy',
          textScaleFactor: 2,
        ),
        image: new Image.asset(
          'assets/icon/app@60x60x1.png',
        ),
        loadingText: Text("Loading"),
        photoSize: 100.0,
        loaderColor: Colors.blue);
  }
}

/*
Animator(
       tween: Tween<double>(
           begin: 0.0, end: MediaQuery.of(context).size.width),
       repeats: 0,
       duration: const Duration(milliseconds: 1000),
       builder: (context, animatorState, child) {
         return Stack(
           children: <Widget>[
             Container(
               decoration: BoxDecoration([]
                 color: Colors.transparent,
                 image: DecorationImage(
                   fit: BoxFit.fill,
                   image: AssetImage(
                     'assets/icon/app@60x60x1.png',
                   ),
                 ),
               ),
               height: 200.0,
             ),
             Positioned(
               // left: 0,
               left: 70 + animatorState.value,
               child: Center(
                 child: Container(
                   color: Colors.black.withOpacity(0.5),
                   width: MediaQuery.of(context).size.width,
                   height: 200.0,
                 ),
               ),
             ),
             Positioned(
               // left: 0,
               left: animatorState.value,
               child: Center(
                 child: ShaderMask(
                   shaderCallback: (rect) {
                     return LinearGradient(
                       begin: Alignment.centerRight,
                       end: Alignment.centerLeft,
                       colors: [Color(0xFF45ced5), Colors.transparent],
                     ).createShader(
                         Rect.fromLTRB(0, 0, rect.width, rect.height));
                   },
                   blendMode: BlendMode.dstIn,
                   child: Container(
                     color: Color(0xFF45ced5),
                     width: 70.0,
                     height: 200.0,
                   ),
                 ),
               ),
             ),
           ],
         );
       }),



   child: Animator(
       tween: Tween<double>(
           begin: 0.0, end: MediaQuery.of(context).size.width),
       repeats: 0,
       duration: const Duration(milliseconds: 1000),
       builder: (context, animatorState, child) {
         return Stack(
           children: <Widget>[
             Container(
               decoration: BoxDecoration(
                 color: Colors.transparent,
                 image: DecorationImage(
                   fit: BoxFit.fill,
                   image: AssetImage(
                     'assets/icon/app@60x60x1.png',
                   ),
                 ),
               ),
               height: 200.0,
             ),
             Positioned(
               // left: 0,
               left: 70 + animatorState.value,
               child: Center(
                 child: Container(
                   color: Colors.black.withOpacity(0.5),
                   width: MediaQuery.of(context).size.width,
                   height: 200.0,
                 ),
               ),
             ),
             Positioned(
               // left: 0,
               left: animatorState.value,
               child: Center(
                 child: ShaderMask(
                   shaderCallback: (rect) {
                     return LinearGradient(
                       begin: Alignment.centerRight,
                       end: Alignment.centerLeft,
                       colors: [Color(0xFF45ced5), Colors.transparent],
                     ).createShader(
                         Rect.fromLTRB(0, 0, rect.width, rect.height));
                   },
                   blendMode: BlendMode.dstIn,
                   child: Container(
                     color: Color(0xFF45ced5),
                     width: 70.0,
                     height: 200.0,
                   ),
                 ),
               ),
             ),
           ],
         );
       }),

       */
