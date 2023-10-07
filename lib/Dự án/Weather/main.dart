import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyWeather());
}

class MyWeather extends StatelessWidget {
   MyWeather({super.key});
 
  // ignore: prefer_typing_uninitialized_variables
  var jsonResponse;
  var response =  http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=Hanoi&appid=1a2abc79152b7bc7a5b712fadba503a5'));

  if (response.statusCode == 200) {
    jsonResponse = json.decode(response.body);
    // print(jsonResponse['weather']);
  } else {
    // ignore: avoid_print
    print('Request failed with status: ${response.statusCode}.');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Weather today'),
        ),
        body: Text('$jsonResponse'),
      ),
    );
  }
}
Future<http.Response> fetchPost() {
    return http.get("https://api.openweathermap.org/data/2.5/weather?q=Hanoi&appid=1a2abc79152b7bc7a5b712fadba503a5");
}
