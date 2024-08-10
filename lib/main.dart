import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wucommerce/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // Hides the mobile navigation buttons and notification bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
