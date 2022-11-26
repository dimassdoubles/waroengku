import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int _id, _categoryId, _price, _stock;
  final String _name, _image, _description;
  const Product({
    required int id,
    required int categoryId,
    required int price,
    required int stock,
    required String name,
    required String image,
    required String description,
  })  : _id = id,
        _categoryId = categoryId,
        _price = price,
        _stock = stock,
        _name = name,
        _image = image,
        _description = description;

  String get description {
    return _description;
  }

  String get image {
    return _image;
  }

  String get name {
    return _name;
  }

  int get id {
    return _id;
  }

  int get categoryId {
    return _categoryId;
  }

  int get price {
    return _price;
  }

  int get stock {
    return _stock;
  }

  @override
  List<Object?> get props =>
      [_id, _categoryId, _price, _stock, _name, _image, _description];
}
