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
    double tHeight = height == 0 ? boxConst.maxHeight : height;
    double tWidth = width == 0 ? boxConst.maxWidth : width;
    double tempFontSize = (tWidth / data.length);
    double fontSize = tHeight > tempFontSize ? tempFontSize : tHeight * .8;
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
