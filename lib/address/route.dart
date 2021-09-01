// We use name route
// All our routes will be available here
import 'package:flutter/widgets.dart';
import 'package:ptint/Screens/Home/hom.dart';
import 'package:ptint/cart/cartscreen.dart';
import 'package:ptint/game/combeotr.dart';
import 'package:ptint/game/cppon.dart';
import 'package:ptint/game/game.dart';
import 'package:ptint/game/gift.dart';
import 'package:ptint/home/listGema.dart';
import 'package:ptint/home/toolshome/fiver.dart';
import 'package:ptint/home/toolshome/search.dart';
import 'package:ptint/login/sinin.dart';
import 'package:ptint/loginsec/secssfly.dart';
import 'package:ptint/order/orderpage.dart';
import 'package:ptint/reddata/reid.dart';
import 'package:ptint/regster/combletedprofile.dart';
import 'package:ptint/regster/regsterhome.dart';
import 'package:ptint/sitting/profilsitting.dart';
import 'package:ptint/veiwallproducts/viewall.dart';

import '../main.dart';

final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => SignInScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  GameList.routeName: (context) => GameList(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  SearchProduct.routeName: (context) => SearchProduct(),
  ViewAllPro.routeName: (context) => ViewAllPro(),
  MyOrders.routeName: (context) => MyOrders(),
  Gift.routeName: (context) => Gift(),
  Game.routeName: (context) => Game(),
  Coppon.routeName: (context) => Coppon(),
  Comp.routeName: (context) => Comp(),
  Fiv.routeName: (context) => Fiv(),
// Naessige.routeName: (context) => Naessige(),
};
