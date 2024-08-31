import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/screen_two_controller.dart';
import '../../constant/enum_file.dart';

class BaseShape extends StatelessWidget {
  const BaseShape({super.key});

  @override
  Widget build(BuildContext context) {
    //context.watch<MassageProvider>().isAnimDone;

    var controller = context.watch<ScreenTwoController>();
    //controller.isRefresh;
    double angle = controller.rotateDir.value;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * .7,
      child: Column(
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..rotateZ(angle),
            child: const _Stand(),
          ),
          _Base(
            height: height,
            width: width * .7,
          ),
        ],
      ),
    );
  }
}

class _Stand extends StatelessWidget {
  const _Stand();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      decoration: BoxDecoration(
        color: Colors.brown,
        border: Border.all(color: Colors.black),
      ),
    );
  }
}

class _Base extends StatelessWidget {
  const _Base({required this.width, required this.height});
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    double size = height * .15;
    return Stack(
      children: [
        Positioned(
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.brown,
              border: Border.all(color: Colors.black),
            ),
          ),
        ),
        Positioned(
          child: Container(
            margin: EdgeInsets.only(top: size / 2),
            width: size,
            height: size,
            decoration: const BoxDecoration(
              color: Colors.brown,
              border: Border(
                left: BorderSide(color: Colors.black),
                right: BorderSide(color: Colors.black),
                bottom: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
