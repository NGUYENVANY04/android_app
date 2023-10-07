import 'package:flutter/material.dart';

class Heart_Scien extends StatelessWidget {
  const Heart_Scien({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 62, 54, 155),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const Card(
                color: Color.fromARGB(255, 88, 84, 143),
                child: ListTile(
                  title: Text(
                    'Photoplethysmography (PPG) là một công nghệ quang học, dùng để đo những thay đổi nhỏ của mạch máu. Khi dùng ánh sáng chiếu lên vùng da và theo dõi lượng ánh sáng hấp thụ trở lại, cảm biến sẽ phân tích sự thay đổi của lưu lượng máu chảy qua.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(Icons.monitor_heart_outlined),
                ),
              ),
              const SizedBox(height: 20.0),
              const Card(
                color: Color.fromARGB(255, 88, 84, 143),
                child: ListTile(
                  title: Text(
                    'MAX30100 là cảm biến đa năng được sử dụng cho nhiều ứng dụng. Là cảm biến theo dõi nhịp tim và cũng là máy đo oxy. Cảm biến có hai diode phát sáng, một cảm biến quang (photodetector) và các linh kiện xử lý tín hiệu để phát hiện nhịp tim và đo xung oxy.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(Icons.monitor_heart_outlined),
                ),
              ),
              const SizedBox(height: 20.0),
              Card(
                child: Container(
                  height: 100, // Set the desired height
                  color: Colors.red, // Replace with your preferred color
                  child: const Center(
                    child: Text(
                      'This is a !',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
