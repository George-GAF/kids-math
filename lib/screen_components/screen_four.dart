
import 'package:flutter/material.dart';

import 'screen_complete_missing_number.dart';


class ScreenFour extends StatelessWidget {
  const ScreenFour({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenCompleteMissingNumber(
      isAscending: false,
      min: 60,
      max: 90,
    );
  }
}
