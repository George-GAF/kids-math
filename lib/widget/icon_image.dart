import 'package:flutter/material.dart';

Widget iconImage(String path) {
  return LayoutBuilder(builder: (context, boxCons) {
    double width = boxCons.maxWidth;
    double height = boxCons.maxHeight;
    return Image.asset(
      path,
      height: height,
      width: width,
    );
  });
}
