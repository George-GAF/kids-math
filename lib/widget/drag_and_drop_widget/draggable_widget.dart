import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../helper/draggable_item.dart';
import '../../helper/sound_manager.dart';

class DraggableWidget extends StatefulWidget {
  const DraggableWidget({
    super.key,
    required this.child,
    required this.timeToRest,
    this.onEnd, this.onStart,
  });

  final DraggableItem child;
  final int timeToRest;
  final Function(DraggableDetails details)? onEnd;
  final Function()? onStart;
  @override
  State<DraggableWidget> createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  bool _isDropped = false;
  @override
  Widget build(BuildContext context) {
    return Draggable<DraggableItem>(
      data: widget.child,
      feedback: widget.child,
      childWhenDragging: const SizedBox(
        width: 0,
        height: 0,
      ),

      onDragStarted: (){
        SoundManager.sound.playSound(click);
        if(widget.onStart != null){
          widget.onStart!();
        }
      },
      onDragEnd: (detail) {
        if (widget.onEnd != null) {
          widget.onEnd!(detail);
          return;
        }
        setState(() {
          _isDropped = detail.wasAccepted;
        });
        if (widget.timeToRest != 0) {
          Future.delayed(Duration(milliseconds: widget.timeToRest), () {
            setState(() {
              _isDropped = false;
            });
          });
        }
      },
      child: _isDropped
          ? const SizedBox(
              width: 0,
              height: 0,
            )
          : widget.child,
    );
  }
}
