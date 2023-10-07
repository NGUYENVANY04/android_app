import 'package:flutter/material.dart';

class State_House extends StatelessWidget {
  const State_House({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: Icon(Icons.devices_other_rounded),
      subtitle: Text("Trạng thái các thiết bị "),
      iconColor: Colors.red,
      title: Text(
        'State Device',
        style: TextStyle(
          color: Color.fromARGB(255, 27, 8, 7),
        ),
      ),
      // onTap: () {
      //   Navigator.push(context,
      //       MaterialPageRoute(builder: (context) => const Dashboard()));
      // },
    );
  }
}
