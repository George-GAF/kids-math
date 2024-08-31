import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/enum_file.dart';
import '../helper/app_size.dart';
import '../helper/helper.dart';
import '../provider/massage_provider.dart';
import '../provider/screen_two_controller.dart';
import '../widget/message_image.dart';
import '../widget/screen_two_widget/base_shape.dart';
import '../widget/screen_two_widget/comparison_numbers.dart';
import '../widget/screen_two_widget/comparison_widget.dart';
import '../widget/drag_and_drop_widget/target_widget.dart';
import '../widget/drag_and_drop_widget/draggable_widget.dart';
import '../constant/constant.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.read<ScreenTwoController>();
    provider.updateIsRefresh(false);
    provider.setValues(10, 40);

    var massageProvider = context.watch<MassageProvider>();
    var imagePath = massageProvider.getImagePath();

    return Stack(
      alignment: Alignment.center,
      children: [
        const Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TopPart(),
            MatchingMarker(),
          ],
        ),
        massageProvider.isAnimDone
            ? const SizedBox()
            : MessageImage(imagePath: imagePath),
      ],
    );
  }
}

class TopPart extends StatelessWidget {
  const TopPart({super.key});

  @override
  Widget build(BuildContext context) {
    var massageProvider = context.read<MassageProvider>();

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            const ComparisonNumbers(),
            TargetWidget(
              timeToRest: timeToShowMessageInMill,
              name: 'ComparisonWidget',
              onAssign: (name) {
                List<int> numbers = context.read<ScreenTwoController>().numbers;
                bool result = Helper.getComparisonResult(name, numbers);
                Future.microtask(() {
                  massageProvider.updateIsRight(result);
                  massageProvider.switchAnimState();
                  Future.delayed(
                      const Duration(milliseconds: timeToShowMessageInMill),
                      () {
                    massageProvider.switchAnimState();
                    context.read<ScreenTwoController>().updateIsRefresh(true);
                  });
                });
              },
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const BaseShape(),
      ],
    );
  }
}

class MatchingMarker extends StatelessWidget {
  const MatchingMarker({super.key});

  @override
  Widget build(BuildContext context) {
    double size = AppSize().getHeight() * .3;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DraggableWidget(
          timeToRest: timeToShowMessageInMill,
          child: ComparisonWidget(size,
              id: 'ComparisonWidget',
              name: '>',
              comparisonType: ComparisonType.greaterThen),
        ),
        DraggableWidget(
          timeToRest: timeToShowMessageInMill,
          child: ComparisonWidget(size,
              id: 'ComparisonWidget',
              name: '=',
              comparisonType: ComparisonType.equal),
        ),
        DraggableWidget(
          timeToRest: timeToShowMessageInMill,
          child: ComparisonWidget(size,
              id: 'ComparisonWidget',
              name: '<',
              comparisonType: ComparisonType.lessThen),
        ),
      ],
    );
  }
}
