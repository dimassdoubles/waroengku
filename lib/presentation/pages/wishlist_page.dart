import 'package:flutter/material.dart';
import 'package:waroengku/presentation/pages/itemlist.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed:()=> Navigator.of(context).pop() ,
        ),
        title: const Text('Favorite Saya',  
        style: TextStyle(fontFamily:'Poppins',color: Colors.black, fontSize: 15),    
        )),
      body:  
            SingleChildScrollView(
              child: Column(
                children: [
                  ItemsList(),
                ],
              ),
            )
         
    );
   
  }
}