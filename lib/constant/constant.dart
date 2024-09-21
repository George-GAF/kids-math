import 'package:flutter/material.dart';

const wordPath = 'assets/images/word/';
const backgroundPath = 'assets/images/background/';
const iconPath = 'assets/images/icon/';

const numberOfMainIcon = 9;
const columnNumber = 3;
const blockArea = 60.0;
const timeToShowMessageInMill = 1500;
const numberCellForCompleteMissingNumber = 24;

const paddingSF = 5.0;
const marginSF = 3.0;
const widthBSF = 3.0;

const timeToMoveBalloonNumber = 700;
const balloonNumber = 25;
const distanceToTopBalloonNumber = 35;
ScrollController controller = ScrollController();
//---------------------------------------
// Screen Nine


//-----------------------------------------
//--------------------------------
/* Screen one */

const double operationPartPer = .17;
const double questionPartPer = 1 - (operationPartPer + answerPartPer);
const double answerPartPer = .58;
//-------------------------------

const String explainMassage =
    'Pull the shapes up from the right and drop them into the right-side void, arranging them to mirror the colorful geometry of the mini-figure on the left.';

List<String> backgroundName = [
  'background.jpeg',
  'backGround5.jpeg',
  'backGround1.jpeg',
  'backGround2.jpeg',
  'backGround3.jpeg',
  'backGround4.jpeg',
  'backGround6.jpeg',
  'backGround7.jpeg',
  'backGround8.jpeg',
  'backGround9.jpeg',
];
List<Color> buttonColor = [
  const Color(0XFFF0FF9A),
  const Color(0XFFBAE033),
  const Color(0XFF9AD80B),
  const Color(0XFF9AD80B),
];

List<List<Color>> iconsColors = [
  [
    const Color(0XFFBAE5D2),
    const Color(0XFF89D8C3),
    const Color(0XFF71D3C0),
    const Color(0XFF71D3C0),
  ],
  [
    const Color(0XFFE9B6D3),
    const Color(0XFFE39DC5),
    const Color(0XFFE095BE),
    const Color(0XFFE095BE),
  ],
  [
    const Color(0XFFF0FF9A),
    const Color(0XFFBAE033),
    const Color(0XFF9AD80B),
    const Color(0XFF9AD80B),
  ],
  [
    Colors.blue[200]!,
    Colors.blue[300]!,
    Colors.blue[500]!,
    Colors.blue[500]!,
  ],
  [
    Colors.blue[200]!,
    Colors.blue[300]!,
    Colors.blue[500]!,
    Colors.blue[500]!,
  ],
  [
    Colors.blue[200]!,
    Colors.blue[300]!,
    Colors.blue[500]!,
    Colors.blue[500]!,
  ],
  [
    Colors.blue[200]!,
    Colors.blue[300]!,
    Colors.blue[500]!,
    Colors.blue[500]!,
  ],
  [
    Colors.blue[200]!,
    Colors.blue[300]!,
    Colors.blue[500]!,
    Colors.blue[500]!,
  ],
  [
    Colors.blue[200]!,
    Colors.blue[300]!,
    Colors.blue[500]!,
    Colors.blue[500]!,
  ],
];
