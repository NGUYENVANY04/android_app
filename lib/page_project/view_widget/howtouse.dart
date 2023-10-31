import 'package:flutter/material.dart';

class Use extends StatefulWidget {
  const Use({super.key});

  @override
  State<Use> createState() => _UseState();
}

class _UseState extends State<Use> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[600],
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: const Center(
                    // Căn giữa nội dung trong Container
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        """Thông tin về dự án : 
Dự án xoay quoanh vấn đề mang tới giải pháp giảm thiểu thiệt hại do hỏa hoạn gây ra đối với người và tài sản , bằng cách phát hiện sớm đồng thời có các thao tác kịp thời. 
Sử dụng những chức năng cơ bản nhưng mang lại hiệu quả cho người sử dụng .""",
                        textAlign:
                            TextAlign.center, // Căn giữa theo chiều ngang
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 140,
                  width: 420,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: const Center(
                    // Căn giữa nội dung trong Container
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        """Bảng điều khiển : 
                        Chứa các nút điều khiển hệ thống thông gió , phun nước dạng sương .
Đồng thời cập nhật trạng thái của cảm biến khói, lửa , gas theo thời gian thực
 giúp người sử dụng nắm được tình hình của hệ thống .""",
                        textAlign:
                            TextAlign.center, // Căn giữa theo chiều ngang
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 130,
                  width: 390,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: const Center(
                    // Căn giữa nội dung trong Container
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        """Xử lí tình huống khẩn cấp :
             Cung cấp cho người sử dụng những kĩ năng cơ bản , cần thiết 
            trong việc ứng 
            Mục đích giảm tối đa thương vong , thiệt hại cho người và tài sản .  .""",
                        textAlign:
                            TextAlign.center, // Căn giữa theo chiều ngang
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage(
                          "smarthome.jpg"), // Đường dẫn đến tệp ảnh asset của bạn
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
