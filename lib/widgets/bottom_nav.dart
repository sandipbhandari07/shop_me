import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:wucommerce/utils/theme/theme.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    required this.selectedIndex,
    required this.onItemTapped,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final activeColor = AppColors.blue_blue;
    final inactiveColor = AppColors.dimblack;
    final iconSize = 30.0;
    final fontSize = 15.0;

    return Container(
      height: 55.0,
      child: FlashyTabBar(
        selectedIndex: selectedIndex,
        showElevation: true,
        onItemSelected: onItemTapped,
        items: [
          _buildTabItem(
            icon: Icons.home,
            label: 'Home',
            index: 0,
            selectedIndex: selectedIndex,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            iconSize: iconSize,
            fontSize: fontSize,
          ),
          _buildTabItem(
            icon: Icons.category,
            label: 'Category',
            index: 1,
            selectedIndex: selectedIndex,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            iconSize: iconSize,
            fontSize: fontSize,
          ),
          _buildTabItem(
            icon: Icons.shopping_cart,
            label: 'Cart',
            index: 2,
            selectedIndex: selectedIndex,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            iconSize: iconSize,
            fontSize: fontSize,
          ),
          _buildTabItem(
            icon: Icons.favorite,
            label: 'Wishlist',
            index: 3,
            selectedIndex: selectedIndex,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            iconSize: iconSize,
            fontSize: fontSize,
          ),
          _buildTabItem(
            icon: Icons.person,
            label: 'Profile',
            index: 4,
            selectedIndex: selectedIndex,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            iconSize: iconSize,
            fontSize: fontSize,
          ),
        ],
      ),
    );
  }

  FlashyTabBarItem _buildTabItem({
    required IconData icon,
    required String label,
    required int index,
    required int selectedIndex,
    required Color activeColor,
    required Color inactiveColor,
    required double iconSize,
    required double fontSize,
  }) {
    return FlashyTabBarItem(
      icon: Icon(
        icon,
        color: selectedIndex == index ? activeColor : inactiveColor,
        size: iconSize,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: selectedIndex == index ? activeColor : inactiveColor,
          fontSize: fontSize,
        ),
      ),
      activeColor: activeColor,
      inactiveColor: inactiveColor,
    );
  }
}
