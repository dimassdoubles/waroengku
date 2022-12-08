import 'package:equatable/equatable.dart';
import '../../../domain/entity/wishlist.dart';

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
  final List<Wishlist> wishlist;
  WishlistLoaded(this.wishlist);

  @override
  List<Object?> get props => [wishlist];
}

