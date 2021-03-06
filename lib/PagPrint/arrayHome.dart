import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ptint/3/EducationalService.dart';
import 'package:ptint/3/app.dart';
import 'package:ptint/7/u2.dart';
import 'package:ptint/Books2/Bookas.dart';
import 'package:ptint/PagPrint/PrintAdvertising.dart';
import 'package:ptint/PagPrint/PrintCompanies.dart';
import 'package:ptint/PagPrint/PrintRestaurants.dart';
import 'package:ptint/PagPrint/printBags.dart';
import 'package:ptint/task/task.dart';
import 'package:ptint/themes/AppTheme.dart';
import 'package:ptint/themes/LightColor.dart';
import 'package:ptint/themes/TitleText.dart';
import 'package:ptint/yes/ListUsers.dart';

class ArrayHome extends StatefulWidget {
  @override
  _ArrayHomeState createState() => _ArrayHomeState();
}

class _ArrayHomeState extends State<ArrayHome> {
  List list = [
    'التصميم',
    'الطباعة',
    // "لوحات فنية"
    "الخدمة التعليمية",
    "حراج الكتب",
    "القرطاسيات",
    "كروت ",
    "مطبوعات الشركات",
    "مطبوعات المطاعم",
    "مطبوعات دعاية",
    "اكياس والشنط",
  ];
  List img = [
    "assets/icon/app@60x60x1.png",
    "assets/icon/app@60x60x1.png",
    "assets/icon/app@60x60x1.png",
    "assets/icon/app@60x60x1.png",
    "assets/icon/app@60x60x1.png",
    "assets/icon/app@60x60x1.png",
    "assets/icon/app@60x60x1.png",
    "assets/icon/app@60x60x1.png",
    "assets/icon/app@60x60x1.png",
    "assets/icon/app@60x60x1.png",
    //  "assets/icon/app@60x60x1.png",
  ];
  List<Widget> onTap = [
    UploadFile(),
    UploadFile(),
    EducationalService(),
    Booksa(),
    ListUsers(),
    Carts(),
    PrintCompanies(),
    PrintRestaurants(),
    PrintAdvertising(),
    PrintBags(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: AppDrawer1(),
        appBar: AppBar(
          elevation: 0,
          title: _search(),
        ),
        body: viewbook());
  }

  Widget viewbook() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                  elevation: 0,
                  child: Stack(children: <Widget>[
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                                  padding: EdgeInsets.all(9),
                                  /*    decoration: BoxDecoration(
                                   color: LightColor.titleTextColor,
                                   borderRadius: BorderRadius.circular(24)), */
                                  child: Image.asset(img[index],
                                      width: AppTheme.fullWidth(context),
                                      height: AppTheme.fullHeight(context),
                                      fit: BoxFit.fill))),
                          /*  Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: 9 / 4),
                          child: Text(
                            // products is out demo list
                            list[index].toString(),
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                         Text(
                              document["price"].toString() ,
                             style: TextStyle(fontWeight: FontWeight.bold),
                           ) */
                          Row(children: <Widget>[
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: list[index].toString().toString(),
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              TextSpan(
                                  text: "   ",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold))
                            ])),
                            SizedBox(width: 3)
                          ])
                        ]),
                    //8
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => onTap[index]));
                        },
                        /*onTap: () {
                           Navigator.of(context).push(MaterialPageRoute(
                               builder: (BuildContext context) =>
                                   DoctorsInfo(
                                     idBook: snapshot.data.docs[index].id,
                                     authorName:
                                         snapshot.data.docs[index].data()["authorName"],
                                   )));},*/
                        child: Container(
                            width: 150,
                            margin: EdgeInsets.only(right: 16),
                            padding:
                                EdgeInsets.only(top: 16, right: 16, left: 16),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[])))
                  ]));
            }));
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
                      hintText: "المنتج بالاسم او الكود ",
                      hintStyle: TextStyle(fontSize: 12),
                      contentPadding: EdgeInsets.only(
                          left: 10, right: 10, bottom: 0, top: 5),
                      prefixIcon: Icon(Icons.search, color: Colors.black54)),
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          /*
          InkWell( onTap: () {},
            child: InkWell(
                  onTap: _showPopupMenu,
                  child: _icon(Icons.filter_list, color: Colors.black54)))
                   */
        ],
      ),
    );
  }
}

