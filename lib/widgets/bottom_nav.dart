import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'package:wucommerce/utils/theme/theme.dart';

import '../utils/system_ui_util.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  BottomNavBar({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {

      // Set the fixed system UI overlay styles for this screen
      SystemUiUtil.setSystemUIOverlay(
        statusBarColor: Colors.white, // Set the status bar color to white
        statusBarIconBrightness: Brightness.dark, // Dark icons for better visibility on white
        navigationBarColor: AppColors.blue_blue, // Set the navigation bar color to blue
        navigationBarIconBrightness: Brightness.light, // Light icons for better visibility on blue
      );

    return  CurvedNavigationBar(
        color: AppColors.blue_blue,
        backgroundColor: Colors.transparent,
        onTap: onItemTapped,
        animationDuration: const Duration(milliseconds: 400),
        index: selectedIndex,
        height: 55.0,
        items: <Widget>[
          _buildNavItem('assets/images/navbar/home.png', 'Home', 0),
          _buildNavItem('assets/images/navbar/caty.png', 'Category', 1),
          _buildNavItem('assets/images/navbar/cart.png', 'Cart', 2),
          _buildNavItem('assets/images/navbar/heart.png', 'Wishlist', 3),
          _buildNavItem('assets/images/navbar/user.png', 'Profile', 4),
        ],
    );
  }

  Widget _buildNavItem(String imagePath, String label, int index) {
    bool isSelected = selectedIndex == index;

    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.transparent : AppColors.blue_blue,
        shape: BoxShape.circle,
      ),
      width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: isSelected ? 2 : 6),
          Image.asset(
            imagePath,
            width: 24,
            height: 24,
            color: isSelected ? AppColors.white : Colors.white,
          ),
        ],
      ),
    );
  }
}
