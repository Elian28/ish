import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ptint/3/HomesScreen.dart';
import 'package:ptint/task/provider2.dart';
import 'package:ptint/themes/AppTheme.dart';
import 'package:provider/provider.dart';
import 'PagPrint/arrayHome.dart';
import 'auth/Login..dart';

//lkjhgfdo
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Widget homeSrceen = /* HomeItem */ ArrayHome();

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
    return CounterProvider(
      // child: ShoppingCart(
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
        locale:
            Locale('ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales,
        debugShowCheckedModeBanner: false,

        home: this.homesrceen,
        theme: AppTheme.lightTheme.copyWith(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          textTheme: GoogleFonts.muliTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
      ),
      // ),
    );
  }
}
