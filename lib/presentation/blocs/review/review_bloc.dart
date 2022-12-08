import 'package:bloc/bloc.dart';
import 'package:waroengku/domain/usecases/create_review.dart';
import 'package:waroengku/domain/usecases/get_review_by_product_id.dart';
import 'package:waroengku/presentation/blocs/review/review_event.dart';
import 'package:waroengku/presentation/blocs/review/review_state.dart';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  GetReviewByProductId getReviewByProductId;
  CreateReview createReview;
  ReviewBloc({
    required this.getReviewByProductId,
    required this.createReview,
  }) : super(ReviewUnload()) {
    on<ReviewGet>(
      (event, emit) async {
        emit(ReviewOnload());
        final result = await getReviewByProductId(
          productId: event.productId,
          token: event.token,
        );
        result.fold(
          (l) => emit(ReviewUnload()),
          (r) => emit(ReviewLoaded(reviews: r)),
        );
      },
    );

    on<ReviewCreate>(
      (event, emit) async {
        emit(ReviewOnload());

        // melakukan review setiap barang yang telah dipesan
        for (int i = 0; i < event.rawReeviews.length; i++) {
          print("mereview $i");
          final result = await createReview(
            token: event.token,
            image: event.rawReeviews[i].image!,
            productId: event.rawReeviews[i].productId,
            review: event.rawReeviews[i].review,
            star: event.rawReeviews[i].star,
          );
          result.fold(
            (l) => print("gagal mereview $i"),
            (r) => print(
              "berhasil mereview $i",
            ),
          );
        }

        print("finish review");

        emit(ReviewFinish());
      },
    );
  }
}
