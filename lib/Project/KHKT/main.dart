import 'package:android_app/Project/KHKT/page/dashboard.dart';
import 'package:android_app/Project/KHKT/page/state.dart';
import 'package:android_app/Project/KHKT/page/howtouse.dart';
import 'package:android_app/Project/KHKT/page/urgent.dart';
import 'package:android_app/Project/KHKT/page/weather.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'home.dart';

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
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
              child: Icon(
                Icons.home_max_sharp,
                size: 30,
              ),
            ),
          ],
          centerTitle: true,
          title: const Text(
            'Science - Technology 2023',
            style: TextStyle(
              fontStyle: FontStyle.normal,
              color: Color.fromARGB(255, 253, 251, 251),
            ),
          ),
          // backgroundColor: const Color.fromARGB(255, 99, 82, 87),
          elevation: 20,
        ),
        body: const MyPage(),
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20,
      child: Container(
        // color: Colors.blueGrey,

        child: ListView(
          children: const [
            UserAccountsDrawerHeader(
              // arrowColor: Colors.black,
              accountName: Text(
                'Nguyễn Văn Ý',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                'Ychuot1122004@gmail.com',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              // currentAccountPicture: CircleAvatar(
              //   backgroundImage: AssetImage('.jpg'),
              // ),
              decoration: BoxDecoration(
                // color: Colors.amber,
                image: DecorationImage(
                  image: AssetImage("smarthome.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Divider(
              height: 2,
            ),
            State_House(),
            SizedBox(
              height: 20,
            ),
            Divider(),
            Dashboard(),
            SizedBox(
              height: 20,
            ),
            Divider(),
            Urgent(),
            SizedBox(
              height: 20,
            ),
            Divider(),
            Weather(),
            SizedBox(
              height: 20,
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Use(),
          ],
        ),
      ),
      // ),
    );
  }
}
