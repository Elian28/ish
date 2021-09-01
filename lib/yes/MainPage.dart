import 'package:flutter/material.dart';
import 'package:ptint/3/ViewOrder.dart';
import 'package:ptint/3/app.dart';
import 'package:ptint/yes/Page1.dart';
import 'package:ptint/themes/LightColor.dart';
import '../themes/AppTheme.dart';
import '../3/CustomBottomNavigationBar.dart';
import 'ShoppingCartPage.dart';
import 'package:gscarousel/gscarousel.dart';

// هنا صفحةة الانتقال
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isHomePageSelected = true;
  Widget offers() {
    return Column(children: [
      new Container(
        child: new SizedBox(
          height: 140.0,
          child: new GSCarousel(
            images: [
              new NetworkImage(
                  'https://www.blibli.com/page/wp-content/uploads/Ulas-Puas-Banner-utama1.jpg'),
              new NetworkImage(
                  'https://www.blibli.com/friends/assets/banner2.jpg'),
              new NetworkImage(
                  'https://www.static-src.com/siva/asset//06_2017/microsite-banner--1200x460.jpg'),
              new NetworkImage(
                  'https://www.static-src.com/siva/asset//03_2017/brandedbabytoy-toy-header.jpg'),
            ],
            indicatorSize: const Size.square(8.0),
            indicatorActiveSize: const Size(18.0, 8.0),
            indicatorColor: Colors.white,
            indicatorActiveColor: Colors.redAccent,
            animationCurve: Curves.easeIn,
            contentMode: BoxFit.cover,
            // indicatorBackgroundColor: Colors.greenAccent,
          ),
        ),
      ),
    ]);
  }

/* 
  Widget _appBar() {
    return Container(
      padding: AppTheme.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RotatedBox(
            quarterTurns: 4,
            child: InkWell(child: _icon(Icons.sort, color: Colors.black54)),
          ),
          RotatedBox(
            quarterTurns: 4,
            child: _icon(Icons.add_alert, color: Colors.black54),
          ),
        ],
      ),
    );
  }
 */

/*   Widget _icon(IconData icon, {Color color = LightColor.iconColor}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          color: Theme.of(context).backgroundColor,
          boxShadow: AppTheme.shadow),
      child: Icon(
        icon,
        color: color,
      ),
    ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)));
  }
 */
  void onBottomIconPressed(int index) {
    if (index == 0 || index == 1) {
      setState(() {
        isHomePageSelected = true;
      });
    } else {
      setState(() {
        isHomePageSelected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer1(),
        appBar: AppBar(
          backgroundColor: Color(0xfffbfbfb),
          elevation: 0,
          actions: [
            InkWell(
                /* 
                  HomePag(),
              Pri(),
              ViewOrder(),
              Models(),
              // Hom()
              //Starting()
              CategoriesScreen()
               */
                onTap: () {},
                child: IconButton(
                  icon: Icon(
                    Icons.add_alert,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ViewOrder()));
                  },
                )),
          ],
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: FloatingActionButton(
          splashColor: Colors.transparent,
          backgroundColor: LightColor.skyBlue,
          child: const Icon(Icons.comment),
          onPressed: () {},
        ),
        bottomNavigationBar: new BottomAppBar(
          color: Colors.indigo,
        ),
        body: SafeArea(
            child: Stack(fit: StackFit.loose, children: <Widget>[
          SingleChildScrollView(
              child: Container(
                  height: AppTheme.fullHeight(context) - 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xfffbfbfb),
                        Color(0xfff7f7f7),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 40),
                        //    _appBar(),
                        offers(),
                        Expanded(
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 300),
                            switchInCurve: Curves.easeInToLinear,
                            switchOutCurve: Curves.easeOutBack,
                            child: isHomePageSelected
                                ? DemandCartPage()
                                : Align(
                                    alignment: Alignment.topCenter,
                                    child: Page1(),
                                  ),
                          ),
                        )
                      ]))),
          Positioned(
              bottom: 0,
              right: 0,
              child: CustomBottomNavigationBar(
                onIconPresedCallback: onBottomIconPressed,
              ))
        ])));
  }
}

extension OnPressed on Widget {
  Widget ripple(Function onPressed,
          {BorderRadiusGeometry borderRadius =
              const BorderRadius.all(Radius.circular(5))}) =>
      Stack(
        children: <Widget>[
          this,
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                shape: RoundedRectangleBorder(borderRadius: borderRadius),
                onPressed: () {
                  if (onPressed != null) {
                    onPressed();
                  }
                },
                child: Container()),
          )
        ],
      );
}

//
