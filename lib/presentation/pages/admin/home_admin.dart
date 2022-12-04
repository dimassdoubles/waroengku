import 'package:flutter/material.dart';
import 'package:waroengku/presentation/pages/admin/katalog.dart';
import 'package:waroengku/presentation/pages/signup_page.dart';
import 'package:waroengku/share/styles/colors.dart';

class HomeAdminPage extends StatelessWidget {
  const HomeAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hello",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          child: Text(
                            "Anda Login sebagai Admin",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          child:
                              Icon(Icons.notifications, color: kPrimaryColor),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      // width: size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kPrimaryColor.withAlpha(20)),
                      child: const TextField(
                        cursorColor: kPrimaryColor,
                        decoration: InputDecoration(
                            hintText: "Search ",
                            icon: Icon(Icons.search_rounded,
                                color: kPrimaryColor),
                            border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TabBar(
                labelColor: kPrimaryColor,
                tabs: [
                  Tab(
                    text: ("Katalog"),
                  ),
                  Tab(
                    text: ("Kategori"),
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [KatalogPage(), SignUpPage()],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
