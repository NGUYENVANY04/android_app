import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:firebase_core/firebase_core.dart';
// ignore: unused_import
import 'dart:math';
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
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.heart_broken,
            color: Color.fromARGB(255, 227, 18, 7),
            size: 40,
          ),
          centerTitle: true,
          title: const Text(
            'Sóng xung tim',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 85, 177, 177),
        ),
        body: Stack(
          children: [
            Container(
              color: Color.fromARGB(255, 207, 200, 223),
            ),
            Center(
              child: Container(
                width: 400,
                height: 300,
                child: const FastlineChart(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FastlineChart extends StatefulWidget {
  const FastlineChart({super.key});

  @override
  State<FastlineChart> createState() => _FastlineChartState();
}

class _FastlineChartState extends State<FastlineChart> {
  final data = FirebaseDatabase.instance.ref(); // để thao tác với data
  final auth = FirebaseDatabase.instance; // để dùng các thao tác khác

  late int bpm;
  late int time;
  List<SensorData> chartData = []; // khởi tạo 1 list
  void generateSensorData() {
    Random random = Random();

    for (int time = 1; time <= 60; time++) {
      int bpm = random.nextInt(41) + 60; // Tạo giá trị ngẫu nhiên từ 60 đến 100
      SensorData(bpm, time);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ReadDatatoMap();
  }

  void ReadDatatoMap() {
    data.child('heart').onValue.listen((event) {
      Map datas = event.snapshot.value as Map;
      setState(() {
        bpm = datas['bpm'] as int;
        time = datas['time'] as int;
        chartData.add(SensorData(bpm, time));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      backgroundColor: Color.fromARGB(255, 160, 154, 245),
      title: ChartTitle(
        text: '$bpm $time',
        alignment: ChartAlignment.center,
        backgroundColor: Colors.white,
        borderColor: Colors.transparent,
        borderWidth: 10,
      ),
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(),
      // zoomPanBehavior: false,
      series: <ChartSeries>[
        // xác định loại và dữ liệu của biểu đồ
        LineSeries<SensorData, int>(
          color: Colors.redAccent,
          width: 1,
          dataSource: chartData,
          xValueMapper: (SensorData sales, _) => sales.time,
          yValueMapper: (SensorData sales, _) => sales.bpm,
        ),
      ],
    );
  }
}

class SensorData {
  var time;
  var bpm;
  SensorData(
    this.bpm,
    this.time,
  );
}
