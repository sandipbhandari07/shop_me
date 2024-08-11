import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:wucommerce/screens/onboarding/onboardingscreen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return AnimatedSplashScreen(
      splash: Center(
        child: Lottie.asset('assets/animation/shop.json'),
      ),
      nextScreen:  Onboardingscreen(),
      duration: 5000,
      splashIconSize: 200,
      backgroundColor: Colors.white,
    );
  }
}
