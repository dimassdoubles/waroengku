import 'package:waroengku/domain/entity/raw_review.dart';

abstract class ReviewEvent {}

class ReviewGet extends ReviewEvent {
  String token;
  int productId;
  ReviewGet({
    required this.token,
    required this.productId,
  });
}

class ReviewCreate extends ReviewEvent {
  String token;
  List<RawReview> rawReeviews;
  ReviewCreate({
    required this.token,
    required this.rawReeviews,
  });
}
