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
      color: AppColors.nav_color_back,
      buttonBackgroundColor: AppColors.nav_color_back,
      backgroundColor: Colors.transparent,
      onTap: onItemTapped,
      animationDuration: Duration(milliseconds: 200),
    );
  }

  Widget _buildNavItem(String imagePath, String label, int index) {
    bool isSelected = selectedIndex == index;

    return Container(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: isSelected ? 2 : 4),
          Image.asset(
            imagePath,
            width: 30,
            height: 30,
            color: Colors.black,
          ),
          if (isSelected)
            Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
        ],
      ),
    );
  }
}
