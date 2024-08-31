import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'constant/constant.dart';
import 'helper/app_size.dart';
import 'provider/active_screen.dart';
import 'provider/board_provider.dart';
import 'provider/screen_eight_controller.dart';
import 'provider/screen_five_controller.dart';
import 'provider/screen_nine_controller.dart';
import 'provider/screen_one_controller.dart';
import 'provider/massage_provider.dart';
import 'provider/screen_seven_controller.dart';
import 'provider/screen_two_controller.dart';
import 'provider/state_mange/create_data.dart';
import 'provider/state_mange/update_ui.dart';
import 'screen/home_screen.dart';
import 'screen/land_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [],
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ActiveScreen()),
      ChangeNotifierProvider(create: (_) => MassageProvider()),
      ChangeNotifierProvider(create: (_) => BoardProvider()),
      ChangeNotifierProvider(create: (_) => ScreenOneController()),
      ChangeNotifierProvider(create: (_) => ScreenTwoController()),
      ChangeNotifierProvider(create: (_) => ScreenFiveController()),
      ChangeNotifierProvider(create: (_) => ScreenSevenController()),
      ChangeNotifierProvider(create: (_) => ScreenEightController()),
      ChangeNotifierProvider(create: (_) => ScreenNineController()),
      ChangeNotifierProvider(create: (_) => CreateData()),
      ChangeNotifierProvider(create: (_) => UpdateUi()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Future<InitializationStatus> _initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }

  @override
  Widget build(BuildContext context) {
    AppSize().readScreenSize(MediaQuery.of(context).size.height - blockArea,
        MediaQuery.of(context).size.width);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Math For Kids',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        builder: (context, builder) {
          return const LandingScreen();
        },
        future: _initGoogleMobileAds(),
      ),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}
