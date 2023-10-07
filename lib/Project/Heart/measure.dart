import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:firebase_database/firebase_database.dart';

class Measure extends StatefulWidget {
  const Measure({super.key});

  @override
  State<Measure> createState() => _Measure();
}

class _Measure extends State<Measure> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              color: const Color.fromARGB(255, 73, 71, 79),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://1.bp.blogspot.com/-i7kllY8gBIA/W8MZdRuEw5I/AAAAAAAAU2Y/e8JmNLrFy-on8pEcFn3n7IH7ywtLWrB0gCLcBGAs/s1600/3-amazing-ideas-how-to-draw-heart-using-adobe-illustrator.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => How_to_use()));
                },
                child: Container(
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Start Measure',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            )
            // Container(
            //   width: 400,
            //   height: 300,
            //   child: const HeartLine(),
          ],
        ),
      ),
    );
  }
}

class How_to_use extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'How to use ',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 25, 53, 77),
      ),
      body: Container(
        color: const Color.fromARGB(255, 25, 53, 77),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 450,
                height: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://scontent.fhan3-5.fna.fbcdn.net/v/t39.30808-6/309437881_519574770175596_409101457472562192_n.png?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=4DcehHtObegAX_voRzD&_nc_ht=scontent.fhan3-5.fna&oh=00_AfCH5wvrhRpQoHa-8cxt-X7MuA04M4OoQKRev931AopSkw&oe=64E9E804'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "1. Khởi động đồng hồ và cố định nó lên phần cổ tay . Bạn nên đặt đúng vị trí để có được giá trị đo chính xác nhất",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "2. Open the Apple Watch app on your iPhone and follow the prompts to pair the devices.",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "3. Open the Apple Watch app on your iPhone and follow the prompts to pair the devices.",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "4. You can customize it by pressing firmly on the display and selecting different watch faces",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HeartLine()));
                  },
                  child: const Text('Start now'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HeartLine extends StatefulWidget {
  const HeartLine({super.key});

  @override
  State<HeartLine> createState() => _HeartLine();
}

class _HeartLine extends State<HeartLine> {
  final data = FirebaseDatabase.instance.ref(); // để thao tác với data
  final auth = FirebaseDatabase.instance; // để dùng các thao tác khác

  late int bpm;
  late int time;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ReadDatatoMap();
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sóng xung tim '),
        // backgroundColor: Colors.,
      ),
      body: SfCartesianChart(
        backgroundColor: Color.fromARGB(255, 56, 55, 62),

        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(),
        // zoomPanBehavior: false,
        series: <ChartSeries>[
          // xác định loại và dữ liệu của biểu đồ
          LineSeries<SensorData, String>(
            color: Colors.redAccent,
            width: 1,
            dataSource: chartData,
            xValueMapper: (SensorData sales, _) => sales.time,
            yValueMapper: (SensorData sales, _) => sales.bpm,
          ),
        ],
      ),
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

List<SensorData> chartData = [
  SensorData(55, '0s'),
  SensorData(55, '1s'),
  SensorData(85, '2s'),
  SensorData(53, '3s'),
  SensorData(95, '4s'),
  SensorData(50, '5s'),
  SensorData(30, '6s'),
  SensorData(67, '7s'),
  SensorData(82, '8s'),
  SensorData(63, '9s'),
  SensorData(55, '10s'),
  SensorData(57, '11s'),
  SensorData(85, '12s'),
  SensorData(53, '13s'),
  SensorData(95, '14s'),
  SensorData(50, '15s'),
  SensorData(46, '16s'),
  SensorData(67, '17s'),
  SensorData(82, '18s'),
  SensorData(63, '19s'),
  SensorData(55, '20s'),
  SensorData(57, '21s'),
  SensorData(85, '22s'),
  SensorData(53, '23s'),
  SensorData(95, '24s'),
  SensorData(50, '25s'),
  SensorData(60, '26s'),
  SensorData(67, '27s'),
  SensorData(82, '28s'),
  SensorData(63, '29s'),
  SensorData(55, '30s'),
  SensorData(57, '31s'),
  SensorData(85, '32s'),
  SensorData(53, '33s'),
  SensorData(95, '34s'),
  SensorData(50, '35s'),
  SensorData(47, '36s'),
  SensorData(67, '37s'),
  SensorData(82, '38s'),
  SensorData(63, '39s'),
  SensorData(55, '40s'),
  SensorData(57, '41s'),
  SensorData(85, '42s'),
  SensorData(53, '43s'),
  SensorData(95, '44s'),
  SensorData(50, '45s'),
  SensorData(59, '46s'),
  SensorData(67, '47s'),
  SensorData(82, '48s'),
  SensorData(63, '49s'),
  SensorData(55, '50s'),
  SensorData(57, '51s'),
  SensorData(85, '52s'),
  SensorData(53, '53s'),
  SensorData(95, '54s'),
  SensorData(50, '55s'),
  SensorData(70, '56s'),
  SensorData(67, '57s'),
  SensorData(82, '58s'),
  SensorData(63, '59s'),
  SensorData(55, '60s'),
]; // khởi tạo 1 list
