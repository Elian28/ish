import 'package:flutter/material.dart';
import 'package:ptint/themes/LightColor.dart';

class RaisedButtons extends StatelessWidget {
  final Color color;
  final String txt;
  final Function() onPresseds;
  final highlightColors;
  final splashColors;
  double sizsBorderRadius;
  RaisedButtons({
    this.color = LightColor.iconColor,
    this.onPresseds,
    this.txt = "لم يتم تحديد الاسم",
    this.highlightColors = Colors.transparent,
    this.splashColors = Colors.transparent,
    this.sizsBorderRadius = 10,
  });
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      hoverElevation: 0,
      highlightElevation: 0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(sizsBorderRadius)),
      ),
      elevation: 0,
      highlightColor: highlightColors,
      splashColor: splashColors,
      child: Text(txt),
      onPressed: onPresseds,
    );
  }
}
