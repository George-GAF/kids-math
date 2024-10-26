import 'package:flutter/material.dart';
import '../constant/constant.dart';
import '../helper/puzzles_class/shape_value_puzzle.dart';
import '../widget/cus_text.dart';
import '../widget/icon_image.dart';
import '../widget/screen_eight_widget/shapes_widget_row.dart';
import '../widget/screen_eight_widget/values_widget_row.dart';

List<Widget> icons = [
  childrenInColumn(colorAsNum()),
  customText('+ / -'),
  customText('< = >'),
  childrenInColumn(completeNumberChine('1 .. 3', '.. 4 5')),
  childrenInColumn(completeNumberChine('6 .. 4', '.. 2 1')),
  iconImage('${iconPath}Tetris.png'),
  customText('Click on Number'),
  _shapeValueIcon,
  colorAsNumberList(),
];
//----------------------------------------------------
var size = 14.0;
ShapeValuePuzzle shValue = ShapeValuePuzzle();

var _shapeValueIcon = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Expanded(
      child: ShapesWidgetRow(
        size: size,
        borderColor: Colors.black,
      ),
    ),
    Expanded(
      child: ValuesWidgetRow(
        length: shValue.getLen(),
        size: size,
        borderColor: Colors.black,
        color: Colors.white,
      ),
    ),
  ],
);
//-----------------------------------
//---------------------------Blue Print--------------------------------
Widget childrenInColumn(List<Widget> children) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: children,
  );
}

Widget childrenInRow(List<Widget> children) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: children,
  );
}

Expanded _textWithExpanded(String data) {
  return Expanded(
    child: customText(data),
  );
}

List<Widget> compereSign() {
  return [
    _textWithExpanded('>'),
    _textWithExpanded('='),
    _textWithExpanded('<'),
  ];
}

//--------------------------third icon---------------------------------
List<Widget> completeNumberChine(String one, String two) {
  return [
    _textWithExpanded(one),
    _textWithExpanded(two),
  ];
}

//-----------------------------------------------------------
//--------------------------Fourth icon---------------------------------
List<Widget> linkNumWithCount() {
  return [
    childrenInColumn(numList()),
    childrenInColumn(countList()),
  ];
}

List<Widget> numList() {
  return [
    _textWithExpanded("1"),
    _textWithExpanded("2"),
    _textWithExpanded("3"),
  ];
}

List<Widget> countList() {
  return [
    _textWithExpanded('  🔴🔴'),
    _textWithExpanded('🟣🟣🟣'),
    _textWithExpanded('     🟤'),
  ];
}

//-----------------------------------------------------------
//--------------------------Fifth icon---------------------------------
List<Widget> colorAsNum() {
  return [
    _textWithExpanded("3 + 1"),
    _textWithExpanded("⚫⚫⚫⚪"),
  ];
}

//-----------------------------------------------------------
//-----------------------------------------------------------
Widget colorAsNumberList() {
  return childrenInRow([
    colorAsNumberIcon(1, Colors.blue),
    colorAsNumberIcon(2, Colors.red),
    colorAsNumberIcon(3, Colors.green),
  ]);
}

Widget colorAsNumberIcon(int num, Color color) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 5,
            offset: Offset(3, 3),
          )
        ],
      ),
      child: customText(
        num.toString(),
      ),
    ),
  );
}

//-----------------------------------------------------------

//-----------------------------------------------------------
/*
* ⭕⚪⚫🔴🔵🟢🟡🟠🟣🟤
* */
