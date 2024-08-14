import 'package:flutter/material.dart';
import '../../widgets/home/appbar/CustomAppBar.dart';
import '../../widgets/home/imageslider/image_slider.dart';
import '../../widgets/home/searchbar/search_bar.dart';
import '../../widgets/home/category/category_view.dart';
import '../../widgets/home/special_section.dart';


class HomescreenContent extends StatefulWidget {
  @override
  _HomescreenContentState createState() => _HomescreenContentState();
}

class _HomescreenContentState extends State<HomescreenContent> {
  int _currentSlide = 0;
  int _selectedIndex = 0;

  void _onSlideChange(int index) {
    setState(() {
      _currentSlide = index;
    });
  }

  void _onCategorySelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MySearchBAR(),
            const SizedBox(height: 20),
            SizedBox(
              height: 220,
              child: ImageSlider(
                currentSlide: _currentSlide,
                onChange: _onSlideChange,
              ),
            ),
            const SizedBox(height: 20),
            CategoryView(
              selectedIndex: _selectedIndex,
              onCategorySelected: _onCategorySelected,
            ),
            const SizedBox(height: 5),
            if (_selectedIndex == 0)
              SpecialSection(
                title: "Special For You",
                actionText: "See all",
                onActionTap: () {

                },
              ),
            // Add more widgets below as needed
          ],
        ),
      ),
    );
  }
}
