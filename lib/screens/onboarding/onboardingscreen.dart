import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/theme/theme.dart';
import '../splash/welcomepage_screen.dart';


class Onboardingscreen extends StatefulWidget {

  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {

  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void navigateToNextScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
    );
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return Scaffold(
      backgroundColor: _getPageColor(_pageIndex),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (_pageIndex != onboard_data.length - 1)
                  TextButton(
                    onPressed: () {
                      _pageController.animateToPage(
                        onboard_data.length - 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'RobotoMono',
                      ),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: PageView.builder(
                itemCount: onboard_data.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnBoardContent(
                  image: onboard_data[index].image,
                  title: onboard_data[index].title,
                  description: onboard_data[index].description,
                ),
                physics: ClampingScrollPhysics(),
              ),
            ),
            Row(
              children: [
                ...List.generate(
                  onboard_data.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(left: 16.0, bottom: 20.0), // Increased padding
                    child: DotIndicator(
                      isActive: index == _pageIndex,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, bottom: 20.0), // Moved arrow upward
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_pageIndex == onboard_data.length - 1) {
                          navigateToNextScreen(context);
                        } else {
                          _pageController.nextPage(
                            curve: Curves.ease,
                            duration: const Duration(milliseconds: 300),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.white,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/arrow.svg",
                        color: _getPageColor(_pageIndex),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Color _getPageColor(int index) {
    switch (index) {
      case 0:
        return AppColors.page1;
      case 1:
        return AppColors.page2;
      case 2:
        return AppColors.page3;
      default:
        return Colors.black;
    }
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
    required this.color,
  }) : super(key: key);

  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: isActive ? 12 : 4,
        width: 4,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboard> onboard_data = [
  Onboard(
    image: "assets/images/markets.png",
    title: "Search Products",
    description:
    "High-quality product designed to enhance your daily healthy life with ease and efficiency.",
  ),
  Onboard(
    image: "assets/images/carts.png",
    title: "Add to Cart",
    description:
    "Add to Cart for a premium product that combines quality, convenience and unbeatable performance.",
  ),
  Onboard(
    image: "assets/images/payments.png",
    title: "Secure Payment",
    description:
    "Secure your purchase with fast, reliable payment options for a seamless checkout experience.",
  ),
];

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 250,
          fit: BoxFit.contain,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.w100,
              color: Colors.white,
              fontFamily: 'MontseBold'),
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Montse',
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
