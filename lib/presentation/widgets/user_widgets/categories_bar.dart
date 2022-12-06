import 'package:flutter/material.dart';
import 'package:waroengku/domain/entity/category.dart';
import 'package:waroengku/presentation/widgets/user_widgets/category_item.dart';

class CategoriesBar extends StatelessWidget {
  List<Category> categories;
  CategoriesBar({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...categories.map((e) => CategoryItem(category: e)),
            ...categories.map((e) => CategoryItem(category: e)),
            ...categories.map((e) => CategoryItem(category: e)),
            ...categories.map((e) => CategoryItem(category: e)),
          ],
        ),
      ),
    );
  }
}
