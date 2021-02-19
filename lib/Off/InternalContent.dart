/* //ممعلومات داخل الفئة
import 'package:flutter/material.dart';

class InternalContent extends StatelessWidget {
  final String regions;
  InternalContent({this.regions});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(regions),
      ),
      body: Text(regions),
    );
  }
}
 */