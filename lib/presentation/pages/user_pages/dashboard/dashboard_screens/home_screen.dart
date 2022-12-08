import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/usecases/string_extension.dart';
import '../../../../blocs/auth/auth_bloc.dart';
import '../../../../blocs/auth/auth_state.dart';
import '../../../../blocs/category/cat_bloc.dart';
import '../../../../blocs/category/cat_event.dart';
import '../../../../blocs/category/cat_state.dart';
import '../../../../blocs/product/product_bloc.dart';
import '../../../../blocs/product/product_event.dart';
import '../../../../blocs/product/product_state.dart';
import '../../../../../injection_container.dart';
import '../../../../../share/routes.dart';
import '../../../../../share/styles/colors.dart';
import '../../../../widgets/user_widgets/product_item.dart';
import '../../../../widgets/user_widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: getIt<AuthBloc>(),
      builder: (context, authState) {
        if (authState is Authenticated) {
          return BlocBuilder(
            bloc: getIt<CategoryBloc>(),
            builder: (context, catState) {
              if (catState is CategoryLoaded) {
                tabController = TabController(
                  length: catState.categories.length + 1,
                  vsync: this,
                );
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SafeArea(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Header(name: authState.user.name),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: SearchBar(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: TabBar(
                              controller: tabController,
                              isScrollable: true,
                              labelColor: Colors.black,
                              indicatorColor: Colors.black,
                              onTap: (value) {
                                
                              },
                              tabs: [
                                const Tab(
                                  text: "All",
                                ),
                                ...catState.categories.map(
                                  (e) => Tab(
                                    text: e.name.removeCategoryPrevix(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder(
                        bloc: getIt<ProductBloc>(),
                        builder: (context, prodState) {
                          if (prodState is ProductLoaded) {
                            return TabBarView(
                              controller: tabController,
                              children: [
                                const HomeContent(),
                                ...catState.categories.map(
                                  (e) => HomeContent(
                                    categoryId: e.id,
                                  ),
                                ),
                              ],
                            );
                          }
                          getIt<ProductBloc>().add(
                            ProductGet(
                              token: authState.user.token,
                              categories: catState.categories,
                            ),
                          );
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
                      ),
                    ),
                  ],
                );
              }
              getIt<CategoryBloc>().add(CategoryGet(authState.user.token));
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
        }
        return const SizedBox();
      },
    );
  }
}

class HomeContent extends StatelessWidget {
  final int? categoryId;
  const HomeContent({
    Key? key,
    this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: getIt<ProductBloc>(),
      builder: (context, prodState) {
        if (prodState is ProductLoaded) {
          if (categoryId != null) {
            final products = prodState.products
                .where(
                  (element) => element.categoryId == categoryId,
                )
                .toList();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 16),
                // runSpacing: 16,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 2 / 3,
                ),
                children: [
                  ...products.map((e) => ProductItem(e)),
                ],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GridView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 16),
              // runSpacing: 16,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 2 / 3,
              ),
              children: [
                ...prodState.products.map((e) => ProductItem(e)),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class Header extends StatelessWidget {
  final String name;
  const Header({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 4,
              ),
              Text(
                "Hi $name,",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Selamat Berbelanja",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, keranjangPage);
            },
            child: const Icon(
              Icons.shopping_cart,
              color: kPrimaryColor,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
