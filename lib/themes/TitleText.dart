import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'LightColor.dart';

class TEXT extends StatelessWidget {
  final String txt;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign align;
  final double letterSpacings;

  const TEXT(
      {this.txt,
      this.size = 13,
      this.color = LightColor.titleTextColor,
      this.fontWeight = FontWeight.w800,
      this.align,
      this.letterSpacings});
  @override
  Widget build(BuildContext context) {
    return Text(txt,
        style: GoogleFonts.muli(
            fontSize: size,
            fontWeight: fontWeight,
            color: color,
            letterSpacing: letterSpacings));
  }
}
