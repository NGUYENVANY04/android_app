import 'dart:convert';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InfoViewModel extends ChangeNotifier {
  InfoViewModel() : super() {
    getTemp();
    getRoomTemp();
  }
  int temp = 0;
  int roomTemp = 0;
  void getTemp() async {
    temp = await getCurrentTemperature();
    notifyListeners();
  }

  Future<int> getCurrentTemperature() async {
    const String apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?lat=20.97&lon=105.78&units=metric&appid=b6adef308b3d93d1e934c43bd49d3800';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final Map<String, dynamic> main = data['main'];

        if (main.containsKey('temp')) {
          final double temperature =
              main['temp']; // Convert from Kelvin to Celsius
          return temperature.toInt();
        } else {
          throw Exception('Temperature not available in response');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      log(e.toString());
      return 0;
    }
  }

  getRoomTemp() {
    DatabaseReference starCountRef = FirebaseDatabase.instance.ref('object');
    starCountRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      // roomTemp = int.parse(data.toString());
      double doubleValue = double.parse(data.toString());
      roomTemp = doubleValue.toInt();
      notifyListeners();
    });
  }
}
