import 'package:flutter/material.dart';

class Urgent extends StatelessWidget {
  const Urgent({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: Icon(Icons.smoking_rooms_sharp),
      subtitle: Text("Xử lí tình huống khẩn cấp"),
      iconColor: Color.fromARGB(255, 90, 75, 74),
      title: Text(
        'Urgent',
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
