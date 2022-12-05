import 'package:equatable/equatable.dart';
import 'package:waroengku/domain/entity/category.dart';

abstract class CategoryState extends Equatable {}

class CategoryUnload extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryOnload extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryLoaded extends CategoryState {
  final List<Category> categories;
  CategoryLoaded(this.categories);
  @override
  List<Object?> get props => [categories];
}
