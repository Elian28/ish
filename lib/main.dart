/* import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ptint/themes/AppTheme.dart';
import 'package:provider/provider.dart';

import 'Hype/Cards/fff.dart';
import 'Hype/data.dart';
import 'Introduction.dart';
import 'auth/Login..dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 

  Widget
      homeSrceen = /* HomeItem */ /* MyHomePage90 */ /* HomePage123 */ Splash2();

  User user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    homeSrceen = Login();
  }

  //runApp(NewsApp(homeSrceen));
  runApp(
      ChangeNotifierProvider(create: (_) => Cart(), child: NewsApp(homeSrceen))
      //NewsApp(homeSrceen)
      );
}

class NewsApp extends StatelessWidget {
  final Widget homesrceen;
  NewsApp(this.homesrceen);
  @override
  Widget build(BuildContext context) {
    return /* CounterProvider */ MultiProvider(
        // child: ShoppingCart(
        providers: [
/*         ChangeNotifierProvider.value(
          value: Products(),
        ), */
          ChangeNotifierProvider.value(
            value: Cart(),
          ),
/*         ChangeNotifierProvider.value(
          value: Orders(),
        ) */
          /*   ChangeNotifierProvider.value(
          value: Orders(),
        ) */
        ],
        child: MaterialApp(
            initialRoute: "",
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate
            ],
            supportedLocales: [
              Locale('ar', 'AE') // OR Locale('ar', 'AE') OR Other RTL locales
            ],
            locale: Locale(
                'ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales,
            debugShowCheckedModeBanner: false,
            home: this.homesrceen,
            routes: {
              //    DetailPage.routeName: (ctx) => DetailPage(),
              CartScreen.routeName: (ctx) => CartScreen()
            },
            theme: AppTheme.lightTheme.copyWith(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                textTheme:
                    GoogleFonts.muliTextTheme(Theme.of(context).textTheme)))
        // ),
        );
  }
}

 */
//!

import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:provider/provider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ptint/themePprovider.dart';
import 'package:ptint/tools/totelamont.dart';

import 'Screens/Home/hom.dart';
import 'address/provider.dart';
import 'address/provideraddress.dart';
import 'address/route.dart';
import 'login/sinin.dart';

//
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final appDocumentDirectory =
      await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  final settings = await Hive.openBox('settings');
  bool isLightTheme = settings.get('isLightTheme') ?? false;
  print(isLightTheme);
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeProvider(isLightTheme: isLightTheme),
    child: AppStart(),
  ));
}

// to ensure we have the themeProvider before the app starts lets make a few more changes.

class AppStart extends StatelessWidget {
  const AppStart({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return MyApp(
      themeProvider: themeProvider,
    );
  }
}

class MyApp extends StatefulWidget with WidgetsBindingObserver {
  final ThemeProvider themeProvider;
  const MyApp({Key key, @required this.themeProvider}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => TotalAmount()),
        ChangeNotifierProvider(create: (c) => AddressChanger()),
        ChangeNotifierProvider(create: (c) => CartItemCounter()),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate
        ],
        supportedLocales: [
          const Locale('ar', ''),
        ],
        debugShowCheckedModeBanner: false,
        theme: widget.themeProvider.themeData(),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  static String routeName = "/sign_in";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth user = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    displaySplash();
  }

  displaySplash() {
    Timer(Duration(seconds: 5), () async {
      if (user.currentUser != null) {
        print('ahmed');
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      } else {
        Navigator.pushReplacementNamed(context, SignInScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        /*    decoration: BoxDecoration(
            color: Color(0xffF3F3F3),
            image: DecorationImage(
              image: ExactAssetImage("assets/asset/m898.gif"),
            )), */
      ),
    );
  }
}

// Theme Data is saved on refresh or restart
// App bar color also changes with theme
