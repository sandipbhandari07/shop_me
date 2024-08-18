import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wucommerce/screens/splash/splash_screen.dart';
import 'package:wucommerce/utils/theme/font_theme/font_theme.dart';
import 'package:wucommerce/utils/theme/theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
