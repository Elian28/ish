import 'package:flutter/material.dart';
import 'package:ptint/1/gg.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ptint/auth/Login..dart';
//import 'package:ptint/HomesScreen.dart';
import 'package:ptint/themes/AppTheme.dart';

class Routes {
  Routes() {
    runApp(new MaterialApp(
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
      home: new PageHome(),
      theme: AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.muliTextTheme(
          TextTheme(),
        ),
      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/login':
            return new MyCustomRoute(
              builder: (_) => new Login(),
              settings: settings,
            );

          case '/home':
            return new MyCustomRoute(
              builder: (_) => new PageHome(),
              settings: settings,
            );
        }
      },
    ));
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    //  if (settings.isInitialRoute) return child;
    return new FadeTransition(opacity: animation, child: child);
  }
}
