import 'package:android_app/KHKT/page/weather.dart';
import 'package:flutter/material.dart';

class Use extends StatelessWidget {
  const Use({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.people_alt_sharp),
      subtitle: Text("User manual"),
      iconColor: const Color.fromARGB(255, 178, 139, 136),
      title: const Text(
        'Hướng dẫn sử dụng',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Weather()));
      },
    );
  }
}
