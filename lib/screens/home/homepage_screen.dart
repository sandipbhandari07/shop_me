import 'package:flutter/material.dart';
import 'package:wucommerce/screens/cart/cart_screen.dart';
import 'package:wucommerce/screens/home/homescreen_content.dart';
import 'package:wucommerce/screens/profile/profile_screen.dart';
import 'package:wucommerce/screens/search/search_screen.dart';
import 'package:wucommerce/screens/wishlist/wishlist_screen.dart';
import '../../widgets/bottom_nav.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomescreenContent(),
    SearchScreen(),
    CartScreen(),
    WishlistScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
