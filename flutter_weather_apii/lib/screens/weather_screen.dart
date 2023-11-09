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
  List<WeatherInfo> weatherInfoList = [];
  ThemeMode currentTheme = ThemeMode.light;

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
                    
                    performSearch(cityController.text);
   
                    },
                    child: const Icon(Icons.search),
                  ),
                ],
              ),
            ),
          ),
          if (weatherInfoList.isNotEmpty)
            Positioned(
              top: 100,
              left: 16,
              right: 16,
              child: Container(
                height: 700,
                child: ListView.builder(
                  itemCount: weatherInfoList.length,
                  itemBuilder: (context, index) {
                    final weatherInfo = weatherInfoList[index];
                    return WeatherContainer(
                      weatherInfo: weatherInfo,
                      onDelete: () {
                        setState(() {
                          weatherInfoList.removeAt(index);
                        });
                      },
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
//  void performSearch(BuildContext context, String city) async {
//   final weather = await getWeather(city);
//   setState(() {
//     cityName = weather.location?.name ?? "City Name Not Available";
//     temperature = "${weather.current?.tempC}" ?? "Temperature Not Available";
//     condition = weather.current?.condition?.text ?? "Condition Not Available";
//     highTemp = "${weather.current?.tempC}" ?? "High Temp Not Available"; 
//     lowTemp = "${weather.current?.tempC}" ?? "Low Temp Not Available"; 
//   });




  void performSearch(String city) async {
    final weather = await getWeather(city);
    setState(() {
      weatherInfoList.add(
        WeatherInfo(
          cityName: weather.location?.name ?? "City Name Not Available",
          temperature: "${weather.current?.tempC}" ?? "Not there",
          condition: weather.current?.condition?.text ?? " Not there",
          highTemp: "${weather.current?.tempC}" ?? "Not there",
          lowTemp: "${weather.current?.tempC}" ?? "Not there",
        ),
      );
    });
  }

}

class WeatherContainer extends StatelessWidget {
  final WeatherInfo weatherInfo;
  final VoidCallback onDelete;

  WeatherContainer({required this.weatherInfo, required this.onDelete});
  
 

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WeatherDetail(
              cityName: weatherInfo.cityName,
              temperature: weatherInfo.temperature,
              condition: weatherInfo.condition,
              highTemp: weatherInfo.highTemp,
              lowTemp: weatherInfo.lowTemp,
            ),
          ),
        );
},
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.purple[800],
                  ),
                  onPressed: onDelete,
                ),
              ],
            ),
            Text(
              "${weatherInfo.cityName}",
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: "DM Serif Display",
              ),
            ),
            Text(
              "${weatherInfo.temperature}",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(
              "${weatherInfo.condition}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "H: ${weatherInfo.highTemp}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "L: ${weatherInfo.lowTemp}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherInfo {
  final String cityName;
  final String temperature;
  final String condition;
  final String highTemp;
  final String lowTemp;

  WeatherInfo({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.highTemp,
    required this.lowTemp,
  });
}
