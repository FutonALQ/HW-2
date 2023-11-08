 import 'package:flutter/material.dart';

Stack Forecasts() {
    return Stack(children: [
            Container(width: 80,height: 150,decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),gradient:LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // Replace with your desired colors
          colors: [Color.fromARGB(255, 227, 115, 255), Color.fromARGB(255, 47, 32, 90)],
        ),),child:Column(children: [
          Text("19 c"),
          SizedBox(height: 20,),
          Image.asset("lib\\assets\\imges\\rain.gif",scale:5,),
          SizedBox(height: 20,),
          Text("mon")
        ],)
         ,),
            

          ],);
  }

