import 'package:flutter/material.dart';
import '../../../domain/entity/wishlist.dart';
import '../../../share/routes.dart';
import '../../../share/styles/colors.dart';


class WishlistItem extends StatelessWidget {
  final Wishlist wishlist;
  const WishlistItem(
    this.wishlist, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, detailPage, arguments: wishlist.product),
      child: SizedBox(
        width: double.infinity,
        child: AspectRatio(
          aspectRatio: 2 / 3,
          child: Card(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: SizedBox(
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            wishlist.product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "${wishlist.product.name}\n",
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                        // const SizedBox(
                        //   height: 4,
                        // ),
                        Text(
                          "Rp ${wishlist.product.price}",
                          maxLines: 1,
                          style: const TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
