import 'package:flutter/material.dart';

import '../constant/constant.dart';

class MessageImage extends StatefulWidget {
  const MessageImage({super.key, required this.imagePath});
  final String imagePath;
  @override
  State<MessageImage> createState() => _MessageImageState();
}

class _MessageImageState extends State<MessageImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  //var _width = 0.0;
  //var _height = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: timeToShowMessageInMill),
      vsync: this,
    )..repeat(reverse: true);

    _animation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.8), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 0.8, end: 0.0), weight: 50),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (cont, child) {
          return SizedBox(
            width: _animation.value * MediaQuery.of(context).size.width,
            height: _animation.value * MediaQuery.of(context).size.height,
            child: Image.asset(
              widget.imagePath,
            ),
          );
        });
  }
}
