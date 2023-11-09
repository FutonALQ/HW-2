 import 'package:flutter/material.dart';

Stack Forecasts(String day,String img,String temp) {
    return Stack(children: [
            Container(width: 80,height: 150,decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),gradient:LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // Replace with your desired colors
          colors: [Color.fromARGB(255, 227, 115, 255), Color.fromARGB(255, 47, 32, 90)],
        ),),child:Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("$temp c"),
          ),
         
          Image.asset(img,scale:5,),
         
          Text(day)
        ],)
         ,),
            

          ],);
  }

