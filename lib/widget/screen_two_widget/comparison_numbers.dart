import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/screen_two_controller.dart';
import '../../constant/enum_file.dart';
import '../cus_text.dart';

class ComparisonNumbers extends StatelessWidget {
  const ComparisonNumbers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //context.watch<MassageProvider>().isAnimDone;

    var controller = context.watch<ScreenTwoController>();

    double angle = controller.rotateDir.value;
    int numberOne = controller.numbers[0];
    int numberTwo = controller.numbers[1];

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateZ(angle),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .7,
        height: MediaQuery.of(context).size.height * .15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _Number(number: numberOne, angle: angle),
            _Number(number: numberTwo, angle: angle),
          ],
        ),
      ),
    );
  }
}

class _Number extends StatelessWidget {
  const _Number({
    required this.number,
    required this.angle,
  });
  final int number;
  final double angle;
  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateZ(-angle),
      child: customText(
        number.toString(),
      ),
    );
  }
}
