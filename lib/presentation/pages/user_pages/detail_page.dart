import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../domain/entity/product.dart';
import '../../../domain/entity/review.dart';
import '../../../injection_container.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/auth/auth_state.dart';
import '../../blocs/review/review_bloc.dart';
import '../../blocs/review/review_event.dart';
import '../../blocs/review/review_state.dart';
import '../../../share/routes.dart';
import '../../../share/styles/colors.dart';

import '../../widgets/user_widgets/create_cart_button.dart';
import '../../widgets/user_widgets/favorite_button.dart';
// import 'package:waroengku/presentation/pages/home_page.dart';

class DetailPage extends StatelessWidget {
  final Product product;
 const  DetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Detail Product",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, keranjangPage);
              },
              child: const Icon(
                Icons.shopping_cart_rounded,
                size: 30,
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          ListView(
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.grey[100],
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.network(product.image),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              FavoriteButton(productId: product.id),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "IDR",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "Rp ${product.price}",
                            style: const TextStyle(
                                color: kPrimaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          const Text(
                            "Stock Barang: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "${product.stock}",
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "Deskripsi: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            product.description,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Reviews(productId: product.id),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 86,
                    ),
                  ],
                ),
              ),
            ],
          ),
          CreateCartButton(productId: product.id, quantity: 1),
        ],
      ),
    );
  }
}

class Reviews extends StatelessWidget {
  final int productId;
  const Reviews({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: getIt<AuthBloc>(),
      builder: (context, authState) {
        if (authState is Authenticated) {
         
          getIt<ReviewBloc>().add(
            ReviewGet(
              token: authState.user.token,
              productId: productId,
            ),
          );
          return BlocBuilder(
            bloc: getIt<ReviewBloc>(),
            builder: (context, revState) {
              if (revState is ReviewLoaded) {
                if (revState.reviews.isNotEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reviews (${revState.reviews.length})',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Divider(),
                      ...revState.reviews.map((e) => ReviewItem(review: e)),
                    ],
                  );
                }
                return const SizedBox();
              }

              return const SizedBox();
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}

class ReviewItem extends StatelessWidget {
  final Review review;
  const ReviewItem({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            review.authorName,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          RatingBarIndicator(
            rating: review.star.toDouble(),
            direction: Axis.horizontal,
            itemCount: 5,
            itemSize: 16,
            itemBuilder: (context, index) => const Icon(
              Icons.star_rounded,
              color: Colors.amber,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          AspectRatio(
            aspectRatio: 1,
            child: SizedBox(
              width: double.infinity,
              child: Image.network(
                review.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(review.review),
          const Divider(),
        ],
      ),
    );
  }
}
