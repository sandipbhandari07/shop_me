import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceUtility {
  static void hidekeyboard(BuildContext context){
    FocusScope.of(context).requestFocus(FocusNode());
  }
  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }
  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  static void setFulScreen(bool enable){
    SystemChrome.setEnabledSystemUIMode(enable? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  static double getAppbarHeight() {
    return kToolbarHeight;
  }

}