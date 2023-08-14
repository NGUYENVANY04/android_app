import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

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
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  final data = FirebaseDatabase.instance.ref("user");
  final auth = FirebaseDatabase.instance;

  late String displayText;
// cần initsate vì nó sẽ tự động đọc những thay đổi trong firebase dù không có
// thao tác crud
  @override
  void initState() {
    super.initState();
    readdata();
  }

// đây là thao tác lấy dữ liệu và gán nó vào hàm setstate
  readdata() {
    data.child('state').onValue.listen((event) {
      final data = event.snapshot.value;
      if (data == true) {
        setState(() {
          displayText = 'State of device is ON';
        });
      } else {
        setState(() {
          displayText = 'State of device is OFF';
        });
      }
    });
  }

// thao tác viết dữ liệu vào firebase
  void writeUserData() {
    data.set({
      "state": true,
    });
  }

// thao tác xóa
  void removeUserData() {
    data.remove();
  }

// thao tác update
  void off() {
    data.update({
      "state": false,
    });
  }

  void on() {
    data.update({
      "state": true,
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Ứng dụng điều khiển đèn gia đình',
              style: TextStyle(
                color: Color.fromARGB(255, 250, 248, 248),
              ),
            ),
            leading: const Icon(
              Icons.light,
              color: Colors.black,
              size: 50,
            ),
            actions: const [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.home_outlined,
                    color: Colors.black,
                  ),
                ],
              )
            ],
            backgroundColor: const Color.fromARGB(255, 35, 76, 159),
            shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom:
                    Radius.circular(30), // Đặt bán kính bo tròn cho phần dưới
              ),
            ),
            bottom: const TabBar(tabs: [
              Tab(text: 'Đèn sân ', icon: Icon(Icons.light_mode_rounded)),
              Tab(text: 'Đèn nhà', icon: Icon(Icons.light_rounded)),
              Tab(text: 'Trạng thái', icon: Icon(Icons.lightbulb)),
            ]),
          ),
          body: TabBarView(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://cdn.tgdd.vn/Files/2020/01/03/1229859/thiet-bi-nha-thong-minh-smarthome-la-gi-tai-sao-no-se-tro-thanh-xu-huong-cua-tuong-lai-.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: IconButton(
                  onPressed: on,
                  icon: const Icon(Icons.light_mode_sharp),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://cdn.tgdd.vn/Files/2020/01/03/1229859/thiet-bi-nha-thong-minh-smarthome-la-gi-tai-sao-no-se-tro-thanh-xu-huong-cua-tuong-lai-.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: IconButton(
                  onPressed: off,
                  icon: const Icon(Icons.lightbulb_outlined),
                ),
              ),
              Text(displayText),
            ],
          ),
        ),
      ),
    );
  }
}
