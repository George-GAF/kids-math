
import 'package:flutter/material.dart';

import '../../helper/puzzles_class/color_number.dart';
import '../cus_text.dart';

class NumberRow extends StatelessWidget {
  const NumberRow({
    super.key,
    required this.colorNumber,
  });
  final ColorNumber colorNumber;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List<Container>.generate(colorNumber.colorList.length, (index) {
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(2, 2),
              ),
            ],
            color: colorNumber.colorList[index],
            shape: BoxShape.circle,
          ),
          child: customText('${index + 1}'),
        );
      }),
    );
  }
}
