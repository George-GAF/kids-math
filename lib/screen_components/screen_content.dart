import 'package:flutter/material.dart';
import 'base_screen.dart';
import 'screen_eight.dart';
import 'screen_five.dart';
import 'screen_four.dart';
import 'screen_nine.dart';
import 'screen_one.dart';
import 'screen_seven.dart';
import 'screen_six.dart';
import 'screen_three.dart';
import 'screen_two.dart';

List<Widget> contentList = [
  const ScreenFive(),
  const ScreenOne(),
  const ScreenTwo(),
  const ScreenThree(),
  const ScreenFour(),
  const ScreenSix(),
  const BaseScreen(child: ScreenSeven()),
  const BaseScreen(child: ScreenEight()),
  const BaseScreen(child: ScreenNine()),
];



