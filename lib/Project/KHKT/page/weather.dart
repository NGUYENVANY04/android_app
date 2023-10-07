import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: Icon(Icons.cloud_rounded),
      subtitle: Text("Thời tiết "),
      iconColor: Color.fromARGB(255, 90, 75, 74),
      title: Text(
        'Weather',
        style: TextStyle(
          color: Color.fromARGB(255, 27, 8, 7),
        ),
      ),
      // onTap: () {
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => const Setting()));
      // },
    );
  }
}
