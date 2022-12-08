import 'package:flutter/material.dart';
import '../../../domain/entity/category.dart';
import '../../../domain/usecases/string_extension.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:  12.0),
      child: Text(
        category.name.removeCategoryPrevix(),
        style: const TextStyle(
            color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
    );
  }
}
