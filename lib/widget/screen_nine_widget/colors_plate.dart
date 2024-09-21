import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helper/app_size.dart';
import '../../helper/puzzles_class/color_number.dart';
import '../../provider/state_mange/update_ui.dart';
import 'screen_container.dart';

class ColorsPlate extends StatelessWidget {
  const ColorsPlate({
    super.key,
    required this.colorsList,
  });
  final List<Color> colorsList;
  @override
  Widget build(BuildContext context) {
    return ContainerForBottomPart(
      widthPercent: 0.2,
      isLeft: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ColorsColumn(colors: colorsList.sublist(0, 4)),
          ColorsColumn(colors: colorsList.sublist(4)),
        ],
      ),
    );
  }
}

class ColorsColumn extends StatelessWidget {
  const ColorsColumn({
    super.key,
    required this.colors,
  });
  final List<Color> colors;
  @override
  Widget build(BuildContext context) {
    var size = (AppSize().getHeight() - 100) / colors.length;
    var updateUi = context.watch<UpdateUi>();
    var colorNumberU = updateUi.puzzle as ColorNumber;
    var current = colorNumberU.selected;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        colors.length,
        (i) {
          return GestureDetector(
            onTap: () {
              Color newS = colorNumberU.selected == colors[i]
                  ? Colors.transparent
                  : colors[i];
              colorNumberU.setSelected(newS);
              updateUi.refresh();
            },
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: colors[i],
                shape: BoxShape.circle,
                border: Border.all(),
                boxShadow: current == colors[i]
                    ? [
                        BoxShadow(
                          color: Colors.black38,
                          offset: Offset(size * .03, size * .03),
                        ),
                      ]
                    : [],
              ),
            ),
          );
        },
      ),
    );
  }
}
