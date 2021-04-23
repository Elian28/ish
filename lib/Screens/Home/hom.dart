import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:googleapis/blogger/v3.dart';
import 'package:provider/provider.dart';
import 'package:ptint/Hype/Cards/fff.dart';
import 'package:ptint/address/provider.dart';
import 'package:ptint/login/sized.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../themePprovider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const String appName = 'e-Shop';

  static SharedPreferences sharedPreferences;

  static String userCartList = 'userCart';

  List<Map<String, dynamic>> categories = [
    {
      // "icon": "assets/icons/Flash Icon.svg",
      "text": "كمبيوتر",
    },
    {
//"icon": "assets/icons/Bill Icon.svg",
      "text": "خصومات",
    },
    {
      // "icon": "assets/icons/Game Icon.svg",
      "text": "العاب",
    },
    {
      // "icon": "assets/icons/Gift Icon.svg",
      "text": "هدايه",
    },
    {
      //"icon": "assets/icons/Discover.svg",
      "text": "أكثر",
    },
  ];
/*   List<Widget> rot = [
    Comp(),
    Coppon(),
    Game(),
    Gift(),
    ViewAllPro(),
  ]; */
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        /*    bottomNavigationBar: CustomBottomNavBar(
          selectedMenu: MenuState.home,
        ), */
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenWidth(20)),
              appbar(context),
              SizedBox(height: getProportionateScreenWidth(10)),
              Container(height: 180, child: _draProducts()),
              listGame(),
              specialOfferCard(tru: themeProvider.isLightTheme),
              SizedBox(height: getProportionateScreenHeight(30)),
              //  PopularProducts(),
              SizedBox(height: getProportionateScreenHeight(30)),
              SizedBox(height: getProportionateScreenHeight(30)),
            ],
          ),
        ),
      ),
    );
  }

  appbar(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          serachWid(context),
          cartAppBar(
            //  svgSrc: "assets/icons/Cart Icon.svg",
            press: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
          ),
          /*     IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () {},
          ), */
        ],
      ),
    );
  }

  Widget cartAppBar({String svgSrc, int numOfitem, GestureTapCallback press}) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            height: getProportionateScreenHeight(46),
            width: getProportionateScreenWidth(46),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            //child: SvgPicture.asset(svgSrc),
          ),
          Positioned(
            top: -3,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              height: getProportionateScreenHeight(16),
              width: getProportionateScreenWidth(16),
              decoration: BoxDecoration(
                color: Color(0xFFFF4848),
                shape: BoxShape.circle,
                border: Border.all(width: 1.5, color: Colors.white),
              ),
              child: Center(
                child:
                    Consumer<CartItemCounter>(builder: (context, counter, _) {
                  return Text(
                    "${sharedPreferences.getStringList(userCartList).length - 1}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(10),
                      height: 1.4,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget serachWid(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onTap: () {
          // Navigator.pushNamed(context, SearchProduct.routeName);
        },
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            // contentPadding: EdgeInsets.symmetric(
            //     horizontal:0 ,
            //     vertical:0,
            // ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "البحث عن المنتج",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }

  //هنا راح اسوي السيته من الموجزدات مثل العاب وغيره

  Widget listGame() {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        /*     children: List.generate(
          categories.length,
       /*    (index) => ListGameApp(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => rot[index])),
          ), */
        ), */
      ),
    );
  }

//هاي الميثد مختصه با GameList هي راجح تاخذ ماب وتسويلي الست
  Widget listGeamMap({String icon, text, GestureTapCallback press}) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(50),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              height: getProportionateScreenHeight(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              //.asset(icon),
            ),
            SizedBox(height: getProportionateScreenWidth(5)),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }

  Widget cashback() {
    return Container(
      // height: 90,
      width: double.infinity,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      decoration: BoxDecoration(
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(
                text: "مفاجأة هذا العام\n",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  fontWeight: FontWeight.bold,
                )),
            TextSpan(
              text: "استرداد النقود 20%",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //هنا راح اضيف كل الختيارات مثل ساعات موبايل
  Widget specialOfferCard({bool tru}) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: sectonTitle(
            tru: tru,
            title: "الاكثر طلب",
            press: () {
              /*   Navigator.push(
                  context, MaterialPageRoute(builder: (_) => MoreRec())); */
            },
          ),
        ),
        Container(height: 150, child: _drawProducts()),
      ],
    );
  }

  Widget sectonTitle({String title, GestureTapCallback press, bool tru}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: tru ? Colors.black : Colors.white,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            "مشاهدة الكل",
            style: TextStyle(color: Color(0xFFBBBBBB)),
          ),
        ),
      ],
    );
  }

  Widget specOffer(
      {String category, image, int numOfBrands, GestureTapCallback press}) {
    return Padding(
      padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(210),
          height: getProportionateScreenHeight(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: " $numOfBrandsعلامه تجارية ")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawProducts() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('robot').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Center(
                child: CircularProgressIndicator(),
              );
            default:
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    print(snapshot.data.docs.first);
                    Post model =
                        Post.fromJson(snapshot.data.docs[index].data());
                    print(model.images);
                    return Container(
                        child: CarouselSlider(
                            options: CarouselOptions(
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              initialPage: 2,
                              autoPlay: true,
                            ),
                            items: model.images
                                .map((item) => Container(
                                      child: Container(
                                        margin: EdgeInsets.all(5.0),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0)),
                                            child: Stack(
                                              children: <Widget>[
                                                Image.network(
                                                    "data:image/jpeg;base64,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",
                                                    fit: BoxFit.cover,
                                                    width: 1000.0),
                                                Positioned(
                                                  bottom: 0.0,
                                                  left: 0.0,
                                                  right: 0.0,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color.fromARGB(
                                                              200, 0, 0, 0),
                                                          Color.fromARGB(
                                                              0, 0, 0, 0)
                                                        ],
                                                        begin: Alignment
                                                            .bottomCenter,
                                                        end:
                                                            Alignment.topCenter,
                                                      ),
                                                    ),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10.0,
                                                            horizontal: 20.0),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ))
                                .toList()));
                  });
          }
        });
  }

  Widget _draProducts() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('pricce').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Center(
                child: CircularProgressIndicator(),
              );
            default:
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    print(snapshot.data.docs.first);
                    Po model = Po.fromJson(snapshot.data.docs[index].data());

                    return Container(
                      // height: 90,
                      width: double.infinity,
                      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20),
                        vertical: getProportionateScreenWidth(15),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF4A3298),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(color: Colors.white),
                          children: [
                            TextSpan(
                                text: "${model.title}\n",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(18),
                                  fontWeight: FontWeight.bold,
                                )),
                            TextSpan(
                              text: "${model.title2}",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(24),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
          }
        });
  }
}

class Po {
  String title;
  String title2;
  Po({
    this.title,
    this.title2,
  });

  Po.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    title2 = json["title2"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['title2'] = this.title2;
    return data;
  }
}
