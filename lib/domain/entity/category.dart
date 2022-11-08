import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int _id;
  final String _name;

  const Category({required int id, required String name})
      : _id = id,
        _name = name;
  int get id {
    return _id;
  }

  String get name {
    return _name;
  }

  @override
  List<Object?> get props => [];
}
