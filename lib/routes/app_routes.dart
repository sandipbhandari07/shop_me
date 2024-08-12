import 'package:flutter/material.dart';
import '../screens/home/homepage_screen.dart';
import '../screens/auth/loginpage_screen.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/search/search_screen.dart';
import '../screens/wishlist/wishlist_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/home': (context) => HomeScreen(),
  '/login': (context) => LoginPageScreen(),
  '/cart': (context) => CartScreen(),
  '/profile': (context) => ProfileScreen(),
  '/search': (context) => SearchScreen(),
  '/wishlist': (context) => WishlistScreen(),
};
