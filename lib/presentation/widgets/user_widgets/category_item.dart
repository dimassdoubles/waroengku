
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Text(
        "Sembako",
        style: TextStyle(
            color: Colors.black,
            fontSize: 12.0,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
    );
  }
}
