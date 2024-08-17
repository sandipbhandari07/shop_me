import 'package:flutter/material.dart';
import '../../../models/category_model.dart';


class CategoryView extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onCategorySelected;

  const CategoryView({
    Key? key,
    required this.selectedIndex,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              widget.onCategorySelected(index);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),

              ),
              child: Column(
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(categoriesList[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    categoriesList[index].title,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
