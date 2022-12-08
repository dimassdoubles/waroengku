import 'dart:io';

import 'package:bloc/bloc.dart';
import '../../domain/entity/raw_review.dart';

import '../../domain/entity/transaction.dart';

class RawReviewCubit extends Cubit<List<RawReview>> {
  RawReviewCubit({required Transaction transaction})
      : super(
          transaction.detailTransactions
              .map(
                (e) => RawReview(
                  productId: e.product.id,
                  review: "",
                  star: 1,
                ),
              )
              .toList(),
        );

  void setStar({required int index, required int value}) {
    state[index].star = value;
    emit(state);
  }

  void setReview({required int index, required String value}) {
    state[index].review = value;
    emit(state);
  }

  void setImage({required int index, required File value}) {
    state[index].image = value;
    emit(state);
  }
}
