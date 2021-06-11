import 'package:flutter/material.dart';
import 'package:ptint/login/sized.dart';

import '../../themePprovider.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key key,
    @required this.svgSrc,
    this.numOfitem = 0,
    @required this.press,
  }) : super(key: key);

  final String svgSrc;
  final int numOfitem;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: press,
        child: Stack(overflow: Overflow.visible, children: [
          Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(12)),
              height: getProportionateScreenWidth(46),
              width: getProportionateScreenWidth(46),
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                "assets/food.jpeg",
                fit: BoxFit.cover,
              )),
          if (numOfitem != 0)
            Positioned(
                top: -3,
                right: 0,
                child: Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF4848),
                      shape: BoxShape.circle,
                      border: Border.all(width: 1.5, color: Colors.white),
                    ),
                    child: Center(
                        child: Text("$numOfitem",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(10),
                                height: 1.4,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)))))
        ]));
  }
}
