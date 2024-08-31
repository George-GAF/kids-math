import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/constant.dart';
import '../provider/active_screen.dart';
import '../screen_components/screen_icons.dart';


class Card3D extends StatelessWidget {
  final int index;
  const Card3D(this.index, {super.key});

  @override
  Widget build(BuildContext context) {

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.read<ActiveScreen>().updateIndex(1);
          context.read<ActiveScreen>().updateContentIndex(index);
          context.read<ActiveScreen>().updateBackGroundIndex(index+1);
        },
        child: Container(
          decoration: _buildBoxDecoration(iconsColors[index]),
          child: icons[index],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration(List<Color> colors) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.amber,width: 5,),
      boxShadow: const [
        BoxShadow(
          color: Colors.blue,
          offset: Offset(0, 5),
          blurRadius: 5,
          spreadRadius: -5,
        ),
      ],
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
        colors: buttonColor,
        stops: const [0.1, 0.3, 0.9, 1.0],
      ),
    );
  }
}
