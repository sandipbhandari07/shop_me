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
    SystemUiUtil.setSystemUIOverlay(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      navigationBarColor: Colors.transparent,
      navigationBarIconBrightness: Brightness.light,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
           
          ],
        ),
      ),
    );
  }
}
