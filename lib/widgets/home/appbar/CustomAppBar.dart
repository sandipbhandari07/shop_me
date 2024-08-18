import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/system_ui_util.dart';
import '../../../utils/theme/theme.dart';
import '../searchbar/search_bar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const CustomAppBar({super.key})
      : preferredSize = const Size.fromHeight(55.0);

  @override
  Widget build(BuildContext context) {
      // Set the fixed system UI overlay styles for this screen
      SystemUiUtil.setSystemUIOverlay(
        statusBarColor: Colors.white, // Set the status bar color to white
        statusBarIconBrightness: Brightness.dark, // Dark icons for better visibility on white
        navigationBarColor: AppColors.blue_blue, // Set the navigation bar color to blue
        navigationBarIconBrightness: Brightness.light, // Light icons for better visibility on blue
      );


    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            style: IconButton.styleFrom(
           //   backgroundColor: AppColors.white,
              padding: const EdgeInsets.all(5),
            ),
            onPressed: () {},
            icon: Image.asset(
              "assets/images/icon.png",
              height: 20,
            ),
          ),
          const SizedBox(width: 0,),
          const Expanded(
            child: MySearchBAR(),
          ),
          IconButton(
            style: IconButton.styleFrom(
             // backgroundColor: AppColors.white,
              padding: const EdgeInsets.all(5),
            ),
            onPressed: () {},
            iconSize: 30,
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
