import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/theme/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const CustomAppBar({super.key})
      : preferredSize = const Size.fromHeight(105.0);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: AppColors.white,
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {},
            icon: Image.asset(
              "assets/images/icon.png",
              height: 20,
            ),
          ),
          // Centered logo
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Shop',
                  style: TextStyle(
                    color: AppColors.blue_blue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'sfpro',
                  ),
                ),
                TextSpan(
                  text: 'Me',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'sfpro',
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: AppColors.white,
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {},
            iconSize: 30,
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
