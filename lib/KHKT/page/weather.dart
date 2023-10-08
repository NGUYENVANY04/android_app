import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  double temperature = 0;

  @override
  void initState() {
    super.initState();
    getTemperatureFromAPI();
  }

  void getTemperatureFromAPI() async {
    const String apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?lat=20.97&lon=105.78&units=metric&appid=b6adef308b3d93d1e934c43bd49d3800';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final Map<String, dynamic> main = data['main'];

        if (main.containsKey('temp')) {
          setState(() {
            temperature =
                main['temp'].toDouble(); // Convert from Kelvin to Celsius
          });
          log('Current temperature: $temperature');
        } else {
          log('Temperature not available in response');
        }
      } else {
        log('Failed to load data');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Current temperature: $temperature',
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
