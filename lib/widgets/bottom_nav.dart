import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:wucommerce/utils/theme/theme.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  BottomNavBar({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: selectedIndex,
      height: 60.0,
      items: <Widget>[
        _buildNavItem('assets/images/navbar/home.png', 'Home', 0),
        _buildNavItem('assets/images/navbar/caty.png', 'Category', 1),
        _buildNavItem('assets/images/navbar/cart.png', 'Cart', 2),
        _buildNavItem('assets/images/navbar/heart.png', 'Wishlist', 3),
        _buildNavItem('assets/images/navbar/user.png', 'Profile', 4),
      ],
      color: AppColors.blue_blue,
      buttonBackgroundColor: AppColors.blue_blue,
      backgroundColor: Colors.transparent,
      onTap: onItemTapped,
      animationDuration: const Duration(milliseconds: 200),
    );
  }

  Widget _buildNavItem(String imagePath, String label, int index) {
    bool isSelected = selectedIndex == index;

    return SizedBox(
      width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: isSelected ? 2 : 6),
          Image.asset(
            imagePath,
            width: 24,
            height: 24,
            color: isSelected ? AppColors.white : Colors
                .white,
          ),
          if (isSelected)
            Column(
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'sfpro',
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}