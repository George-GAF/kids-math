import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wakelock/wakelock.dart';

import '../../helper/app_size.dart';
import '../cus_text.dart';

class AppMenuSetting extends StatelessWidget {
  const AppMenuSetting({super.key});

  @override
  Widget build(BuildContext context) {
    var height = AppSize().getHeight() * .6;
    var width = AppSize().getWidth() * .5;
    return AlertDialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(height * .1)),
      alignment: Alignment.center,
      title: SizedBox(
        height: height * .2,
        width: width * .9,
        child: Text(
          'Setting',
          // fontColor: const Color.fromARGB(255, 255, 0, 0),
        ),
      ),
      content: TextButton(
        onPressed: () {
          Wakelock.disable();
          SystemNavigator.pop();
        },
        child: Text('Exit'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: SizedBox(
            width: width * .2,
            height: height * .1,
            child: customText('Close'),
          ),
        ),
      ],
    );
  }
}
