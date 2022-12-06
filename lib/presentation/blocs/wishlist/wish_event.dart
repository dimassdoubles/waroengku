abstract class WishlistEvent {}

class WishlistGet extends WishlistEvent {
  String token;
  WishlistGet({required this.token});
}

class WishlistDelete extends WishlistEvent {
  String token;
  int id;
  WishlistDelete({
    required this.token,
    required this.id,
  });
}

class WishlistCreate extends WishlistEvent {
  String token;
  int productId;
  WishlistCreate({
    required this.token,
    required this.productId,
  });
}
