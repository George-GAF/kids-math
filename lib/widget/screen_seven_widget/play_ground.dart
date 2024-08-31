import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../helper/app_size.dart';
import 'number_balloon.dart';

class PlayGround extends StatelessWidget {
  const PlayGround({super.key});

  @override
  Widget build(BuildContext context) {
    var balloonList =
        List.generate(balloonNumber, (index) => NumberBalloon(index: index));

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      height: AppSize().getHeight() - 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Stack(
        children: balloonList,
      ),
    );
  }
}
