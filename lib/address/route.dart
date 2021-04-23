// We use name route
// All our routes will be available here
import 'package:flutter/widgets.dart';
import 'package:ptint/Screens/Home/hom.dart';
import 'package:ptint/login/sinin.dart';
import 'package:ptint/loginsec/secssfly.dart';
import 'package:ptint/regster/combletedprofile.dart';
import 'package:ptint/regster/regsterhome.dart';

final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => SignInScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
/*   GameList.routeName: (context) => GameList(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  DetailsScreen.routeName: (context) =>  DetailsScreen(),
   CartScreen.routeName: (context) =>  CartScreen(),
   CartScreen.routeName: (context) =>  CartScreen(),
  SearchProduct.routeName: (context) =>  SearchProduct(),
  ViewAllPro.routeName: (context) =>  ViewAllPro(),
  MyOrders.routeName: (context) =>  MyOrders(),
  SplashScreen.routeName: (context) =>  SplashScreen(),
  Gift.routeName: (context) =>  Gift(),
  Game.routeName: (context) =>  Game(),
  Coppon.routeName: (context) =>  Coppon(),
  Comp.routeName: (context) =>  Comp(),
  Fiv.routeName: (context) =>  Fiv(),
  Naessige.routeName: (context) =>  Naessige(), */
};
