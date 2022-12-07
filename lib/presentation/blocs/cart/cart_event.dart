abstract class CartEvent {}

class CartGet extends CartEvent {
  String token;
  CartGet({required this.token});
}

class CartCreate extends CartEvent {
  String token;
  int productId, quantity;
  CartCreate({
    required this.token,
    required this.productId,
    required this.quantity,
  });
}

class CartDelete extends CartEvent {
  String token;
  int id;
  CartDelete({
    required this.token,
    required this.id,
  });
}
