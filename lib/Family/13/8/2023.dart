import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

//hihi
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
  final data = FirebaseDatabase.instance.ref("user");
  final auth = FirebaseDatabase.instance;
  // ignore: non_constant_identifier_names
  late bool state_device;
  String test = 'hi';
  @override
  void initState() {
    super.initState();
    read_data();
  }

  // ignore: non_constant_identifier_names
  void read_data() {
    data.child('state').onValue.listen((event) {
      // final datas = event.snapshot.value;
      // state_device = data as bool;
      // phần này không cần thiết vì đây chỉ là check trạng đọc từ firebase thôi
      setState(() {
        state_device = event.snapshot.value as bool;
      });
    });
  }

  // ignore: non_constant_identifier_names
  void on_turn() {
    data.update({
      "state": !state_device,
    });
  }

  String getImageUrl() {
    return state_device
        ? 'https://media.istockphoto.com/id/1330730166/vi/vec-to/b%C3%B3ng-%C4%91%C3%A8n-ph%E1%BA%B3ng-b%E1%BA%ADt-v%C3%A0-t%E1%BA%AFt-v%E1%BB%9Bi-c%C3%B4ng-t%E1%BA%AFc-%C4%91%C3%A8n.jpg?s=1024x1024&w=is&k=20&c=YdtHVWRPjj8c1uqMidLZXczGDGx6kpYa3EW79_qMIsU='
        : 'https://media.istockphoto.com/id/1330729501/vi/vec-to/b%C3%B3ng-%C4%91%C3%A8n-ph%E1%BA%B3ng-b%E1%BA%ADt-v%C3%A0-t%E1%BA%AFt-v%E1%BB%9Bi-c%C3%B4ng-t%E1%BA%AFc-%C4%91%C3%A8n.jpg?s=1024x1024&w=is&k=20&c=UZr4GieCTolKXoAzFFobrmK1OlehKnyazElu-vpEHrg=';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter learn',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(getImageUrl()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            GestureDetector(onTap: () {
              on_turn();
            }),
            // Text('$state_device'),
          ],
        ),
      ),
    );
  }
}
