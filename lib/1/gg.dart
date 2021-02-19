import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:ptint/3/ViewOrder.dart';
import 'package:ptint/3/app.dart';
import 'package:ptint/themes/LightColor.dart';
import 'package:ptint/yes/Page1.dart';


class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> with TickerProviderStateMixin {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Container(
              child: Center(child: Page1()),
            ),
            Container(
              child: Center(child: ViewOrder()),
            ),
            Container(
              child: Center(child: AppDrawer1()),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              textAlign: TextAlign.center,
              activeColor: LightColor.iconColor,
              title: Text('الصفحة الرئيسية'),
              icon: Icon(Icons.home)),
          BottomNavyBarItem(
              activeColor: LightColor.iconColor,
              title: Text('الطلبات'),
              icon: Icon(Icons.apps)),
          BottomNavyBarItem(
              activeColor: LightColor.iconColor,
              title: Text('الاعدادات'),
              icon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}
