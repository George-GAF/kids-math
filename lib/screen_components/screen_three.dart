import 'package:flutter/material.dart';

import 'screen_complete_missing_number.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenCompleteMissingNumber(
      isAscending: true,
      min: 30,
      max: 60,
    );
  }
}
