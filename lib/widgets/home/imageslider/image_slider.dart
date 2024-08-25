import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wucommerce/utils/theme/theme.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ImageSlider extends StatefulWidget {
  final Function(int) onChange;
  final int currentSlide;

  const ImageSlider({
    super.key,
    required this.currentSlide,
    required this.onChange,
  });

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  late PageController _pageController;
  late Timer _timer;
  List<dynamic> banners = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoSlide();
    _fetchBannerData();
  }

  Future<void> _fetchBannerData() async {
    final response = await http.get(Uri.parse('https://inventory.anoopinnovations.com/api/customer/banner'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        banners = data['data'];
      });
    } else {
      print('Failed to load banners');
    }
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      int nextPage = (widget.currentSlide + 1) % (banners.isNotEmpty ? banners.length : 1);
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      widget.onChange(nextPage);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return banners.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Stack(
      children: [
        SizedBox(
          height: 140,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true,
              onPageChanged: widget.onChange,
              physics: const ClampingScrollPhysics(),
              itemCount: banners.length,
              itemBuilder: (context, index) {
                return Image.network(
                  banners[index]['image'],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Text('Image not available'),
                  ),
                );
              },
            ),
          ),
        ),
        Positioned.fill(
          bottom: 15,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                banners.length,
                    (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: widget.currentSlide == index ? 15 : 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: widget.currentSlide == index
                        ? AppColors.blue_blue
                        : Colors.white,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
