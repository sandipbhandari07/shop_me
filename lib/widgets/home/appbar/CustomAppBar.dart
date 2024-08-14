import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/theme/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({Key? key})
      : preferredSize = Size.fromHeight(105.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
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
