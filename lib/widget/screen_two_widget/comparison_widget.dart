import 'package:flutter/material.dart';

import '../../constant/enum_file.dart';
import '../cus_text.dart';
import '../../helper/draggable_item.dart';

class ComparisonWidget extends DraggableItem {
  const ComparisonWidget(
    this.size, {
    required String name,
    required String id,
    required this.comparisonType,
    super.key,
  }) : super(name: name, id: id);

  final ComparisonType comparisonType;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * .1),
      ),
      child: customText(comparisonType.value),
    );
  }
}
