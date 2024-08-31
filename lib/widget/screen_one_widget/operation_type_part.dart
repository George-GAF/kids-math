
import 'package:flutter/material.dart';

import '../../constant/enum_file.dart';
import 'switch_operation.dart';

class OperationTypePart extends StatelessWidget {
  const OperationTypePart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        switchOperation(context, OperationType.add),
        switchOperation(context, OperationType.minus),
      ],
    );
  }
}
