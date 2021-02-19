import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptint/Step/ViewPagePrint.dart';
import 'package:ptint/yes/Page1.dart';

import 'ViewOrder.dart';
import 'app.dart';

class HomesScreen extends StatefulWidget {
  @override
  _HomesScreenState createState() => _HomesScreenState();
}

class _HomesScreenState extends State<HomesScreen>
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
  }

  void _showDialog() {
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
        ],
      ),
    );
  }

/*   @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    super.dispose();
  } */

  @override
  Widget build(BuildContext context) {
    return Card /* DefaultFocusTraversal */ (
      child: SafeArea(
        child: Scaffold(
          //    appBar: AppBar(backgroundColor: Colors.grey[800],),
          bottomNavigationBar: Container(
            height: 60,
            child: TabBar(
              controller: _tabController,
              tabs: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.home,
                      size: 30,
                    ),
                    Text(" الرئيسية", style: TextStyle(fontSize: 10)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      size: 30,
                    ),
                    Text("اطبع"),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.done_outline_rounded, size: 30),
                      Text("الطلبات", style: TextStyle(fontSize: 13)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              //   HomePag(),
              Page1(),

              ViewPagePrint(),
              ViewOrder(),
              // Hom()
              //Starting()
            ],
          ),
        ),
      ),
    );
  }
}
/* 
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
import 'app.dart';
import 'yes/Page1.dart';
import 'AppDrawer.dart';
import 'ViewOrder.dart';

class HomesScreen extends StatefulWidget {
  @override
  _HomesScreenState createState() => _HomesScreenState();
}

class _HomesScreenState extends State<HomesScreen>
    with TickerProviderStateMixin {
  MotionTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = MotionTabController(initialIndex: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        endDrawer: AppDrawer1(),
        appBar: AppBar(
          title: Text("iSheet"),
        ),
        bottomNavigationBar: MotionTabBar(
          labels: ["الطلبات", "الرئيسية", " الحساب"],
          initialSelectedTab: "الرئيسية",
          tabIconColor: Colors.deepPurpleAccent,
          tabSelectedColor: Colors.deepPurpleAccent,
          onTabItemSelected: (int value) {
            print(value);
            setState(() {
              //  _tabController.index = value;
            });
          },
          icons: [Icons.account_box, Icons.home, Icons.menu],
          textStyle: TextStyle(color: Colors.deepPurpleAccent),
        ),
        body: MotionTabBarView(controller: _tabController, children: <Widget>[
          Container(
            child: Center(child: ViewOrder()),
          ),
          Container(
            child: Center(child: Page1()),
          ),
          Container(
            child: Center(child: ViewOrder()),
          )
        ]));
  }
}
 */
