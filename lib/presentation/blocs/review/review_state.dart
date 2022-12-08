import 'package:equatable/equatable.dart';
import 'package:waroengku/domain/entity/review.dart';

abstract class ReviewState extends Equatable {}

class ReviewUnload extends ReviewState {
  @override
  List<Object?> get props => [];
}

class ReviewOnload extends ReviewState {
  @override
  List<Object?> get props => [];
}

class ReviewFinish extends ReviewState {
  @override
  List<Object?> get props => [];
}

class ReviewLoaded extends ReviewState {
  List<Review> reviews;
  ReviewLoaded({required this.reviews});
  @override
  List<Object?> get props => [reviews];
}