class Item {
  final String title;
  final double price;
  final int quantity;
  final String number;
  final int index;
  final Function() ontap;
  Item(
      {this.number,
      this.index,
      this.ontap,
      this.title,
      this.price,
      this.quantity});
}

class Cart extends ChangeNotifier {
  List<Item> _items = [];
  double _totaPrice = 0.0;

  void add(Item items) {
    _items.add(items);
    _totaPrice += items.price;
    notifyListeners();
  }

  void remove(Item items) {
    _totaPrice -= items.price;
    _items.remove(items);
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totaPrice {
    return totaPrice;
  }

  List<Item> get basketItems {
    return _items;
  }
}

class Carts extends StatefulWidget {
  @override
  _CartsState createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  final List<Item> items = [
    Item(
      title: '"كرت سميك حراري"',
      price: 500.0,
      quantity: 2,
      ontap: () {
        return ThermalCard();
      },
    ),
    Item(
      title: 'بطاقات بلاستيك id',
      price: 400.0,
      quantity: 2,
      ontap: () {
        return PlastiCard();
      },
    ),
    Item(
      title: 'كرت فيزيت سميك نافر مقرم الزوايا',
      price: 50.0,
      quantity: 3,
      ontap: () {},
    ),
    Item(
      title: 'كرت فيزيت عادي',
      price: 50.0,
      quantity: 4,
      ontap: () {},
    ),
    Item(
      title: 'كرت معطر للسيارات',
      price: 50.0,
      quantity: 4,
      ontap: () {},
    ),
    Item(
      title: 'كرت مقمش',
      price: 50.0,
      quantity: 4,
      ontap: () {},
    ),
    Item(
      title: 'كروت البسة',
      price: 50.0,
      quantity: 4,
      ontap: () {},
    ),
    Item(
      title: 'كروت مغناطيس',
      price: 50.0,
      quantity: 4,
      ontap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, child) {
      return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue[700],
            child: Icon(Icons.add),
            onPressed: () {},
          ),
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    child: Badge(
                  badgeColor: LightColor.iconColor,
                  badgeContent: Text(
                    '${cart.count.toString()}',
                    style: TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => ChecKoutPage()));
                      }),
                )),
              )
            ],
          ),
          body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              items[index].ontap()));
                    },
                    /*   onTap: () {
                      if (cart.basketItems.contains(index)) {
                        cart.add(items[index]);
                      } else {
                        cart.add(items[index]);
                      }
                    },*/
                    title: Text(items[index].title),
                    subtitle: Text(items[index].price.toString()),
                    leading: Icon(Icons.add));
              }));
    });
  }
}

class ThermalCard2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("كرت سميك حراري"),
        ),
        body: Column(
          children: [
            Text('الصور'),
            Text('وصف المنتج' +
                "\n عدد الكروت" +
                " اتجاه التصميم\n" +
                "وجه الطباعة\n" +
                "نوع القصة\n"),
            Text('سعر المتج'),
            Text('اختيار العدد'),
            Text('تجاه التصميم'),
            Text('وجه الطباعة'),
            Text("نوع القصة"),
            Text('اضافة ملف التصميم (ِAi-Psd-Eps-Cdr-Pdf)'),
            Text('اضافة المنتج'),
          ],
        ));
  }
}

class ThermalCard extends StatefulWidget {
  @override
  _ThermalCardState createState() => _ThermalCardState();
}

class _ThermalCardState extends State<ThermalCard> {
/*   var _fromKey = GlobalKey<FormState>();
 */
  String radioItemHolder = 'وجهه';
  String radioItemHolderColor = 'اسود';
  int id = 1;
  int idColor = 1;
  int idC = 1;
  List<Item> nList = [
    Item(
      index: 1,
      number: "افقي",
    ),
    Item(
      index: 2,
      number: "عمودي",
    ),
  ];
  List<Item> nListPrint = [
    Item(
      index: 1,
      number: "1000 كرتت",
    ),
    Item(
      index: 2,
      number: "1000 كرتت",
    ),
  ];

