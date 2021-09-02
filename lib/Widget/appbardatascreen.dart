import 'package:flutter/material.dart';
import 'package:ptint/Screens/Home/hom.dart';
import 'package:ptint/home/homescreen.dart';

class CustomAppBar extends PreferredSize {
  final double rating;
  CustomAppBar({@required this.rating});
  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  color: Colors.white,
                  padding: EdgeInsets.zero,
                  onPressed: () =>
                      Navigator.pushNamed(context, HomeScreen.routeName),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ) /*  Image.asset(
                  'assets/icon/app@60x60x1.png',
                  height: 15,
                ), */
                  ),
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Text(
                    "$rating",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Image.asset(
                    'assets/icon/app@60x60x1.png',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
