/* import 'package:flutter/material.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Aristocratic Hand Bag",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.title,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: kDefaultPaddin),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Price\n"),
                    TextSpan(
                      text: "\$${product.price}",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_1.png",
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Belt Bag",
      price: 234,
      size: 8,
      description: dummyText,
      image: "assets/images/bag_2.png",
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Hang Top",
      price: 234,
      size: 10,
      description: dummyText,
      image: "assets/images/bag_3.png",
      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "Old Fashion",
      price: 234,
      size: 11,
      description: dummyText,
      image: "assets/images/bag_4.png",
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_5.png",
      color: Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/bag_6.png",
    color: Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";

const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);

const kDefaultPaddin = 20.0;



class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      //ColorAndSize(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                    //  Description(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                     // CounterWithFavBtn(),
                      SizedBox(height: kDefaultPaddin / 2),
                     // AddToCart(product: product)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}
 */
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ptint/themes/AppTheme.dart';
import 'package:ptint/themes/LightColor.dart';

class RadioGroup extends StatefulWidget {
  @override
  RadioGroupWidget createState() => RadioGroupWidget();
}

class NumberList {
  String number;
  int index;
  NumberList({this.number, this.index});
}

class RadioGroupWidget extends State {
  // Default Radio Button Selected Item.
  String radioItemHolder = 'One';
  final _fromkey = GlobalKey<FormState>();

  // Group Value for Radio Button.
  int id = 1;

  List<NumberList> nList = [
    NumberList(
      index: 1,
      number: "One",
    ),
    NumberList(
      index: 2,
      number: "Two",
    ),
    NumberList(
      index: 3,
      number: "Three",
    ),
    NumberList(
      index: 4,
      number: "Four",
    ),
    NumberList(
      index: 5,
      number: "Five",
    ),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _fromkey,
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(14.0),
                child: Text('Selected Item = ' + '$radioItemHolder',
                    style: TextStyle(fontSize: 23))),
            Expanded(
                child: Container(
              height: 350.0,
              child: Column(
                children: nList
                    .map((data) => Radio(
                          groupValue: id,
                          value: data.index,
                          onChanged: (val) {
                            setState(() {
                              radioItemHolder = data.number;
                              id = data.index;
                            });
                          },
                        ))
                    .toList(),
              ),
            )),
            Container(
              margin: EdgeInsets.fromLTRB(0, 15.0, 0, 0),
              width: 75.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12.0)),
              child: FlatButton(
                  child: Text("التالي"),
                  onPressed:
                      _save /* () {
                            /*   Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ConfirmationOrder(
                                          addressText: addressText,
                                          addNotes: addNotes))); */
                          } */
                  ),
            )
          ],
        ),
      ),
    );
  }

  void _save() async {
    //   selected_city = hotelDrop[0];
    if (!_fromkey.currentState.validate()) {
      setState(() {
        //  _autovalidate = true;
      });
    } else {
      setState(() {
        //  _osLoading = true;
      });
      // await getidUsers();
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        FirebaseFirestore.instance.collection("Ok").doc().set({
          "userId": user.uid,
          "data.index": radioItemHolder,
        }).then((_) {
          Fluttertoast.showToast(
              msg: "تم اضافة المنتج",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: LightColor.iconColor,
              textColor: LightColor.titleTextColor,
              fontSize: AppTheme.fullHeight(context) / 35);

          //  Navigator.of(context).pop();
        });
      } else {
        // No User signed In.
      }
    }
  }
}
