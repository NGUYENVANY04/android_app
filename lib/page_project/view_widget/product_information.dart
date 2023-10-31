import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 400.0, // Điều chỉnh kích thước chiều rộng theo ý muốn
                height: 200.0, // Điều chỉnh kích thước chiều cao theo ý muốn
                margin: const EdgeInsets.only(
                  top: 30.0,
                  bottom: 64.0,
                  left: 15,
                  right: 15,
                ),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage(
                        "assets/smarthome.jpg"), // Đường dẫn đến tệp ảnh asset của bạn
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 100,
                color: Colors.grey,
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      '''Thông tin dự án  
                      Dự án xoay quoanh vấn đề mang tới giải pháp giảm thiểu 
                      thiệt hại do hỏa hoạn gây ra đối với người
                       và tài sản...''',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                height: 100,
                color: Colors.grey,
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Chữ đủ vừa',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 200,
                height: 100,
                color: Colors.grey,
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Chữ đủ vừa',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 200,
                height: 100,
                color: Colors.grey,
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Chữ đủ vừa',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
