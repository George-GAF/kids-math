import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/constant.dart';
import '../provider/massage_provider.dart';
import '../widget/message_image.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        context.watch<MassageProvider>().isAnimDone
            ? const SizedBox()
            : const MessageImage(
                imagePath: '${wordPath}EXCELLENT.png',
              ),
      ],
    );
  }
}
