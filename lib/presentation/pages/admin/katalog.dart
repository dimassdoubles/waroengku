import 'package:flutter/material.dart';

class KatalogPage extends StatefulWidget {
  @override
  _KatalogPageState createState() => _KatalogPageState();
}

class _KatalogPageState extends State<KatalogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:  Image.asset(
                    "assets/images/bimoli-removebg-preview 3.png", height: 50,width: 0,),
              )
            ],
          )
        ],
      ),
    );
  }
}