import 'dart:math';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../helper/app_size.dart';
import '../widget/cus_text.dart';

class ScreenEight extends StatelessWidget {
  const ScreenEight({super.key});

  /* List<Offset> points = []; // List to store the drawn points

  void _handlePanStart(DragStartDetails details) {
    // Handle start of drawing
    points.add(details.globalPosition);
  }

  void _handlePanUpdate(DragUpdateDetails details) {
    // Handle drawing process
    points.add(details.globalPosition);
    setState(() {});
  }

  void _handlePanEnd(DragEndDetails details) {
    // Handle end of drawing
    // Check if the line is correct
    // Update game state accordingly
  }
*/
  @override
  Widget build(BuildContext context) {
    List<int> numbers = [];
    for (int i = 0; i < 4; i++) {
      var number = Random().nextInt(9) + 1;
      while (numbers.contains(number)) {
        number = Random().nextInt(9) + 1;
      }
      numbers.add(number);
    }

    List<int> numSh = [];
    numSh.addAll(numbers);
    numSh.shuffle();
    numbers.shuffle();
    var size = (AppSize().getHeight() - blockArea) / 2;
    var columnSpace = AppSize().getWidth() - (size * 4);
    return Stack(
      children: [
        GestureDetector(
          onPanUpdate: (up){
            dev.log('${up.delta}');
          },
          onPanStart: (st) {
            dev.log('${st}');
          },
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: columnSpace * .31),
            itemCount: 8,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: size,
              crossAxisSpacing: columnSpace, //column space
              mainAxisSpacing: 3,
              childAspectRatio: 2,
            ),
            itemBuilder: (con, i) {
              var nIndex = i ~/ 2;
              var sIndex = (i - 1) ~/ 2;
              return i % 2 == 0
                  ? NumberWidget(number: numSh[nIndex])
                  : ShapeWidget(number: numbers[sIndex]);
            },
          ),
        ),
      ],
    );
  }
}

class NumbersColumn extends StatelessWidget {
  const NumbersColumn({
    super.key,
    required this.children,
  });
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: children,
    );
  }
}

class NumberContainer extends StatelessWidget {
  const NumberContainer({
    super.key,
    required this.size,
    required this.child,
  });
  final double size;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size * 2,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black38,
          width: 3,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(5, 5),
          )
        ],
        gradient: const RadialGradient(
          tileMode: TileMode.mirror,
          radius: .7,
          colors: [
            Colors.greenAccent,
            Colors.green,
          ],
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: child,
    );
    ;
  }
}

class NumberWidget extends StatelessWidget {
  const NumberWidget({
    super.key,
    required this.number,
  });
  final int number;
  @override
  Widget build(BuildContext context) {
    var size = (AppSize().getHeight() - blockArea) / 4;
    return NumberContainer(
      size: size,
      child: customText('$number'),
    );
  }
}

class ShapeWidget extends StatelessWidget {
  const ShapeWidget({
    super.key,
    required this.number,
  });
  final int number;
  @override
  Widget build(BuildContext context) {
    var size = (AppSize().getHeight() - blockArea - (3 * 10)) / 3;
    var childSize = (size / 3) - 3;
    int ballNInFirst = 0;
    int ballNInMiddle = 0;
    int ballNInLast = 0;

    if (number == 4) {
      ballNInFirst = ballNInLast = 2;
    } else {
      int base = number ~/ 3;
      int remainder = number % 3;
      //dev.log('number is $number - base is : $base - remainder $remainder');
      ballNInFirst = base + (remainder > 1 ? 1 : 0);
      ballNInMiddle = base + (remainder == 1 ? 1 : 0);
      ballNInLast = base + (remainder > 1 ? 1 : 0);
    }
    return NumberContainer(
      size: size,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BallRow(number: ballNInFirst, size: childSize),
          BallRow(number: ballNInMiddle, size: childSize),
          BallRow(number: ballNInLast, size: childSize),
        ],
      ),
    );
  }
}

class BallRow extends StatelessWidget {
  const BallRow({
    super.key,
    required this.number,
    required this.size,
  });
  final int number;
  final double size;
  @override
  Widget build(BuildContext context) {
    return number == 0
        ? const SizedBox()
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              number,
              (index) => BallWidget(size: size),
            ),
          );
  }
}

class BallWidget extends StatelessWidget {
  const BallWidget({super.key, required this.size});
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 1),
            color: Colors.black26,
          )
        ],
        gradient: RadialGradient(
          colors: [
            Colors.orangeAccent,
            Colors.deepOrange,
          ],
          tileMode: TileMode.mirror,
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  final List<Offset> points;

  final Paint paintTo;

  MyCustomPainter(this.points)
      : paintTo = Paint()
          ..color = Colors.black
          ..strokeWidth = 3.0;

  @override
  void paint(Canvas canvas, Size size) {
    // Create a path to hold the line segments
    final path = Path();

    // Move to the first point
    if (points.isNotEmpty) {
      path.moveTo(points.first.dx, points.first.dy);
    }

    // Draw line segments between consecutive points
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }

    // Draw the path on the canvas
    canvas.drawPath(path, paintTo);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
/*Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NumbersColumn(
              children: List.generate(
                numbers.length,
                (index) => NumberWidget(number: numSh[index]),
              ),
            ),
            NumbersColumn(
              children: List.generate(
                numbers.length,
                (index) => ShapeWidget(number: numbers[index]),
              ),
            ),
          ],
        ),*/
