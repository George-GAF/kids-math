//

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helper/puzzles_class/shape_value_puzzle.dart';
import '../../provider/state_mange/update_ui.dart';

class ShapesWidgetRow extends StatelessWidget {
  const ShapesWidgetRow({
    super.key,
    required this.size,
    this.color = Colors.transparent,
    this.borderColor = Colors.transparent,
    this.isShuffle = false,
  });
  final bool isShuffle;
  final double size;
  final Color color;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    ShapeValuePuzzle sV = ShapeValuePuzzle();

    var newList = [];
    newList.addAll(sV.shapeValueList);
    //log('shapeValueList : ${sV.shapeValueList}');
    //log('newList : $newList');
    late ShapeValuePuzzle shapeValue;
    if (isShuffle) {
      shapeValue = context.read<UpdateUi>().puzzle as ShapeValuePuzzle;
      newList.clear();
      newList.addAll(shapeValue.shuffleList);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(newList.length, (index) {
        var temp = newList[index];
        temp.setValues(size, color: color, borderColor: borderColor);
        return temp.getShape();
      }),
    );
  }
}
