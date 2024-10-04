import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../helper/sound_manager.dart';

class MenuButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double width;
  final Color shadowColorLight;
  final Color shadowColorDark;
  final Widget child;
  final List<Color> colors;

  const MenuButton({
    super.key,
    required this.onPressed,
    required this.width,
    this.child = const SizedBox(),
    this.shadowColorLight = Colors.black26,
    this.shadowColorDark = Colors.black87,
    this.colors = const [],
  });

  @override
  Widget build(BuildContext context) {
    var shadowOffsetValue = width * .005;
    return TextButton(
      onPressed: (){
        SoundManager.sound.playSound(click);
        onPressed();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * .1),
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColorDark.withOpacity(0.8),
              offset: Offset(shadowOffsetValue, shadowOffsetValue),
              blurRadius: 10,
            ),
            BoxShadow(
              color: shadowColorLight.withOpacity(0.8),
              offset: Offset(-shadowOffsetValue, -shadowOffsetValue),
              blurRadius: 10,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
          vertical: width * .03,
          horizontal: width * .1,
        ),
        child: child,
      ),
    );
  }
}

class TextButtonMenu extends StatelessWidget {
  const TextButtonMenu(
    this.text, {
    super.key,
    required this.width,
    this.fontColor = Colors.white,
  });

  final String text;
  final double width;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: _buttonMenuTextStyle(width, fontColor),
    );
  }
}

TextStyle _buttonMenuTextStyle(double width, Color fontColor) {
  var fontSize = width * .05;
  var shadowOffsetValue = fontSize * .1;
  return TextStyle(

    fontSize: width * .05,
    fontWeight: FontWeight.bold,
    color: fontColor,
    shadows: [
      Shadow(
        color: Colors.black.withOpacity(0.4),
        offset: Offset(shadowOffsetValue, shadowOffsetValue),
        blurRadius: 2,
      ),
    ],
  );
}
