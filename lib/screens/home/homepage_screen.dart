import 'package:flutter/material.dart';
import 'package:wucommerce/screens/cart/cart_screen.dart';
import 'package:wucommerce/screens/home/homescreen_content.dart';
import 'package:wucommerce/screens/profile/profile_screen.dart';
import 'package:wucommerce/screens/search/search_screen.dart';
import 'package:wucommerce/screens/wishlist/wishlist_screen.dart';
import '../../services/auth_services.dart';
import '../../widgets/bottom_nav.dart';
import '../auth/loginpage_screen.dart';

class HomeScreen extends StatefulWidget {
  final bool isGuest;
  const HomeScreen({Key? key, this.isGuest = false}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _username = '';
  String _userEmail = '';
  bool _isLoading = true;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    setState(() {
      _isLoading = true;
    });

    // Fetch user data from AuthService if not a guest
    if (!widget.isGuest) {
      _username = await AuthService.getUsername();
      _userEmail = await AuthService.getUserEmail();
    }

    setState(() {
      _isLoading = false;
    });
  }

  List<Widget> get _screens => [
    HomescreenContent(),
    SearchScreen(),
    CartScreen(),
    WishlistScreen(),
    widget.isGuest
        ? Container() // Empty container if in guest mode
        : ProfileScreen(
      finalUsername: _username,
      finalEmail: _userEmail,
    ),
  ];

  void _onItemTapped(int index) {
    if (index == 4 && widget.isGuest) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPageScreen(fromGuestMode: true),
        ),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 4 && widget.isGuest) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPageScreen(fromGuestMode: true),
            ),
          );
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : _screens[_selectedIndex],
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
