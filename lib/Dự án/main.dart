import 'package:flutter/material.dart';
import 'Heart/heart.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:firebase_core/firebase_core.dart';
// ignore: unused_import
import 'package:firebase_database/firebase_database.dart';
// ignore: unused_import
import 'Weather/main.dart';

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
        drawer: const NavBar(),
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
              child: Icon(
                Icons.home_outlined,
                size: 30,
              ),
            ),
          ],
          centerTitle: true,
          title: const Text(
            'TRƯỜNG THPT BẮC YÊN THÀNH ',
            style: TextStyle(
              fontStyle: FontStyle.normal,
              color: Colors.red,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 99, 82, 87),
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
      child: Container(
        color: Colors.blueGrey,
        // child: Padding(
        // padding: const EdgeInsets.fromLTRB(left, top, right, bottom),
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              // arrowColor: Colors.black,
              accountName: Text(
                'Nguyễn Văn Ý',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                'Ychuot1122004@gmail.com',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://scontent.fhan4-2.fna.fbcdn.net/v/t39.30808-6/362225789_1026826388489603_786482354978969188_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=hNG-8LiziUUAX9JhEbG&_nc_ht=scontent.fhan4-2.fna&oh=00_AfCgboKoeVEj0Y2xUTBJDOC-YzSuRIFUPBqQYN-jg373UQ&oe=64F24EC5'),
              ),
              decoration: BoxDecoration(
                // color: Colors.amber,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://scontent.fhan3-1.fna.fbcdn.net/v/t39.30808-6/257921815_640210873817825_8039806594028580779_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=e3f864&_nc_ohc=wUTFUkwFFHMAX_KMHQX&_nc_ht=scontent.fhan3-1.fna&oh=00_AfB4372O3NvhguXp6URM0nVTZJdWF4bvNBRURegILYeMrQ&oe=64F20F23'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: const Icon(Icons.monitor_heart),
              // subtitle: Text("data"), là phần bổ nghĩa cho title
              iconColor: Colors.red,
              title: const Text(
                'Heart - SpO2',
                style: TextStyle(
                  color: Color.fromARGB(255, 27, 8, 7),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyHeart()));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: const Icon(Icons.map_sharp),
              // subtitle: Text("data"), là phần bổ nghĩa cho title
              iconColor: Colors.greenAccent,
              title: const Text(
                'Định vị ',
                style: TextStyle(
                  color: Color.fromARGB(255, 27, 8, 7),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyHeart()));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: const Icon(Icons.cloud),
              // subtitle: Text("data"), là phần bổ nghĩa cho title
              iconColor: const Color.fromARGB(255, 178, 139, 136),
              title: const Text(
                'Weather ',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const weather()));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: const Icon(Icons.smoking_rooms_sharp),
              // subtitle: Text("data"), là phần bổ nghĩa cho title
              iconColor: const Color.fromARGB(255, 90, 75, 74),
              title: const Text(
                'Bụi Mịn',
                style: TextStyle(
                  color: Color.fromARGB(255, 27, 8, 7),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyHeart()));
              },
            ),
          ],
        ),
      ),
      // ),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Container(
          color: Color.fromARGB(255, 229, 223, 223),
        ),
        Center(
          child: Container(
            height: 500,
            width: 450,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    // height: 60,
                    // width: 30,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 190, 184, 184),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: const Center(child: Text("data")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    // height: 60,
                    // width: 30,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 190, 184, 184),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: const Center(child: Text("data")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    // height: 60,
                    // width: 30,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 190, 184, 184),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: const Center(child: Text("data")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    // height: 60,
                    // width: 30,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 190, 184, 184),
                      // color: Colors.redAccent,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: const Center(child: Text("data")),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
