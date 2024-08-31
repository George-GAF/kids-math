
import 'package:flutter/material.dart';
import '../constant/constant.dart';
import 'card3d.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 30,
            ),
            child: GridView.builder(
              itemCount: numberOfMainIcon,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columnNumber,
                crossAxisSpacing: 60, //column space
                mainAxisSpacing: 15,
                childAspectRatio: numberOfMainIcon / columnNumber,
              ),
              itemBuilder: (cont, i) {
                return Card3D(i);
              },
            ),
          ),
        ),
      ],
    );
  }
}
