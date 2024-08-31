import 'package:flutter/material.dart';

class Shape {
  BoxShape shapeType;
  Color shapeColor;

  Shape(this.shapeType, this.shapeColor);

  String name() {
    String type = '';
    String color = shapeColor.toString();
    if (BoxShape.circle == shapeType) {
      type = 'circle';
    } else {
      type = 'rectangle';
    }

    // Use a regular expression to find the pattern
    RegExp regExp = RegExp(r'0x(.*?)\)');
    Match? match = regExp.firstMatch(color);

    // Extract the desired part
    if (match != null) {
      String result = match.group(1)!;
      color = result; // Output: ff4caf50
    }

    return '$type $color';
  }

  @override
  String toString() {
    return 'Shape Type $shapeType Has Color $shapeColor\n';
  }
}
