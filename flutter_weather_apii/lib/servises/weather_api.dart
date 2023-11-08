import 'package:flutter_weather_apii/models/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Weather> getWeather(String city) async {
  final apiUrl = Uri.parse(
      'http://api.weatherapi.com/v1/current.json?key=992dfeb2f7124d14b3221436230811&q=$city&aqi=no');
  final response = await http.get(apiUrl);
  print(response.statusCode);

  final jesonresponse = jsonDecode(response.body);
  print(jesonresponse);
  final currentweather = Weather.fromJson(jesonresponse);

  return currentweather;
}
