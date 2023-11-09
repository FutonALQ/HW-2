import 'package:flutter/material.dart';
import 'package:flutter_weather_apii/models/weather.dart';
//import 'package:flutter_weather_apii/servises/weather_api.dart';
import 'package:flutter_weather_apii/wedgets/coustom_wedgets.dart';
Weather currentweather =Weather();

class WeatherDetail extends StatefulWidget {
  const WeatherDetail({Key? key}) : super(key: key);

  @override
  State<WeatherDetail> createState() => _WeatherDetailState();
}

class _WeatherDetailState extends State<WeatherDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Instead of using backgroundColor, we'll use a Container with decoration
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            // Replace with your desired colors
            colors: [Color.fromARGB(255, 220, 48, 243), Color.fromARGB(255, 66, 36, 156)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          
          children: [
            SizedBox(height: 100,),
            Row(children: [
              SizedBox(width: 110,),
              Text("North America",style: TextStyle(fontSize: 30,color: Colors.white),)
            ],),
            SizedBox(height: 30,)
            ,Row(children: [
              SizedBox(width: 110,),
              Text("Max:24",style: TextStyle(fontSize: 24,color: Colors.white)),
              SizedBox(width: 10,),
              Text("Min:18",style: TextStyle(fontSize: 24,color: Colors.white))
            ],),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 20),
              child: Text("7-Days Forecats",style: TextStyle(fontSize: 24,color: Colors.white),),
            ),
            SizedBox(height:20,),
            SizedBox(
              height: 150,
              width: 200,
              child: ListView(
                
                scrollDirection: Axis.horizontal,
                
                children: [
                  SizedBox(width: 20), 
              Forecasts(),
              SizedBox(width: 20), 
               Forecasts(),
               SizedBox(width: 20), 
                Forecasts(),
                SizedBox(width: 20), 
                 Forecasts(),
                 SizedBox(width: 20), 
                  Forecasts(),
                  SizedBox(width: 20), 
                   Forecasts(),
                   SizedBox(width: 20), 
                    Forecasts(),
                    SizedBox(width: 20), 
              ],),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Row(children: [
                Stack(children: [
                  Container(width: 290,height: 150,decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),  gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            // Replace with your desired colors
            colors: [Color.fromARGB(255, 220, 48, 243), Color.fromARGB(255, 66, 36, 156)],
          )),child:Column(children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                Icon(Icons.settings_power_sharp),
                Text("AIR QUALITY",style: TextStyle(fontSize: 16),),
            
              ],),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 110),
              child: Text("3-Low Health Risk",style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,right: 70,left: 10),
              child: Container(width: 250,height: 10,decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),  gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromARGB(255, 239, 135, 253), Color.fromARGB(255, 41, 30, 75)],
                      )),),
            ),

          ],) ,)

                ],)
                
              ],),
            ),
            Container(width: 200,height: 40,color: Colors.amber,child: Image.network("https://media.giphy.com/media/ZLdy2L5W62WGs/giphy.gif",fit: BoxFit.cover),)
           
          ],
          
        ),
      ),
    );
  }

}