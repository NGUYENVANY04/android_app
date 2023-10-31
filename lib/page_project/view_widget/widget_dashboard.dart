import 'package:android_app/page_project/view_mode/data_firebase.dart';
import 'package:android_app/page_project/view_widget/temp_widget.dart';
import 'package:android_app/page_project/view_widget/widget_state_device.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StateHouse extends StatefulWidget {
  const StateHouse({Key? key}) : super(key: key);

  @override
  State<StateHouse> createState() => _StateHouseState();
}

class _StateHouseState extends State<StateHouse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DataFirebase>(
        builder: (context, view, child) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color.fromARGB(255, 250, 186, 217),
                    Colors.white
                  ]),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Hi, Friend",
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    CircleAvatar(
                        minRadius: 16,
                        backgroundImage: AssetImage("assets/images/user.webp"))
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                InfoWidget(),
                SizedBox(
                  height: 50,
                ),
                StateDevice(),
              ],
            ),
          );
        },
      ),
    );
  }
}
