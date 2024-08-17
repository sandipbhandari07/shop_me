import 'package:flutter/material.dart';
import 'package:wucommerce/widgets/home/product/product_card.dart';
import '../../models/product_model.dart';
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MySearchBAR(),
              const SizedBox(height: 20),
              SizedBox(
                height: 220,
                child: ImageSlider(
                  currentSlide: _currentSlide,
                  onChange: _onSlideChange,
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Categories",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'sfpro',
                  ),
                ),
              ),
              const SizedBox(height: 5),
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
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2
                  ,childAspectRatio: 0.78,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                return ProductCard(product: products[index],
                );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