  List<Item> nListColor = [
    Item(
      index: 1,
      number: "وحهينن",
    ),
  ];
  List<Item> nListPrints = [
    Item(
      index: 1,
      number: "قصة خاصة",
    ),
    Item(
      index: 2,
      number: "مقرم",
    ),
  ];
  //SingingCharacter _character = SingingCharacter.lafayette;

  GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Column(
          children: [
            Text("اتجاه التصميم"),
            Row(
              children: nList
                  .map((data) => Flexible(
                        fit: FlexFit.tight,
                        child: RadioListTile(
                          title: TEXT(txt: "${data.number}"),
                          groupValue: id,
                          value: data.index,
                          onChanged: (val) {
                            setState(() {
                              radioItemHolder = data.number;
                              id = data.index;
                            });
                          },
                        ),
                      ))
                  .toList(),
            ),
            Text(" وجه الطباعة"),
            Container(
                child: Row(
              children: nListColor
                  .map((data) => Flexible(
                        fit: FlexFit.tight,
                        child: RadioListTile(
                          title: TEXT(txt: "${data.number}"),
                          groupValue: idColor,
                          value: data.index,
                          onChanged: (val) {
                            setState(() {
                              radioItemHolderColor = data.number;
                              idColor = data.index;
                            });
                          },
                        ),
                      ))
                  .toList(),
            )),
            Text("نوع القصة"),
            Row(
              children: nListPrints
                  .map((data) => Flexible(
                        fit: FlexFit.tight,
                        child: RadioListTile(
                          title: TEXT(txt: "${data.number}"),
                          groupValue: idC,
                          value: data.index,
                          onChanged: (val) {
                            setState(() {
                              radioItemHolder = data.number;
                              idC = data.index;
                            });
                          },
                        ),
                      ))
                  .toList(),
            ),
          ],
        ));
  }
}

class PlastiCard extends StatefulWidget {
  @override
  _ThermalCardState createState() => _ThermalCardState();
}

class _PlastiCardState extends State<PlastiCard> {
/*   var _fromKey = GlobalKey<FormState>();
 */
  String radioItemHolder = 'وجهه';
  String radioItemHolderColor = 'اسود';
  int id = 1;
  int idColor = 1;
  int idC = 1;
  List<Item> nList = [
    Item(
      index: 1,
      number: "افقي",
    ),
    Item(
      index: 2,
      number: "عمودي",
    ),
  ];
  List<Item> nListPrint = [
    Item(
      index: 1,
      number: "1000 كرتت",
    ),
    Item(
      index: 2,
      number: "1000 كرتت",
    ),
  ];

  List<Item> nListColor = [
    Item(
      index: 1,
      number: "وحهينن",
    ),
  ];
  List<Item> nListPrints = [
    Item(
      index: 1,
      number: "قصة خاصة",
    ),
    Item(
      index: 2,
      number: "مقرم",
    ),
  ];
  //SingingCharacter _character = SingingCharacter.lafayette;

  GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Column(
          children: [
            Text("اتجاه التصميم"),
            Row(
              children: nList
                  .map((data) => Flexible(
                        fit: FlexFit.tight,
                        child: RadioListTile(
                          title: TEXT(txt: "${data.number}"),
                          groupValue: id,
                          value: data.index,
                          onChanged: (val) {
                            setState(() {
                              radioItemHolder = data.number;
                              id = data.index;
                            });
                          },
                        ),
                      ))
                  .toList(),
            ),
            Text(" وجه الطباعة"),
            Container(
                child: Row(
              children: nListColor
                  .map((data) => Flexible(
                        fit: FlexFit.tight,
                        child: RadioListTile(
                          title: TEXT(txt: "${data.number}"),
                          groupValue: idColor,
                          value: data.index,
                          onChanged: (val) {
                            setState(() {
                              radioItemHolderColor = data.number;
                              idColor = data.index;
                            });
                          },
                        ),
                      ))
                  .toList(),
            )),
            Text("نوع القصة"),
            Row(
              children: nListPrints
                  .map((data) => Flexible(
                        fit: FlexFit.tight,
                        child: RadioListTile(
                          title: TEXT(txt: "${data.number}"),
                          groupValue: idC,
                          value: data.index,
                          onChanged: (val) {
                            setState(() {
                              radioItemHolder = data.number;
                              idC = data.index;
                            });
                          },
                        ),
                      ))
                  .toList(),
            ),
          ],
        ));
  }
}
