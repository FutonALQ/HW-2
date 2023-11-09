import 'package:flutter/material.dart';
import 'package:flutter_weather_apii/screens/weather_deatil.dart';
import 'package:flutter_weather_apii/screens/weather_screen.dart';

import 'package:flutter_weather_apii/screens/welcome_screen.dart';
//import 'package:flutter_weather_apii/screens/weather_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(



      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,

    );
  }
}
