import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemsList extends StatelessWidget {
 
 List img = [
  'Gulaku',
  'Gulaperkilo',
  'BerasCapHoki',

 ];

  @override
  Widget build(BuildContext context) {
    return 
        GridView.count(
        crossAxisCount: 2,
        childAspectRatio: (148/160),
        shrinkWrap: true,
      
    children: [
      for (int i = 0; i<img.length; i++)
      Container(
        padding: EdgeInsets.symmetric(vertical:5, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical:30, horizontal: 40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius : BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 30,
            ),
          ]
            
        ),
        child: Column(children: [
          InkWell(
            onTap:(){

            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: Image.asset(
                "image/${img[i]}.png",
                width: 110,
                height: 110,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                img[i],
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 0) ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\Rp.28.200",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    color: Colors.deepOrange,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(15, 82, 79, 79),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.delete,
                    size: 22,
                    color: Colors.red,
                  ),
                )
              ],
            ),)

        ],)

       
        

      )
    ],
    );
      

    
  }
}