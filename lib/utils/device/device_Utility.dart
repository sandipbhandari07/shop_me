import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../system_ui_util.dart';

class DeviceUtility {
  static void hidekeyboard(BuildContext context){
    FocusScope.of(context).requestFocus(FocusNode());
  }
static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }
  static bool isPortraitOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  static double getAppbarHeight() {
    return kToolbarHeight;
  }


  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('host');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }


  static bool isIOS() {
    return Platform.isIOS;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

}