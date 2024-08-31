import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helper/shape.dart';
import '../../provider/state_mange/update_ui.dart';
import 'shape_board.dart';

class Solution extends StatelessWidget {
  const Solution({super.key, required this.shapes});
  final List<Shape> shapes ;
  @override
  Widget build(BuildContext context) {
    var provider = context.read<UpdateUi>();
    return ShapeBoard(
      isTarget: false,
      shapes: shapes,
      size: provider.shapePuzzle().getPlayAreaSize(),
    );
  }
}
