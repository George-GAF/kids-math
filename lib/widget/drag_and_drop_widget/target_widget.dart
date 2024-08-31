import 'dart:developer';

import 'package:flutter/material.dart';

import '../../helper/draggable_item.dart';

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
    //  log('from target : $isDropped');
    });
  }

  @override
  Widget build(BuildContext context) {
    log('target name : ${widget.name} isDropped : $isDropped');
    double size = MediaQuery.of(context).size.height * .15;
    DraggableItem child = const DraggableItem(name: '', id: '');
    return DragTarget<DraggableItem>(
      onWillAccept: (data) {
        //   log('from onWillAccept data ${data?.name}');
        return data?.id == widget.name && !isDropped;
      },
      onAccept: (data) {
        child = data;
        isDropped = true;
        //log('from target name ${widget.name} : isDropped : $isDropped');
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
