import 'package:flutter/material.dart';
import 'package:waroengku/share/styles/colors.dart';

import 'admin_widget/katalog_item.dart';

class KatalogPage extends StatefulWidget {
  @override
  _KatalogPageState createState() => _KatalogPageState();
}

class _KatalogPageState extends State<KatalogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: const [
                KatalogItem(),
                KatalogItem(),
                KatalogItem(),
                KatalogItem(),
                KatalogItem(),
                KatalogItem(),
                SizedBox(
                  height: 72,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
