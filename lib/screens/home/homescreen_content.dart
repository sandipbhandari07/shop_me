import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wucommerce/utils/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.top, // Status bar
    SystemUiOverlay.bottom // Navigation bar
  ]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.red, // Change status bar color
    statusBarIconBrightness: Brightness.light, // For light icons
    systemNavigationBarColor: Colors.red, // Change navigation bar color
    systemNavigationBarIconBrightness: Brightness.light, // For light icons
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomescreenContent(),
    );
  }
}

class HomescreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85,
        backgroundColor: AppColors.blue_blue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: Container(
          height: 50,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(color: Colors.white, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16),
              minimumSize: Size(double.infinity, 50), // Adjusted minimum size
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'What would you like to buy?',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, size: 30, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(child: Text('Home Screen Content')),
    );
  }
}
