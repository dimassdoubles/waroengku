import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:waroengku/domain/entity/detail_transaction.dart';
import 'package:waroengku/domain/entity/product.dart';
import 'package:waroengku/presentation/cubits/raw_review_cubit.dart';
import 'package:waroengku/share/styles/colors.dart';

import '../../../domain/entity/transaction.dart';

class ReviewsPage extends StatefulWidget {
  Transaction transaction;
  ReviewsPage({
    Key? key,
    required this.transaction,
  });

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  late RawReviewCubit rawRCubit;
  @override
  void initState() {
    super.initState();
    rawRCubit = RawReviewCubit(transaction: widget.transaction);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Review Produk',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(
            height: 16,
          ),
          ...widget.transaction.detailTransactions.asMap().entries.map((e) {
            int index = e.key;
            DetailTransaction detailTransaction = e.value;
            return InputReview(
              rawRCubit: rawRCubit,
              index: index,
              product: detailTransaction.product,
            );
          }),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              for (int i = 0; i < rawRCubit.state.length; i++) {
                print(rawRCubit.state[i].productId);
                print(rawRCubit.state[i].star);
                print(rawRCubit.state[i].review);
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Bagikan Review",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InputReview extends StatelessWidget {
  RawReviewCubit rawRCubit;
  int index;
  Product product;
  InputReview({
    Key? key,
    required this.rawRCubit,
    required this.index,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          RatingBar.builder(
              initialRating: 1,
              minRating: 1,
              direction: Axis.horizontal,
              itemCount: 5,
              itemSize: 24,
              itemBuilder: (context, index) => const Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
                  ),
              onRatingUpdate: (rating) {
                rawRCubit.setStar(index: index, value: rating.round());
              }),
          TextField(
            onChanged: (value) {
              rawRCubit.setReview(index: index, value: value);
            },
          ),
        ],
      ),
    );
  }
}
