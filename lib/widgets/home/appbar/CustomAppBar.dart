import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/system_ui_util.dart';
import '../../../utils/theme/theme.dart';
import '../searchbar/search_bar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const CustomAppBar({super.key})
      : preferredSize = const Size.fromHeight(55.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13.5, horizontal: 1.0),
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            style: IconButton.styleFrom(
           //   backgroundColor: AppColors.white,
              padding: const EdgeInsets.all(5),
            ),
            onPressed: () {},
            iconSize: 30,
            icon: const Icon(Icons.menu, color: Colors.black),
          ),
          const SizedBox(width: 0,),
          const Expanded(
            child: MySearchBAR(),
          ),
          IconButton(
            style: IconButton.styleFrom(
             // backgroundColor: AppColors.white,
              padding: const EdgeInsets.all(5),
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
