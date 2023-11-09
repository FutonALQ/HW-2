import 'package:flutter/material.dart';
import 'package:flutter_weather_apii/screens/weather_deatil.dart';
import 'package:flutter_weather_apii/servises/weather_api.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController cityController = TextEditingController();
  String cityName = "";
  String temperature = "";
  String condition = "";
  String highTemp = "";
  String lowTemp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.purple,
                  Colors.blue,
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: cityController,
                      decoration: InputDecoration(
                        hintText: "Search...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  InkWell(
                   onTap: ()  {
                    
                    performSearch(context, cityController.text);
   
                    },
                    child: const Icon(Icons.search),
                  ),
                ],
              ),
            ),
          ),
          if (cityName.isNotEmpty)
            Positioned(
              top: 100,
              left: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      "$cityName",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$temperature ",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$condition",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "H: $highTemp ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "L: $lowTemp ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
 void performSearch(BuildContext context, String city) async {
  final weather = await getWeather(city);
  setState(() {
    cityName = weather.location?.name ?? "City Name Not Available";
    temperature = "${weather.current?.tempC}" ?? "Temperature Not Available";
    condition = weather.current?.condition?.text ?? "Condition Not Available";
    highTemp = "${weather.current?.tempC}" ?? "High Temp Not Available"; 
    lowTemp = "${weather.current?.tempC}" ?? "Low Temp Not Available"; 
  });

  // Now that the state is updated, navigate to the detail screen.
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => WeatherDetail(
        cityName: cityName,
        temperature: temperature,
        condition: condition,
        highTemp: highTemp,
        lowTemp: lowTemp, time: null,
        
      ),
    ),
  );
}
}
