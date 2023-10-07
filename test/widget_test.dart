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
  runApp(LivingRoomViewModel() as Widget);
}

class LivingRoomViewModel extends ChangeNotifier {
  LivingRoomViewModel() : super() {
    getLightData();
  }

  DatabaseReference ledRef = FirebaseDatabase.instance.ref('led');

  List<DeviceModel> devices = [
    DeviceModel(
        name: 'Smart Spotlight',
        isActive: false,
        color: "#ff5f5f",
        icon: 'assets/svg/light.svg'),
    DeviceModel(
        name: 'Smart AC',
        isActive: true,
        color: "#7739ff",
        icon: 'assets/svg/ac.svg'),
    DeviceModel(
        name: 'Smart TV',
        isActive: false,
        color: "#c9c306",
        icon: 'assets/svg/tv.svg'),
    DeviceModel(
        name: 'Smart Sound',
        isActive: false,
        color: "#c207db",
        icon: 'assets/svg/speaker.svg'),
  ];

  bool isShow = false;

  void getLightData() {
    log("XXXXx");
    try {
      DatabaseReference starCountRef = FirebaseDatabase.instance.ref('led');
      starCountRef.onValue.listen(
        (DatabaseEvent event) {
          final data = event.snapshot.value;
          // roomTemp = int.parse(data.toString());

          log(data.toString());
          if (data == 1) {
            devices[0].isActive = true;
          } else {
            devices[0].isActive = false;
          }
          notifyListeners();
        },
      );
    } catch (e) {
      log(e.toString());
    }
  }

  void showMore() {
    isShow = !isShow;
    notifyListeners();
  }

  void changeDevices(int index) {
    devices[index] = DeviceModel(
      name: devices[index].name,
      isActive: !devices[index].isActive,
      color: devices[index].color,
      icon: devices[index].icon,
    );
    if (index == 0) {
      if (devices[index].isActive) {
        ledRef.set(1);
      } else {
        ledRef.set(0);
      }
    }
    notifyListeners();
  }
}
