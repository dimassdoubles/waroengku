import 'dart:io';

class RawReview {
  int productId, star;
  String review;
  File? image;
  RawReview({
    required this.productId,
    required this.star,
    required this.review,
    this.image,
  });
}
