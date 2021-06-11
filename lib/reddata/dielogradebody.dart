import 'package:flutter/material.dart';
import 'package:ptint/login/sized.dart';
import 'package:ptint/model/prodcut.dart';

import '../themePprovider.dart';

class ProductDescription extends StatelessWidget {
  ProductDescription({
    Key key,
    @required this.product,
    this.stet,
    this.pressOnSeeMore,
  }) : super(key: key);
  final ItemModel product;
  final GestureTapCallback pressOnSeeMore;
  final bool stet;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            "${product.title}",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(10)),
            width: getProportionateScreenWidth(64),
            decoration: BoxDecoration(
              color:
                  product.isFavourite ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: InkWell(
              onTap: pressOnSeeMore,
              child: Image.asset(
                'assets/icon/app@60x60x1.png',
                width: 100,
                color: stet ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
                height: getProportionateScreenWidth(16),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: getProportionateScreenWidth(20),
            left: getProportionateScreenWidth(64),
          ),
          child: Text(
            "${product.description}",
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenWidth(10),
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  "المزيد",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                ),
                SizedBox(width: getProportionateScreenWidth(5)),
                Icon(
                  Icons.arrow_forward_ios,
                  size: getProportionateScreenWidth(12),
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
