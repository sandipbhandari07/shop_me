import 'package:flutter/material.dart';
import 'package:wucommerce/screens/search/search_screen.dart';
import 'dart:async'; // Import for Timer
import '../../../utils/theme/theme.dart'; // Update with your correct import

class MySearchBAR extends StatefulWidget {
  const MySearchBAR({super.key});

  @override
  _MySearchBARState createState() => _MySearchBARState();
}

class _MySearchBARState extends State<MySearchBAR> {
  late Timer _timer;
  late String _hintText;
  final List<String> _suggestions = [
    "Search...",
    "Discover more...",
    "Search for items...",
    "What are you looking for?",
    "Browse for products...",
    "Enter keywords...",
    "Find your favorite...",
    "Type to search...",
    "What can we help you find?",
    "Search here...",
    "Look for deals...",
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _hintText = _suggestions[_currentIndex];
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _suggestions.length;
        _hintText = _suggestions[_currentIndex];
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _navigateToAnotherPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SearchScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _navigateToAnotherPage,
      child: Container(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kcontentColor,
          border: Border.all(width: 2,
            color: AppColors.blue_blue,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: Colors.black,
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                readOnly: true,
                onTap: _navigateToAnotherPage,
                decoration: InputDecoration(
                  hintText: _hintText,
                  border: InputBorder.none,

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
