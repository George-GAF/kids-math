import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../helper/shape.dart';
import '../../provider/state_mange/update_ui.dart';
import '../../widget/screen_six_widget/shape_board.dart';

class Target extends StatelessWidget {
  const Target({super.key, required this.shapes,});
  final List<Shape> shapes ;
  @override
  Widget build(BuildContext context) {
    var targetSize = context.read<UpdateUi>().shapePuzzle().getTargetSize();
    return SizedBox(
      width: targetSize,
      child: Column(
        children: [
          Text(
            explainMassage,
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: targetSize * .07,
            ),
          ),
          ShapeBoard(
            isTarget: true,
            size: targetSize,
            shapes: shapes,
          )
        ],
      ),
    );
  }
}
