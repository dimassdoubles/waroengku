import 'package:equatable/equatable.dart';
import 'package:waroengku/domain/entity/wishlist.dart';

abstract class WishlistState extends Equatable {}

class WishlistUnload extends WishlistState {
  @override
  List<Object?> get props => [];
}
class WishlistOnload extends WishlistState {
  @override
  List<Object?> get props => [];
}

class WishlistLoaded extends WishlistState {
  List<Wishlist> wishlist;
  WishlistLoaded(this.wishlist);

  @override
  List<Object?> get props => [wishlist];
}

