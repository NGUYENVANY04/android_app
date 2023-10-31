import 'package:android_app/page_project/view_mode/data_firebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StateDevice extends StatefulWidget {
  const StateDevice({Key? key}) : super(key: key);

  @override
  State<StateDevice> createState() => _StateDeviceState();
}

class _StateDeviceState extends State<StateDevice> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataFirebase>(
      builder: (context, view, child) {
        if (view.isShow == false) {
          return InkWell(
            onTap: () {
              view.showMore();
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/living_room.png",
                      height: 30,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Text(
                      "Device My Home",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          view.showMore();
                        },
                        icon: const Icon(Icons.expand_more))
                  ],
                )),
          );
        } else {
          return Expanded(
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        "Device My Home ",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 30.0, // Khoảng cách theo chiều dọc
                            crossAxisSpacing:
                                30.0, // Khoảng cách theo chiều ngang
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/gio.jpeg"), // Đường dẫn đến tệp ảnh asset của bạn
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: TextButton(
                                        onPressed: view.conTrolWind,
                                        child: Text(view.dataControlWind
                                            ? "On"
                                            : " Off"),
                                      ), // Display the gas value here
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/ga.png"), // Đường dẫn đến tệp ảnh asset của bạn
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
                                      width: 70,
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 146, 114,
                                            114), // Tăng giá trị alpha từ 31 lên 255
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: TextButton(
                                        onPressed: view.readDataGas,
                                        child: Text(
                                            view.dataGas ? "Warning" : " Good"),
                                      ), //
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/nuoc.jpeg"), // Đường dẫn đến tệp ảnh asset của bạn
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: TextButton(
                                        onPressed: view.conTrolWater,
                                        child: Text(view.dataControlWater
                                            ? "On"
                                            : " Off"),
                                      ),
                                    ), //
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/lua.jpg"), // Đường dẫn đến tệp ảnh asset của bạn
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
                                      width: 70,
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 146, 114,
                                            114), // Tăng giá trị alpha từ 31 lên 255
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          view.readDataFire;
                                        },
                                        child: Text(view.dataFire
                                            ? "Warning"
                                            : " Good"),
                                      ), //
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            view.showMore();
                          },
                          icon: const Icon(
                            Icons.expand_less_outlined,
                            color: Colors.black,
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
