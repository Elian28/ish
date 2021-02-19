import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ptint/themes/AppTheme.dart';

import 'auth/Login..dart';
import 'task/task.dart';

//lkjhgfd
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Widget homeSrceen = Tasks();

  User user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    homeSrceen = Login();
  }

  runApp(NewsApp(homeSrceen));
}

class NewsApp extends StatelessWidget {
  final Widget homesrceen;
  NewsApp(this.homesrceen);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      locale: Locale('ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales,
      debugShowCheckedModeBanner: false,

      home: this.homesrceen,
      theme: AppTheme.lightTheme.copyWith(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        textTheme: GoogleFonts.muliTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
