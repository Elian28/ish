import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import 'package:ptint/themes/LightColor.dart';

import 'package:flutter/material.dart';

import '../data.dart';
import 'CarFreshenerCard.dart';
import 'ClothingCards.dart';
import 'CornerCard.dart';
import 'MagnetCards.dart';
import 'NormalCard.dart';
import 'PlasticCards_id.dart';
import 'TexturedCard.dart';
import 'ThermalCard.dart';
//!

import 'package:flutter/cupertino.dart';

import 'package:ptint/themes/AppTheme.dart';

class Carts extends StatefulWidget {
  @override
  _CartsState createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  final List<Item> items = [
    Item(
      id: "1",
      title: '"كرت سميك حراري"',
      price: 500.0,
      quantity: 2,
      img:
          "https://www.qualiteyprinting.com/image/cache/catalog/كروت%20حراري-1100x1100w.jpg",
      ontap: () {
        return ThermalCard();
      },
    ),
    Item(
      id: "2",
      title: 'بطاقات بلاستيك id',
      price: 400.0,
      quantity: 2,
      img:
          "https://www.qualiteyprinting.com/image/cache/catalog/demo/plastik-kart-1100x1100.jpg",
      ontap: () {
        return PlasticCards_id();
      },
    ),
    Item(
      id: "3",
      title: 'كرت شفاف',
      price: 400.0,
      quantity: 2,
      img:
          "https://www.qualiteyprinting.com/image/cache/catalog/كرت%20شفاف%203-1100x1100h.jpg",
      ontap: () {
        return PlasticCards_id();
      },
    ),
    Item(
      id: "4",
      title: 'كرت فيزيت سميك نافر مقرم الزوايا',
      price: 24.0,
      quantity: 3,
      img:
          'https://image.freepik.com/free-photo/saudi-arabia-flag-against-city-blurred-background-sunrise-backlight_1379-1638.jpg',
      ontap: () {
        return CornerCard();
      },
    ),
    Item(
      id: "5",
      title: 'كرت فيزيت عادي',
      price: 29.0,
      quantity: 4,
      img:
          'https://image.freepik.com/free-photo/saudi-arabia-flag-against-city-blurred-background-sunrise-backlight_1379-1638.jpg',
      ontap: () {
        return NormalCard();
      },
    ),
    Item(
      id: "6",
      title: 'كرت معطر للسيارات',
      price: 290.0,
      quantity: 4,
      img:
          'https://image.freepik.com/free-photo/saudi-arabia-flag-against-city-blurred-background-sunrise-backlight_1379-1638.jpg',
      ontap: () {
        return CarFreshenerCard();
      },
    ),
    Item(
      id: "7",
      title: 'كرت مقمش',
      price: 699.0,
      quantity: 4,
      img:
          'https://image.freepik.com/free-photo/saudi-arabia-flag-against-city-blurred-background-sunrise-backlight_1379-1638.jpg',
      ontap: () {
        return TexturedCard();
      },
    ),
    Item(
      id: "8",
      title: 'كروت ملابس',
      price: 100.0,
      quantity: 4,
      img:
          'https://image.freepik.com/free-photo/saudi-arabia-flag-against-city-blurred-background-sunrise-backlight_1379-1638.jpg',
      ontap: () {
        return ClothingCards();
      },
    ),
    Item(
      id: "9",
      title: 'كروت مغناطيس',
      price: 50.0,
      quantity: 4,
      img:
          'https://image.freepik.com/free-photo/saudi-arabia-flag-against-city-blurred-background-sunrise-backlight_1379-1638.jpg',
      ontap: () {
        return MagnetCards();
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var _fullHeight = AppTheme.fullHeight(context);

    return Consumer<Cart>(builder: (context, cart, child) {
      return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    child: Badge(
                  badgeColor: LightColor.iconColor,
                  badgeContent: Text(
                    "",
                    //'${cart.count.toString()}',
                    style: TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        /*          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                MarketingCart(
                                      cart.items.values.toList()[i].id,
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].price,
                    cart.items.values.toList()[i].quantity,
                    cart.items.values.toList()[i].name
                                ))); */
                      }),
                )),
              )
            ],
          ),
          body: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  ListTile(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: items[index].ontap(),
                              );
                            });
                      },
                      /*       onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  items[index].ontap()));
                        }, */
                      /*                  onTap: () {
                        if (cart.basketItems.contains(index)) {
                          cart.add(items[index]);
                        } else {
                          cart.add(items[index]);
                        }
                      }, */
                      title: Text(items[index].title),
                      subtitle: Text(items[index].price.toString()),
                      leading: Icon(Icons.add)),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.all(9),
                          child: Image.network(items[index].img,
                              // width: AppTheme.fullWidth(context),
                              // height: AppTheme.fullHeight(context),
                              fit: BoxFit.fill))),
                ],
              );
            },
          ));
    });
  }
//!///////////////////////
}
