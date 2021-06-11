import 'package:flutter/material.dart';
import 'package:ptint/model/prodcut.dart';

import '../themePprovider.dart';

class ProductCard1 extends StatelessWidget {
  const ProductCard1({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.product,
  }) : super(key: key);
  final double width, aspectRetio;
  final ItemModel product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: SizedBox(
        width: width,
        child: GestureDetector(
          // onTap: () {
          //   Route route =MaterialPageRoute(builder: (context){
          //    return DetailsScreen(arguments: ProductDetailsArguments(product: product),);
          //
          //
          //     });
          // },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // child: Hero(
                  //
                  //   tag: "btn1",
                  //   child: Image.asset(product.images[0]),
                  // ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.title,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                        // color: product.isFavourite
                        //     ? kPrimaryColor.withOpacity(0.15)
                        //     : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/icon/app@60x60x1.png',
                        width: 100,

                        // color: product.isFavourite
                        //     ? Color(0xFFFF4848)
                        //     : Color(0xFFDBDEE4),
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
