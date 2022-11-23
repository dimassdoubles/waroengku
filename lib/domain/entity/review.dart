import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final int _id, _star, _userId;
  final String _review, _image, _authorName;

  const Review(
      {required int id,
      required int star,
      required int userId,
      required String review,
      required String image,
      required String authorName})
      : _id = id,
        _star = star,
        _review = review,
        _image = image,
        _authorName = authorName,
        _userId = userId;

  int get userId {
    return _userId;
  }

  String get authorName {
    return _authorName;
  }

  String get image {
    return _image;
  }

  String get review {
    return _review;
  }

  int get star {
    return _star;
  }

  int get id {
    return _id;
  }

  @override
  List<Object?> get props => [_id, _star, _image, _review];
}
