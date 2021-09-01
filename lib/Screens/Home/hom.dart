import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ptint/cart/cartscreen.dart';
import 'package:ptint/game/combeotr.dart';
import 'package:ptint/game/cppon.dart';
import 'package:ptint/game/game.dart';
import 'package:ptint/game/gift.dart';
import 'package:ptint/game/morerecost.dart';
import 'package:ptint/home/toolshome/appbarnet.dart';
import 'package:ptint/home/toolshome/custombottom.dart';
import 'package:ptint/home/toolshome/listGeam.dart';
import 'package:ptint/home/toolshome/search.dart';
import 'package:ptint/login/sized.dart';
import 'package:ptint/model/post.dart';
import 'package:ptint/model/press.dart';
import 'package:ptint/scroller/scrol.dart';
import 'package:ptint/veiwallproducts/viewall.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../meu.dart';
import '../../themePprovider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const String appName = 'e-Shop';

  SharedPreferences sharedPreferences;
  User user;
  FirebaseFirestore firestore;

  String collectionUser = "users";
  String collectionOrders = "orders";
  String userCartList = 'userCart';
  String subCollectionAddress = 'userAddress';

  final String userName = 'name';
  final String userEmail = 'email';
  final String userPhotoUrl = 'photoUrl';
  final String userAvatarUrl = 'url';

  final String addressID = 'addressID';
  final String totalAmount = 'totalAmount';
  final String productID = 'productIDs';
  final String paymentDetails = 'paymentDetails';
  final String orderTime = 'orderTime';
  final String isSuccess = 'isSuccess';
  List<Map<String, dynamic>> categories = [
    {
      "icon": "https://m7et.com/wp-content/uploads/2020/04/7330-1-300x300.jpg",
      "text": "اسرع طلب",
    },
    {
      "icon": "https://m7et.com/wp-content/uploads/2020/04/7330-1-300x300.jpg",
      "text": "طباعة",
    },
    {
      "icon": "https://m7et.com/wp-content/uploads/2020/04/7330-1-300x300.jpg",
      "text": "التوصيل مجاني",
    },
    {
      "icon": "assets/icon/Untitled-3@60x60x1.png",
      "text": "مفتوح",
    },
    {
      "icon": "assets/icon/Untitled-3@60x60x1.png",
      "text": "أكثر",
    },
  ];
  List<Widget> rot = [
    Comp(),
    Coppon(),
    Game(),
    Gift(),
    ViewAllPro(),
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavBar(
          selectedMenu: MenuState.home,
        ),
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
              PopularProducts(),
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
              svgSrc: "assets/icon/app@60x60x1.png",
              press: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              }),
          IconBtnWithCounter(
            svgSrc: "assets/icon/app@60x60x1.png",
            numOfitem: 3,
            press: () {},
          ),
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
              child: Icon(Icons.shopping_cart_outlined)),
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
              /*      child: Center(
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
              ), */
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
          Navigator.pushNamed(context, SearchProduct.routeName);
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
        children: List.generate(
          categories.length,
          (index) => ListGameApp(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => rot[index])),
          ),
        ),
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
              child: Image.asset(
                'assets/icon/app@60x60x1.png',
                width: 100,
              ),
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => MoreRec()));
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
                                                Image.network(item,
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
        stream: Firestore.instance.collection('pricce').snapshots(),
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
