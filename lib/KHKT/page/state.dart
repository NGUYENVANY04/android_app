import 'package:flutter/material.dart';

class State_House extends StatelessWidget {
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
                    mainAxisSpacing: 20.0, // Khoảng cách theo chiều dọc
                    crossAxisSpacing: 20.0, // Khoảng cách theo chiều ngang
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
                                  BorderRadius.all(Radius.circular(30)),
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
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              child: const Center(child: Text("On")),
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
                                  BorderRadius.all(Radius.circular(30)),
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
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              child: const Center(child: Text("On")),
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
                                  BorderRadius.all(Radius.circular(30)),
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
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              child: const Center(child: Text("On")),
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
                                  BorderRadius.all(Radius.circular(30)),
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
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              child: const Center(child: Text("On")),
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
