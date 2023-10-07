import 'package:android_app/Project/KHKT/page/howtouse.dart';
import 'package:flutter/material.dart';
import 'howtouse.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: Icon(Icons.dashboard_outlined),
      subtitle: Text("Bảng điều khiển các thiết bị "),
      iconColor: Colors.greenAccent,
      title: Text(
        'DashBoard',
        style: TextStyle(
          color: Color.fromARGB(255, 27, 8, 7),
        ),
      ),
      // onTap: () {
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) =>  Use()));
      // },
    );
  }
}
