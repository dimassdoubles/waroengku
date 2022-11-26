import 'package:flutter/material.dart';
import 'package:waroengku/presentation/pages/home_page.dart';
import 'package:waroengku/share/routes.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(homePage),
        ),
        title: const Text(
          "Detail Product",
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              "images/Shopping cart.jpg",
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(
              10.0,
            ),
            width: 240,
            height: 280,
            child: Card(
              color: Colors.white,
              elevation: 7,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Column(
                    children: [
                      Image.asset(
                        "images/Beras.jpg",
                        width: double.tryParse('7000'),
                      ),
                      Text(
                        "Beras 5 Kg Cap\nHoki",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}