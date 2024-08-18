import 'package:flutter/material.dart';
import '../../utils/system_ui_util.dart';

class CartScreen extends StatefulWidget {
  @override
  _HomescreenContentState createState() => _HomescreenContentState();
}

class _HomescreenContentState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();

    // Set the fixed system UI overlay styles for this screen
    SystemUiUtil.setSystemUIOverlay(
      statusBarColor: Colors.white, // Set the status bar color to white
      statusBarIconBrightness: Brightness.dark, // Dark icons for better visibility on white
      navigationBarColor: Colors.blue, // Set the navigation bar color to blue
      navigationBarIconBrightness: Brightness.light, // Light icons for better visibility on blue
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Your UI components here...
          ],
        ),
      ),
    );
  }
}
