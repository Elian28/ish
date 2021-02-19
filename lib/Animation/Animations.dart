/* import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Animations extends StatefulWidget {
  @override
  _AnimationsState createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations> {
  static DateTime time = DateTime.now();
  static String formattedDate = DateFormat('EEE d MMM').format(time);
  static String formattedTime = DateFormat.jm().format(time);

  Widget appBarTitle = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        formattedDate,
        style: TextStyle(fontSize: 16.0),
      ),
    
    ],
  );
  Widget appBarTitleCollapsed = Hero(
    tag: 'time',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Dhuhr',
          style: TextStyle(fontSize: 12.0),
        ),
        Text(
          formattedTime,
          style: TextStyle(fontSize: 18.0),
        ),
      ],
    ),
  );
  double appBarHeight = 200.0;

  bool lastStatus = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
                title: appBarHeight == 200 ? appBarTitle : appBarTitleCollapsed,
                pinned: true,
                expandedHeight: 200.0,
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    WidgetsBinding.instance
                        .addPostFrameCallback((_) => setState(() {
                              appBarHeight = constraints.biggest.height;
                            }));

                    return appBarHeight > 140.0
                        ? FlexibleSpaceBar(
                            centerTitle: true,
                            title: Container(
                              height: 130.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Hero(
                                    tag: 'time',
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'Dhuhr',
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                        Text(
                                          formattedTime,
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'Now',
                                    style: TextStyle(fontSize: 12.0),
                                  )
                                ],
                              ),
                            ),
                            background: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                Image.network(
                                  'https://www.girlstiktok.com/wp-content/uploads/2019/08/%D8%B5%D9%88%D8%B1-%D8%A7%D8%B7%D9%81%D8%A7%D9%84-26.jpg',
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                    Colors.greenAccent.withOpacity(.6),
                                    Colors.green[900].withOpacity(.6)
                                  ])),
                                )
                              ],
                            ),
                          )
                        : FlexibleSpaceBar(
                            title: Text(''),
                          );
                  },
                )),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    child: Text('$index'),
                  );
                },
                childCount: 200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
 */

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class Animations extends StatefulWidget {
  Animations({Key key}) : super(key: key);

  @override
  _AnimationsState createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations> {
  PageController _controller;
  var currentPageValue = 0.0;

  final List<Widget> _pages = [
    OnboardingPage(
      color: Colors.blue,
      title: "Read\nBooks\nEasy",
      text: "No matter where you go, your books are always with you.",
      image: AssetImage('assets/images/image1.png'),
    ),
    OnboardingPage(
      color: Colors.teal,
      title: "Share\nWith\nFriends",
      text:
          "Your reading list might be shared with your community and fellows.",
      image: AssetImage('assets/images/image2.png'),
    ),
    OnboardingPage(
      color: Colors.purple,
      title: "Track\nYour\nProgress",
      text:
          "Get insights into your reading preferences and analysis of time spent.",
      image: AssetImage('assets/images/image3.png'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController();

    _controller.addListener(() {
      setState(() {
        currentPageValue = _controller.page;
//        currentPageValue = 0.5;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        // BG layer
        Container(
          color: Colors.black,
        ),
        _buildCardLayer()
      ],
    );
  }

  Widget _buildCardLayer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 84,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 60),
          child: PageIndicator(
            count: _pages.length,
            current: currentPageValue.round(),
          ),
        ),
        Expanded(
          child: PageView.builder(
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, position) {
              final page = Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: _pages[position],
              );

              // From page
              if (position == currentPageValue.floor()) {
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.0015) // perspective
                    ..rotateY(-pi / 16 * (currentPageValue - position)),
                  child: page,
                );
              }
              // To page
              else if (position == currentPageValue.floor() + 1) {
                return Transform(
                  alignment: FractionalOffset.topRight,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.0015) // perspective
                    ..rotateY(-pi / 16 * (currentPageValue - position)),
                  child: page,
                );
              }
              // Other page (not in current view)
              else {
                return page;
              }
            },
          ),
        ),
        SizedBox(
          height: 60,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage(
      {Key key,
      @required this.text,
      @required this.color,
      @required this.title,
      @required this.image})
      : super(key: key);

  final String title;
  final String text;
  final Color color;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            title,
            style: TextStyles.sfProDisplayBold.copyWith(fontSize: 48),
          ),
        ),
        SizedBox(
          height: 37,
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: _buildCard()),
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }

  Widget _buildCard() {
    return Container(
      // height: 390,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(32)),
      child: ListView(
       // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              text,
              style: TextStyles.sfProTextRegular.copyWith(fontSize: 20),
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Image(
            height: 190,
            image: image,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({Key key, this.count, this.current}) : super(key: key);

  final int count;
  final int current;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(count + (count - 1), (index) {
        // Build spacer on odd indexes
        if (index % 2 == 1) {
          return SizedBox(width: 10,);
        }
        // Other build indicator items
        if (index / 2 == current) {
          return _buildActive();
        }

        return _buildIInactive();
      }),
    );
  }

  Widget _buildActive() {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(4)
      ),
    );
  }

  Widget _buildIInactive() {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(4)
      ),
    );
  }
}




class Colors {
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffffffff);
  static const Color blue = Color(0xff3F38DD);
  static const Color teal = Color(0xff4AD2E4);
  static const Color purple = Color(0xff7655CC);
}

class Fonts {
  static const String sfProDisplay = "SF Pro Display";
  static const String sfProText = "SF Pro Text";
}

class TextStyles {
  static const TextStyle sfProDisplayBold = TextStyle(
      color: Colors.white,
      fontFamily: Fonts.sfProDisplay,
      fontWeight: FontWeight.bold);
  static const TextStyle sfProTextRegular = TextStyle(
      color: Colors.white,
      fontFamily: Fonts.sfProText,
      fontWeight: FontWeight.w400);
}