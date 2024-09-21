import 'package:flutter/material.dart';
import '../../helper/app_size.dart';

class ContainerForBottomPart extends StatelessWidget {

  const ContainerForBottomPart({
    super.key,
    required this.child,
    required this.widthPercent,
    this.isLeft = true,
  });

  final Widget child;
  final double widthPercent;
  final bool isLeft;
  @override
  Widget build(BuildContext context) {
    const space = 5.0;
    var width = (AppSize().getWidth() * widthPercent) - space;
    var height = AppSize().getHeight() - (space + 80);



    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(
        left: isLeft ? space : 0,
        right: isLeft ? 0 : space,
        bottom: space,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(space),
      ),
      child: child,
    );
  }
}
