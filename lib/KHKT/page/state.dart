import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class State_House extends StatefulWidget {
  const State_House({super.key});

  @override
  State<State_House> createState() => _State_HouseState();
}

class _State_HouseState extends State<State_House> {
  final data = FirebaseDatabase.instance.ref();
  late String gas = "";
  late String fire = "";
  late String wind = "";
  late String water = "";
  @override
  void initState() {
    super.initState();
    Read_Data_Gas();
    Read_Data_Fire();
  }

  void Read_Data_Gas() {
    data.child("state_gas").onValue.listen((event) {
      final data_gas = event.snapshot.value;
      if (data_gas == true) {
        setState(() {
          gas = "On";
          wind = "On";
        });
      } else if (data_gas == false) {
        setState(() {
          gas = "Off";
          wind = "Off";
        });
      }
    });
  }

  void Read_Data_Fire() {
    data.child("state_fire").onValue.listen((event) {
      final data_fire = event.snapshot.value;
      if (data_fire == true) {
        setState(() {
          fire = "On";
          water = "On";
        });
      } else {
        setState(() {
          fire = "Off";
          water = "Off";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[600],
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   // leading: const Icon(Icons.menu),
        // ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage(
                          "smarthome.jpg"), // Đường dẫn đến tệp ảnh asset của bạn
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 40.0, // Khoảng cách theo chiều dọc
                    crossAxisSpacing: 40.0, // Khoảng cách theo chiều ngang
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 200,
                            width: 250,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "gio.jpeg"), // Đường dẫn đến tệp ảnh asset của bạn
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 146, 114,
                                    114), // Tăng giá trị alpha từ 31 lên 255
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Center(
                                  child:
                                      Text(wind)), // Display the gas value here
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 200,
                            width: 250,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "ga.png"), // Đường dẫn đến tệp ảnh asset của bạn
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 146, 114,
                                    114), // Tăng giá trị alpha từ 31 lên 255
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Center(child: Text(gas)),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 200,
                            width: 250,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "nuoc.jpeg"), // Đường dẫn đến tệp ảnh asset của bạn
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 146, 114,
                                    114), // Tăng giá trị alpha từ 31 lên 255
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Center(child: Text(water)),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 200,
                            width: 250,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "lua.jpg"), // Đường dẫn đến tệp ảnh asset của bạn
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 146, 114,
                                    114), // Tăng giá trị alpha từ 31 lên 255
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Center(child: Text(fire)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
