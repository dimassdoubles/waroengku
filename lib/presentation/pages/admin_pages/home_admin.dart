import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/auth/auth_state.dart';
import 'kategori.dart';
import '../../../share/routes.dart';

import '../../../injection_container.dart';
import '../../../share/styles/colors.dart';
import '../../blocs/auth/auth_event.dart';
import 'katalog.dart';

class HomeAdminPage extends StatefulWidget {
  final int initialIndex;
  const HomeAdminPage({super.key, this.initialIndex = 0});

  @override
  State<HomeAdminPage> createState() => _HomeAdminPageState();
}

class _HomeAdminPageState extends State<HomeAdminPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.initialIndex,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (tabController.index == 0) {
           
            Navigator.pushNamed(context, tambahKatalogPage);
          } else if (tabController.index == 1) {
          
            Navigator.pushNamed(context, tambahKategoriPage);
          }
        },
        backgroundColor: kPrimaryColor,
        elevation: 0,
        child: const Icon(Icons.add),
      ),
      body: BlocConsumer(
        listener: (context, state) {
          if (state is AuthLoad) {
          
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is UnAuthenticated) {
            Navigator.pushNamed(context, loginPage);
          }
        },
        bloc: getIt<AuthBloc>(),
        builder: (context, state) {
          if (state is Authenticated) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hello ${state.user.name},",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  "Anda Login sebagai Admin",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            SizedBox(
                              child: InkWell(
                                onTap: () {
                                  getIt<AuthBloc>().add(
                                    AuthLogout(state.user.token),
                                  );
                                },
                                child: const Icon(Icons.logout,
                                    color: kPrimaryColor),
                              ),
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
                  TabBar(
                    controller: tabController,
                    labelColor: kPrimaryColor,
                    indicatorColor: kPrimaryColor,
                    tabs: const [
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
                      controller: tabController,
                      children:const [
                         KatalogPage(),
                         KategoriPage(),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
