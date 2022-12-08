import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:waroengku/domain/entity/raw_review.dart';

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
    print("star lama ${state[index].star}");
    state[index].star = value;
    print("star baru ${state[index].star}");
    emit(state);
  }

  void setReview({required int index, required String value}) {
    print("review lama ${state[index].review}");
    state[index].review = value;
    print("review baru ${state[index].review}");
    emit(state);
  }

  void setImage({required int index, required File value}) {
    state[index].image = value;
    emit(state);
  }
}
