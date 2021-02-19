import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final String prod_fullName; // اسمم المنتح
  final String prod_pic; // سعر المنتج الجديد
  final double prod_old_price; // سعر المنتج القديمم
  final double prod_price; // سعر المنتج

  const ProductDetails(
      {Key key,
      this.prod_fullName,
      this.prod_pic,
      this.prod_old_price,
      this.prod_price})
      : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  double percent;
  @override
  void initState() {
    percent = (widget.prod_old_price - widget.prod_price) /
        widget.prod_old_price *
        100;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text("$percent%");
  }
}
