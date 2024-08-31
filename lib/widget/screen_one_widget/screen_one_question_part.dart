
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../constant/enum_file.dart';
import '../../provider/screen_one_controller.dart';
import '../cus_text.dart';

class QuestionPart extends StatelessWidget {
  const QuestionPart({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<ScreenOneController>();
    var h = (MediaQuery.of(context).size.height - blockArea) * questionPartPer;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: h / 1.5,
          child: customText(provider.activeOperation.value),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: h / 2,
                child: customText('${provider.question[0]}'),
              ),
              SizedBox(
                height: h / 2,
                child: customText('${provider.question[1]}'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
