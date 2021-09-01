import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ptint/PagPrint/arrayHome.dart';
import 'package:ptint/login/sized.dart';
import 'package:ptint/model/prodcut.dart';
import 'package:ptint/reddata/reid.dart';

import '../themePprovider.dart';

class ViewAllPro extends StatefulWidget {
  static String routeName = "/allProduct";
  @override
  _ViewAllProState createState() => _ViewAllProState();
}

class _ViewAllProState extends State<ViewAllPro> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    SizeConfig().init(context);
    return Scaffold(
      /*  appBar: AppBar(
        title: Text("كل النتجات"),
      ), */
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenWidth(20)),
        child: ArrayHome() /*  _drawProducts(themeProvider.isLightTheme) */,
      ),
    );
  }

  Widget _drawProducts(bool them) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('all').snapshots(),
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
                    ItemModel model =
                        ItemModel.fromJson(snapshot.data.docs[index].data());
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
                                      color: them ? Colors.white : Colors.black,
                                      fontSize:
                                          getProportionateScreenWidth(16)),
                                  maxLines: 2,
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(10)),
                                Text.rich(
                                  TextSpan(
                                    text: "\QAR ${model.price.toString()}",
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
