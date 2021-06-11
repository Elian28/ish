import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ptint/3/app.dart';
import 'package:ptint/login/sized.dart';
import 'package:ptint/model/prodcut.dart';
import 'package:ptint/reddata/reid.dart';

import '../themePprovider.dart';

class Game extends StatefulWidget {
  static String routeName = "/game";
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("التوصيل مجاني"),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenWidth(20)),
          child: AppDrawer1() //_drawProducts(themeProvider.isLightTheme),
          ),
    );
  }

  Widget _drawProducts(bool them) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('game').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Center(
                child: CircularProgressIndicator(),
              );
            default:
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    print(snapshot.data.documents.first);
                    ItemModel model = ItemModel.fromJson(
                        snapshot.data.documents[index].data());
                    print(model.images);
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenWidth(10)),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            DetailsScreen.routeName,
                            arguments: ProductDetailsArguments(product: model),
                          );
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: getProportionateScreenWidth(88),
                              child: AspectRatio(
                                aspectRatio: 0.88,
                                child: Container(
                                  padding: EdgeInsets.all(
                                      getProportionateScreenWidth(10)),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5F6F9),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: model.images != null
                                      ? Image.network(
                                          model.images[0],
                                          fit: BoxFit.cover,
                                        )
                                      : Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                ),
                              ),
                            ),
                            SizedBox(width: getProportionateScreenWidth(20)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${model.title}",
                                  style: TextStyle(
                                      color: them ? Colors.black : Colors.white,
                                      fontSize:
                                          getProportionateScreenWidth(16)),
                                  maxLines: 2,
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(10)),
                                Text.rich(
                                  TextSpan(
                                    text: "\QAR ${model.price}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: kPrimaryColor),
                                    children: [
                                      TextSpan(
                                          // text: " x${cart.numOfItem}",
                                          //style: Theme.of(context).textTheme.bodyText1),
                                          ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
          }
        });
  }
}
// ignore: non_constant_identifier_names
