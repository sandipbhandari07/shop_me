import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemUiUtil {
  // Method to set custom system UI overlay styles
  static void setSystemUIOverlay({
    required Color statusBarColor,
    required Brightness statusBarIconBrightness,
    required Color navigationBarColor,
    required Brightness navigationBarIconBrightness,
  }) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarIconBrightness: statusBarIconBrightness,
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: navigationBarIconBrightness,
      ),
    );
  }
}
