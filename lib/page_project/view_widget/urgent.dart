import 'package:flutter/material.dart';

class Urgent extends StatelessWidget {
  const Urgent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/road-map.jpg"),
        fit: BoxFit.cover,
      )),
    );
  }
}
