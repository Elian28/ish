import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ptint/login/sized.dart';
import 'package:ptint/sitting/profilsitting.dart';

import '../../meu.dart';
import '../../themePprovider.dart';
import '../homescreen.dart';

import 'fiver.dart';

class CustomBottomNavBar extends StatefulWidget {
  CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);
  final MenuState selectedMenu;

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(14)),
      decoration: BoxDecoration(
        color: themeProvider.isLightTheme ? Colors.white : Color(0xFF1E1F28),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: themeProvider.isLightTheme
                ? Color(0xFFDADADA).withOpacity(0.15)
                : Color(0xFF1E1F28).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.home,
                    color: MenuState.home == widget.selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,
                  ),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => HomeScreen()))),
              IconButton(
                icon: Icon(
                  Icons.star,
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Fiv.routeName);
                },
              ),
              IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: MenuState.profile == widget.selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,
                  ),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ProfileScreen()))),
            ],
          )),
    );
  }
}
