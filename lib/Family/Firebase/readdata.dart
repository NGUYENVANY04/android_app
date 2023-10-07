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
}

class LogData {
  String state;
  LogData(this.state);

  final data = FirebaseDatabase.instance.ref();
  final auth = FirebaseDatabase.instance;

  // Phương thức để đọc dữ liệu từ Firebase
  Future<String> readdata() async {
    try {
      data.child("led").onValue.listen((event) {
        final data = event.snapshot.value;
      });
      return state.toString();
    } catch (e) {
      print("Error reading data from Firebase: $e");
      return state; // Trả về một giá trị mặc định nếu có lỗi
    }
  }
}
