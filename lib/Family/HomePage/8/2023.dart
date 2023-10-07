import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter_icons/flutter_icons.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      databaseURL: "https://android-flutter-8e415-default-rtdb.firebaseio.com",
      projectId: "android-flutter-8e415",
      apiKey: "AIzaSyDmClzTN63T-l3AHzUKc2NsaYC8RFPclZM",
      messagingSenderId: "91527969026",
      appId: "1:91527969026:web:0e06fa61f338990f14ea1b",
    ),
  );
  runApp(const MyScreen());
}

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  final data = FirebaseDatabase.instance.ref();
  final auth = FirebaseDatabase.instance;
  // ignore: non_constant_identifier_names
  bool state_device = true;
  String test = 'hi';
  @override
  void initState() {
    super.initState();
    read_data();
  }

  // ignore: non_constant_identifier_names
  void read_data() {
    data.child('led').onValue.listen((event) {
      // // final datas = event.snapshot.value;
      // // state_device = data as bool;
      // // phần này không cần thiết vì đây chỉ là check trạng đọc từ firebase thôi
      // setState(() {
      state_device = event.snapshot.value as bool;
      // });
    });
  }

  // ignore: non_constant_identifier_names
  void on_turn() {
    data.update({
      "led": !state_device,
    });
  }

  String getImageUrl() {
    return state_device ? "assets/state2.jpg" : "assets/state1.jpg";
  }

  String state_log() {
    return state_device ? "Light ON" : "Light OFF";
  }

  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter learn',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: const Text(
        //     'Ứng dụng điều khiển đèn gia đình',
        //     style: TextStyle(
        //       color: Color.fromARGB(255, 250, 248, 248),
        //     ),
        //   ),
        //   leading: const Icon(
        //     Icons.light,
        //     color: Colors.black,
        //     size: 50,
        //   ),
        // ),
        body: Stack(
          children: [
            Container(
              color: const Color.fromARGB(255, 212, 211, 211),
              // Đặt màu đỏ cho lớp dưới cùng
            ),
            const Positioned(
              left: 50,
              top: 100,
              child: Text("HI,  YNGHIA"),
            ),
            Positioned(
              top: 180,
              left: 50,
              child: Container(
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 226, 219, 219),
                  ),
                  child: Column(
                    children: [
                      Text(state_log()),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Transform.scale(
                          scale: 1.5,
                          child: Switch(
                            value: switchValue,
                            onChanged: (value) {
                              setState(() {
                                switchValue = value;
                                state_log();
                                on_turn();
                              });
                            },
                            activeColor: const Color.fromARGB(255, 30, 31,
                                31), // Màu sắc khi công tắc trượt ở trạng thái bật
                            // activeColor: Colors.grey, // Màu sắc khi công tắc trượt ở trạng thái tắt
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Positioned(
              top: 50, // Vị trí từ phía trên xuống (pixel)
              left: 230, // Vị trí từ bên trái sang (pixel)
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(20), // Bo góc với bán kính là 10
                  image: DecorationImage(
                    image: AssetImage(getImageUrl()),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 250,
                width: 200,
              ), // Hình ảnh cần hiển thị
            ),
            Positioned(
              top: 350,
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 240, 239, 238),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      const Column(
                        children: [
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 170.0),
                            child: Text(
                              "Schedule",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Text(
                                "From :",
                                style: TextStyle(
                                    fontStyle: FontStyle.normal, fontSize: 20),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "5 : 00  pm",
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "To :",
                                  style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 25.0),
                                child: Text(
                                  "5 : 00  am",
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 60),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(255, 210, 210, 208),
                          ),
                          height: 80,
                          width: 50,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add_circle_outline_rounded)),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 60),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(255, 210, 210, 208),
                          ),
                          height: 80,
                          width: 50,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete_outline_rounded)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
