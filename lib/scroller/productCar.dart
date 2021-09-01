import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ptint/login/sized.dart';
import 'package:ptint/model/prodcut.dart';
import 'package:ptint/reddata/reid.dart';

import '../themePprovider.dart';

class ProductCar extends StatefulWidget {
  const ProductCar({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.product,
  }) : super(key: key);
  final double width, aspectRetio;
  final ItemModel product;

  @override
  _ProductCarState createState() => _ProductCarState();
}

class _ProductCarState extends State<ProductCar> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: widget.width,
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(product: widget.product),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: widget.product.id.toString(),
                    child: Image.asset(widget.product.images[0]),
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Text(
                "${widget.product.title}",
                style: TextStyle(
                    color: themeProvider.isLightTheme
                        ? Colors.black
                        : Colors.white),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\QAR ${widget.product.price.toString()}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      height: getProportionateScreenHeight(28),
                      width: getProportionateScreenWidth(28),
                      decoration: BoxDecoration(
                        color: widget.product.isFavourite
                            ? kPrimaryColor.withOpacity(0.15)
                            : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/icon/app@60x60x1.png',
                        width: 100,
                        color: widget.product.isFavourite
                            ? Color(0xFFFF4848)
                            : Color(0xFFDBDEE4),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
