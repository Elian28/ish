import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ptint/3/EducationalService.dart';

import 'package:ptint/3/app.dart';
import 'package:ptint/Books2/Bookas.dart';

import 'package:ptint/yes/ListUsers.dart';
import 'package:ptint/3/AppData.dart';
import 'package:ptint/themes/AppTheme.dart';
import 'package:ptint/themes/LightColor.dart';
import 'package:ptint/themes/TitleText.dart';

class Page1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<Page1> {
  int _radioValue2 = -1;
  var radioValue;
  var radioValue1;
  var radioValue2;
  final List<String> img = [
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      right: false,
      top: false,
      maintainBottomViewPadding: false,
      left: false,
      bottom: false,
      child: Scaffold(
          endDrawer: AppDrawer1(),
          appBar: AppBar(
            backgroundColor: LightColor.backgroundPage,
            elevation: 0,
            title: Image.asset(
              'assets/icon/app@60x60x1.png',
              width: 100,
            ),
          ),
          /* appBar: AppBar(
            title: _search(),
          ), */
          body: ListView(
            children: [
              Column(
                children: [
/*             Container(
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 9,
                  children: WRAP_DATA
                      .map((catData) => ViewItemsModel(
                            title: catData.title,
                            color: catData.color,
                          ))
                      .toList(),
                ),
              ),
 */
//
                  // _form(),
                  //   _divider,
                  // _search(),
                  //  _productWidget(),
                ],
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    /*   TEXT(
                txt: "الخدمات",
                color: LightColor.skyBlue,
              ), */
                    _search(),
                    Container(
                      height: MediaQuery.of(context).size.height / 19,
                    ),
                    Container(
                      width: 400,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
/*                       Expanded(
                            child: iconPage("\n  \nطباعة\n", ViewPagePrint())), */
                            iconPage(
                              "\nكتب \nمستعملة\n",
                              Booksa(),
                            ),
                            iconPage(
                                "\nخدمة\nالتعليمية\n", EducationalService())
                          ]),
                    ),
                    //AppTheme.divider,
                    //  _deliveryMethod()
                  ]),

              // TEXT(txt: "المواقع المتاحة", color: Colors.black),
              // _categoryWidget(),
              List1(),
              // _deliveryMethod(),
              Container(height: 400, child: ListUsers())
            ],
          )),
    );
  }

  Widget _deliveryMethod() {
    var _mediaQuery = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: _mediaQuery.height / 45,
        ),
        TEXT(
          txt: "طريقة التسليم",
          color: LightColor.iconColor,
        ),
        TEXT(
          txt: "يرجي اختيار  كيفية التي تفضل استيلام طلبك بها",
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio(
                activeColor: LightColor.iconColor,
                value: 0,
                groupValue: _radioValue2,
                onChanged: _voidradioValue2),
            TEXT(
                txt: 'توصيل',
                size: _mediaQuery.height / 50,
                color: Colors.black),
            Radio(
                activeColor: LightColor.iconColor,
                value: 1,
                groupValue: _radioValue2,
                onChanged: _voidradioValue2),
            TEXT(
              txt: 'استيلام من المتجر',
              size: _mediaQuery.height / 50,
            ),
          ],
        ),
      ],
    );
  }

  void _voidradioValue2(value) {
    setState(() {
      _radioValue2 = value;
      switch (_radioValue2) {
        case 0:
          {
            radioValue2 = "توصيل";
            print("radioValue2 is $radioValue2");
          }
          break;
        case 1:
          {
            radioValue2 = "استيلام من المتجر";
            print("radioValue2 is $radioValue2");
          }
          break;
      }
    });
  }

  void _showPopupMenu() async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(9, 100, 100, 100),
      items: [
        PopupMenuItem<String>(child: const Text('الاقرب'), value: '1'),
        PopupMenuItem<String>(child: const Text('الاكثر تقيما'), value: '2'),
        PopupMenuItem<String>(child: const Text('عروض'), value: '3'),
        PopupMenuItem<String>(child: const Text('توصيل'), value: '4'),
        PopupMenuItem<String>(
            child: const Text('استيلام من المتجر'), value: '5'),
      ],
      elevation: 8.0,
    );
  }

  Widget _icon(IconData icon, {Color color = LightColor.iconColor}) {
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
    ); /* .ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13))); */
  }

  Widget _categoryWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: AppData.categoryList
            .map((category) => ProductIcon(
                model: category,
                onSelected: (model) {
                  setState(() {
                    AppData.categoryList.forEach((item) {
                      item.isSelected = false;
                    });
                    model.isSelected = true;
                  });
                }))
            .toList(),
      ),
    );

