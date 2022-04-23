import 'package:infovalorant/util/colors.dart';
import 'package:infovalorant/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
            backgroundColor: CoreColors.colorPrimary,
            splash: 'assets/valorant_splash.png',
            nextScreen: MaterialApp(
                debugShowCheckedModeBanner: false, home: HomePage()),
            splashIconSize: 150,
            duration: 1500,
            animationDuration: const Duration(seconds: 0)));
  }
}
