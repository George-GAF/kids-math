import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../helper/shape.dart';
import '../../provider/massage_provider.dart';
import '../../provider/state_mange/update_ui.dart';
import '../drag_and_drop_widget/target_widget.dart';

class ShapeBoard extends StatelessWidget {
  const ShapeBoard({
    super.key,
    required this.size,
    required this.isTarget,
    required this.shapes,
  });
  final double size;
  final bool isTarget;
  final List<Shape> shapes;
  @override
  Widget build(BuildContext context) {
    //dev.log('shape board build function');
    //var provider = context.read<ScreenSixController>();
    //var itemCount = provider.getCellCount();
    var updateUi = context.read<UpdateUi>();
    var itemCount = updateUi.shapePuzzle().getCellCount();
    return SizedBox(
      height: size,
      width: size,
      child: GridView.builder(
        itemCount: itemCount,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: sqrt(itemCount).toInt(),
        ),
        itemBuilder: (cont, i) {
          // dev.log('itemBuilder');

          var child = isTarget
              ? GuideContainer(
                  shape: shapes[i],
                )
              : TargetContainer(
                  shape: shapes[i],
                );

          return Container(
            height: size / sqrt(itemCount),
            width: size / sqrt(itemCount),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
            ),
            child: child,
          );
        },
      ),
    );
  }
}

class TargetContainer extends StatelessWidget {
  //final GlobalKey<TargetWidgetState> _key = GlobalKey<TargetWidgetState>();
  const TargetContainer({
    super.key,
    required this.shape,
  });
  final Shape shape;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<TargetWidgetState> key = GlobalKey<TargetWidgetState>();
    var massageProvider = context.read<MassageProvider>();
    var updateUi = context.watch<UpdateUi>();
    var target = TargetWidget(
        key: key,
        name: shape.name(),
        onAssign: (index) {
          Future.microtask(() {
            updateUi.shapePuzzle().updateShapes(int.parse(index));
            if (updateUi.shapePuzzle().isDone) {
              massageProvider.switchAnimState();
              Future.delayed(
                  const Duration(milliseconds: timeToShowMessageInMill), () {
               // context.read<CreateData>().start();
                massageProvider.switchAnimState();
              });
            }
          });
        });
    updateUi.shapePuzzle().addToList(target);

    return target;
  }
}

class GuideContainer extends StatelessWidget {
  const GuideContainer({
    super.key,
    required this.shape,
  });
  final Shape shape;
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: shape.shapeColor,
        shape: shape.shapeType,
      ),
    );
  }
}
