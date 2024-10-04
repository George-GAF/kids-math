

import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../helper/draggable_item.dart';
import '../../helper/sound_manager.dart';

class TargetWidget extends StatefulWidget {

  final GlobalKey<TargetWidgetState>? key;

  const TargetWidget({
    required this.name,
    required this.onAssign,
    this.timeToRest = 0,
    this.key,
  }) : super(key: key);

  final String name;
  final Function(String) onAssign;
  final int timeToRest;

  @override
  State<TargetWidget> createState() => TargetWidgetState();
}

class TargetWidgetState extends State<TargetWidget> {
  bool isDropped = false;
  void rest() {
    setState(() {
      isDropped = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height * .15;
    DraggableItem child = const DraggableItem(name: '', id: '');
    return DragTarget<DraggableItem>(
      onWillAccept: (data) {
        return data?.id == widget.name && !isDropped;
      },
      onAccept: (data) {
        SoundManager.sound.playSound(drop);
        child = data;
        isDropped = true;
        widget.onAssign(child.name);
        if (widget.timeToRest != 0) {
          Future.delayed(Duration(milliseconds: widget.timeToRest), () {
            setState(() {
              isDropped = false;
            });
          });
        }
      },
      builder: (context, candidateData, rejectedData) {
         return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.4),
                borderRadius: BorderRadius.circular(size * .1),
              ),
            ),
            isDropped ? child : const SizedBox(),
          ],
        );
      },
    );
  }
}
