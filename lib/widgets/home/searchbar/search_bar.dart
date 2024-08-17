import 'package:flutter/material.dart';
import '../../../utils/theme/theme.dart';

class MySearchBAR extends StatelessWidget {
  const MySearchBAR({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kcontentColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Colors.black,
            size: 30,
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search...", border: InputBorder.none),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            height: 25,
            width: 1.5,
            color: AppColors.dimwhite,
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.tune,
              color: AppColors.blue_blue,
            ),
          ),
        ],
      ),
    );
  }
}
