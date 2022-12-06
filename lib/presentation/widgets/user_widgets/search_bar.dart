import 'package:flutter/material.dart';
import 'package:waroengku/domain/entity/category.dart';
import 'package:waroengku/share/styles/colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
          fillColor: Colors.grey[100],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(width: 0.8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              width: 2,
              color: Colors.grey,
            ),
          ),
          hintText: "Search",
          prefixIcon: const Icon(
            Icons.search,
            size: 20,
          ),
          suffixIcon:
              IconButton(icon: const Icon(Icons.clear), onPressed: () {}),
        ),
      ),
    );
  }
}
