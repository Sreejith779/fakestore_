import 'package:flutter/material.dart';

TextStyle style(double fontSize, FontWeight weight, Color color,
    [TextDecoration? underline, TextOverflow? overflow]) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: weight,
    color: color,
    overflow: overflow ?? TextOverflow.ellipsis,
    decoration: underline ?? TextDecoration.none,
  );
}
