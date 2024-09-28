import 'package:flutter/material.dart';
import '../widget/cus_text_style.dart';

Widget customText(
  String data, {
  Color fontColor = Colors.amber,
  double height = 0,
  double width = 0,
  TextAlign align = TextAlign.center,
}) {
  return LayoutBuilder(builder: (context, boxConst) {
    double _height = height == 0 ? boxConst.maxHeight : height;
    double _width = width == 0 ? boxConst.maxWidth : width;
    double tempFontSize = (_width / data.length);
    double fontSize = _height > tempFontSize ? tempFontSize : _height * .8;
    return Align(
      child: Text(
        data,
        maxLines: null,
        textAlign: align,
        textHeightBehavior:
            const TextHeightBehavior(applyHeightToFirstAscent: false),
        style: customTextStyle(fontSize, fontColor),
      ),
    );
  });
}
