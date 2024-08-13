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
        _buildNavItem(Icons.home, 'Home', 0),
        _buildNavItem(Icons.search, 'Search', 1),
        _buildNavItem(Icons.shopping_cart, 'Cart', 2),
        _buildNavItem(Icons.favorite, 'Wishlist', 3),
        _buildNavItem(Icons.person, 'Profile', 4),
      ],
      color: AppColors.nav_color_back,
      buttonBackgroundColor: AppColors.nav_color_back,
      backgroundColor: Colors.transparent,
      onTap: onItemTapped,
      animationDuration: Duration(milliseconds: 300),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = selectedIndex == index;

    return Container(
      width: 100, // Adjust based on your design requirements
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: isSelected ? 4 : 8), // Adjusts vertical position
          Icon(
            icon,
            size: 30,
            color: AppColors.blue_blue,
          ),
          if (isSelected)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                label,
                style: TextStyle(
                  color: AppColors.blue_blue,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
