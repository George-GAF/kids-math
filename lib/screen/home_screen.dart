import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../constant/constant.dart';
import '../provider/active_screen.dart';
import '../widget/app_screen.dart';
import '../widget/main_menu.dart';
import '../widget/top_part.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/homeScreen';
  // List of widgets for the main content area
  final List<Widget> _widgetOptions = const [
    MainMenu(),
    AppScreen()
    // Add more widgets as needed
  ];

  @override
  Widget build(BuildContext context) {
    _adjustScreen();
    int selectedIndex = context.watch<ActiveScreen>().selectedIndex;
    int backGroundIndex = context.watch<ActiveScreen>().backGroundIndex;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('$backgroundPath${backgroundName[backGroundIndex]}'),
            fit:BoxFit.fill,
          ),
        ) ,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TopPart(),
              Expanded(
                child: _widgetOptions[selectedIndex],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


void _adjustScreen(){
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

}