import 'package:flutter/material.dart';
import 'package:waroengku/share/routes.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, detailPage),
      child: SizedBox(
        width: 160,
        height: 160,
        child: Card(
          color: Colors.white,
          elevation: 7,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    "images/Beras.jpg",
                    width: 64.0,
                    height: 64.0,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    "Beras 5 Kg Cap \nHoki",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  const Text(
                    "Rp. 45.000",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w100,
                        fontSize: 12.0),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
