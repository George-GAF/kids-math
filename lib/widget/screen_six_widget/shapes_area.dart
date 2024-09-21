import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../helper/shape.dart';
import '../../provider/state_mange/update_ui.dart';
import '../drag_and_drop_widget/draggable_widget.dart';
import '../../helper/draggable_item.dart';

class ShapesArea extends StatelessWidget {
  const ShapesArea({super.key, required this.shapes});
  final List<Shape> shapes;
  @override
  Widget build(BuildContext context) {
    var provider = context.read<UpdateUi>();
    var listCount = provider.shapePuzzle().getCellCount();

    var size = provider.shapePuzzle().getTargetSize() / 2;
   var listIndex = List.generate(listCount, (index) => index);

    final GlobalKey boardKey = GlobalKey();
    return SizedBox(//TODO: this in Original is Container
      key: boardKey,
      width: size * 3,
      height: double.infinity,
      child: Stack(
        children: List<Widget>.generate(listCount, (i) {
          int index = Random().nextInt(listIndex.length);
          var willRemove = listIndex[index];
          listIndex.remove(willRemove);

          return UnPlacedShape(
            index: willRemove,
            size: size,
            shape: shapes[willRemove],
            top: provider.shapePuzzle().topListPos[willRemove],
            left: provider.shapePuzzle().leftListPos[willRemove],
          );
        }),
      ),
    );
  }
}

class UnPlacedShape extends StatefulWidget {
  const UnPlacedShape({
    super.key,
    required this.size,
    required this.shape,
    required this.left,
    required this.top,
    required this.index,
  });

  final double size;
  final Shape shape;

  final double left;
  final double top;

  final int index;

  @override
  State<UnPlacedShape> createState() => _UnPlacedShapeState();
}

class _UnPlacedShapeState extends State<UnPlacedShape> {
  double left = 0;
  double top = 0;
  double sPosX = 0;
  double sPosY = 0;
  late RenderBox box;
  var maxYPosition = 0.0;

  @override
  void initState() {
    super.initState();
    left = widget.left;
    top = widget.top;
    // maxXPosition = widget.size * 3;
  }

  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    maxYPosition = MediaQuery.of(context).size.height - 20 - blockArea;
    var providerW = context.watch<UpdateUi>();

    var isAccepted = providerW.shapePuzzle().acceptedIndex[widget.index];
    return isAccepted
        ? const SizedBox()
        : Positioned(
            key: _key,
            left: left,
            top: top,
            child: DraggableWidget(
              timeToRest: 0,
              onStart: () {
                box = _key.currentContext?.findRenderObject() as RenderBox;
                final Offset pos = box.localToGlobal(Offset.zero);
                sPosX = pos.dx;
                sPosY = pos.dy;
              },
              onEnd: (detail) {
                var tLeft = left + detail.offset.dx - sPosX;
                var tTop = top + detail.offset.dy - sPosY;
                setState(() {
                  left =
                      tLeft > 0 && tLeft < (widget.size * 3) - (widget.size / 2)
                          ? tLeft
                          : left;
                  top = tTop > 0 && tTop < maxYPosition ? tTop : top;
                  providerW.shapePuzzle().leftListPos[widget.index] = left;
                  providerW.shapePuzzle().topListPos[widget.index] = top;
                });
              },
              child: Box(
                name: '${widget.index}',
                shape: widget.shape,
                size: widget.size,
                id: widget.shape.name(),
              ),
            ),
          );
  }
}

class Box extends DraggableItem {
  const Box({
    required this.shape,
    required this.size,
    super.key,
    required super.name,
    required super.id,
  });
  final Shape shape;
  final double size;
  @override
  Widget build(BuildContext context) {
    var color = shape.shapeColor;
    var colors = color == Colors.transparent
        ? [color, color, color]
        : [
            color,
            color.withAlpha(200),
            color.withOpacity(0.5),
          ];
    var shadow = color == Colors.transparent
        ? [const BoxShadow(color: Colors.transparent)]
        : const [
            BoxShadow(
              blurRadius: 5,
              offset: Offset(3, 3),
              //blurStyle: BlurStyle.inner
            ),
          ];
    return Container(
      width: size / 2,
      height: size / 2,
      decoration: BoxDecoration(
        gradient: shape.shapeType == BoxShape.circle
            ? RadialGradient(colors: colors)
            : LinearGradient(colors: colors),
        shape: shape.shapeType,
        boxShadow: shadow,
      ),
    );
  }
}
