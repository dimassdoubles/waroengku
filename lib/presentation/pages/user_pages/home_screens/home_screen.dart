import 'package:flutter/material.dart';
import 'package:waroengku/data/data_sources/category/remote_data_source.dart';
import 'package:waroengku/data/repositories/category_repository_impl.dart';
import 'package:waroengku/domain/repositories/category_repository.dart';
import 'package:waroengku/domain/usecases/get_categories.dart';

import '../../../widgets/user_widgets/category_item.dart';
import '../../../widgets/user_widgets/product_item.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Header(),
        const SearchBar(),
        const Categories(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            runSpacing: 16,
            children: const [
              ProductItem(),
              ProductItem(),
              ProductItem(),
            ],
          ),
        ),
      ],
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            CategoryItem(),
            CategoryItem(),
          ],
        ),
      ),
    );
  }
}

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
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(width: 0.8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              width: 0.8,
              color: Theme.of(context).primaryColor,
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

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.all(7.0),
            child: Text(
              "Hallo, \nJessica Sandra",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          Image.asset(
            "images/Shopping cart.jpg",
          ),
        ],
      ),
    );
  }
}
