import 'package:bloc/bloc.dart';
import '../../../domain/usecases/create_review.dart';
import '../../../domain/usecases/get_review_by_product_id.dart';
import 'review_event.dart';
import 'review_state.dart';

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
          await createReview(
            token: event.token,
            image: event.rawReeviews[i].image!,
            productId: event.rawReeviews[i].productId,
            review: event.rawReeviews[i].review,
            star: event.rawReeviews[i].star,
          );
        }
        emit(ReviewFinish());
      },
    );
  }
}