/*      return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: img.length,
        crossAxisSpacing: 5,
        childAspectRatio: 3 / 2,
      ),
      itemCount: img.length,
      itemBuilder: (BuildContext context, int index) {
        return Stack(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      img[index],
                    ),
                    fit: BoxFit.cover)),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            TEXT(
              txt: _txt[index],
              color: LightColor.yellowColor,
              fontWeight: FontWeight.bold,
            )
          ])
        ]);
      }); */
  }

  Widget Image1(dynamic image) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(image),
      )),
    );
  }

  Widget List1() {
    Color color = Colors.cyan[900];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          children: <Widget>[
            CardDesign1(
                "الكل",
                Icon(
                  Icons.visibility_outlined,
                  color: LightColor.iconColor,
                )),
            CardDesign1(
                "مفتوح",
                Icon(
                  Icons.lock_open_rounded,
                  color: LightColor.iconColor,
                )),
            CardDesign1(
                "التوصيل",
                Icon(
                  Icons.car_repair,
                  color: LightColor.iconColor,
                )),
            CardDesign1(
                "نقطة الاستيلام",
                Icon(
                  Icons.account_balance,
                  color: LightColor.iconColor,
                )),
          ],
        ),
      ),
    );
  }

  Widget CardDesign1(String text, Icon icon) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            icon,
            SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: TextStyle(color: Colors.black, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

/*   Widget _productWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: AppTheme.fullWidth(context) * .7,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 4 / 3,
            mainAxisSpacing: 30,
            crossAxisSpacing: 20),
        padding: EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        children: AppData.productList
            .map(
              (product) => ProductCard(
                product: product,
                onSelected: (model) {
                  setState(() {
                    AppData.productList.forEach((item) {
                      item.isSelected = false;
                    });
                    model.isSelected = true;
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }
 */
  Future startSearch(String query) async {
    var listQuery = FirebaseFirestore.instance
        .collection('all')
        .where('title', isGreaterThanOrEqualTo: query)
        .get();
  }

//البحث

  Widget _search() {
    return Container(
      margin: AppTheme.padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: LightColor.lightGrey.withAlpha(100),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: InkWell(
                onTap: () {
                  //  startSearch();
                },
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "البحث عن المنتجات",
                      hintStyle: TextStyle(fontSize: 12),
                      contentPadding: EdgeInsets.only(
                          left: 10, right: 10, bottom: 0, top: 5),
                      prefixIcon: Icon(Icons.search, color: Colors.black54)),
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          /*        InkWell(
              onTap: () {},
              child: InkWell(
                  onTap: _showPopupMenu,
                  child: _icon(Icons.filter_list, color: Colors.black54))) */
        ],
      ),
    );
  }

  Widget iconPage(String txt, dynamic _onTaps) {
    return RaisedButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => _onTaps));
      },
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      color: /* Color(0xFF3d8b64), */ LightColor.backgroundPage,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(80)),
      child: TEXT(
        txt: txt,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

/* class ProductCard extends StatelessWidget {
  final Product product;
  final ValueChanged<Product> onSelected;
  ProductCard({Key key, this.product, this.onSelected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: LightColor.background,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: !product.isSelected ? 20 : 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              child: IconButton(
                icon: Icon(
                  product.isliked ? Icons.favorite : Icons.favorite_border,
                  color:
                      product.isliked ? LightColor.red : LightColor.iconColor,
                ),
                onPressed: () {},
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: product.isSelected ? 15 : 0),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: LightColor.orange.withAlpha(40),
                      ),
                      //   Image.asset(product.image)
                    ],
                  ),
                ),
                // SizedBox(height: 5),
                TEXT(
                  txt: product.name,
                  size: product.isSelected ? 16 : 14,
                ),
                TEXT(
                  txt: product.category,
                  size: product.isSelected ? 14 : 12,
                  color: LightColor.orange,
                ),
                TEXT(
                  txt: product.price.toString(),
                  size: product.isSelected ? 18 : 16,
                ),
              ],
            ),
          ],
        ),
      ).ripple(() {
        Navigator.of(context).pushNamed('/detail');
        onSelected(product);
      }, borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}
 */
class ProductIcon extends StatelessWidget {
  // final String imagePath;
  // final String text;
  final ValueChanged<Category> onSelected;
  final Category model;
  ProductIcon({Key key, this.model, this.onSelected}) : super(key: key);

  Widget build(BuildContext context) {
    return model.id == null
        ? Container(width: 5)
        : Container(
            margin: EdgeInsets.symmetric(horizontal: 3, vertical: 6),
            child: Container(
              padding: AppTheme.hPadding,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: model.isSelected
                    ? LightColor.background
                    : Colors.transparent,
                border: Border.all(
                  color:
                      model.isSelected ? LightColor.iconColor : LightColor.grey,
                  width: model.isSelected ? 2 : 1,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: model.isSelected ? Color(0xfffbf2ef) : Colors.white,
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              //TODO
              child: Stack(
                children: <Widget>[
                  model.image != null
                      ? Image.network(
                          model.image,
                          fit: BoxFit.cover,
                        )
                      : SizedBox(),
                  model.titleRegions == null
                      ? Container()
                      : Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            child: TEXT(
                              txt: model.titleRegions,
                              color: LightColor.yellowColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                ],
              ),
            ).ripple(
              () {
                onSelected(model);
                /*  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InternalContent()), */
                //     );
                /*  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ListUsers())); */
              },
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          );
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
                shape: RoundedRectangleBorder(borderRadius: borderRadius),
                onPressed: () {
                  if (onPressed != null) {
                    onPressed();
                  }
                },
                child: Container()),
          ),
        ],
      );
}
