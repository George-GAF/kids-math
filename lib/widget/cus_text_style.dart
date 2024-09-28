import 'package:flutter/material.dart';

TextStyle customTextStyle(
  double fontSize,
  Color fontColor,
) {
  //log('cust style font size : $fontSize');
  var offset = fontSize *.09;
  return TextStyle(

    fontWeight: FontWeight.bold,
    fontSize: fontSize,
    color: fontColor,
    shadows:  [
      Shadow(
        offset: Offset(offset, offset),
        blurRadius: 5,
        color: Colors.black54,
      ),
    ],
  );
}
