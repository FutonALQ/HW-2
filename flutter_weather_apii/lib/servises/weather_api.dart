import 'package:flutter_weather_apii/models/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
String city="london";


const apikey = 'c28b18e2eadd4495bf3184326230711';
String cityName = "london";
Weather currentweather =Weather();


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

Future  tempfun() async{
  http.Response response=await http.get(Uri.parse('http://api.weatherapi.com/v1/current.json?key=992dfeb2f7124d14b3221436230811&q=$city&aqi=no')
  );
  String data=response.body;
  var temp=jsonDecode(data)["current"]['temp_c'];
  print(temp);

}











var value =currentweather.current!.tempC;




Future getWeatherData(dynamic value  ) async {
  http.Response response = await http.get(Uri.parse(
      'http://api.weatherapi.com/v1/current.json?key=$apikey&q=london&aqi=no'));

  print(response.body,);
  if (response.statusCode == 200) {
    
    String data = response.body;
    var decodedData = jsonDecode(data);
    currentweather = Weather.fromJson(decodedData);
    var citytemp = value;

    print(citytemp);
    return citytemp;
  } else {
    print(response.statusCode);
  }
}