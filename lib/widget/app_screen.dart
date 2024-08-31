import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/active_screen.dart';
import '../screen_components/screen_content.dart';

class AppScreen extends StatelessWidget {

  const AppScreen({ super.key});

  @override
  Widget build(BuildContext context) {
    var index = context.watch<ActiveScreen>().contentIndex;
    return contentList[index];
  }
}
