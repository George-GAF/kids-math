import 'package:flutter/material.dart';

TextStyle customTextStyle(
  double fontSize,
  Color fontColor,
) {
  return TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: fontSize,
    color: fontColor,
    shadows: const [
      Shadow(
        offset: Offset(2, 2),
        blurRadius: 2,
        color: Colors.black54,
      ),
    ],
  );
}
