// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:provider/provider.dart';

// class DataFirebase extends ChangeNotifier {
//   // DataFirebase() : super() {
//   //   conTrolWind();
//   //   readDataFire();
//   // }

//   final data = FirebaseDatabase.instance.ref();
//   // late String gas = "";
//   // late String fire = "";
//   // late String wind = "";
//   // late String water = "";
//   bool dataControlWind = false;
//   bool dataControlWater = false;
//   // bool isShow = true;
//   // void showMore() {
//   //   isShow = !isShow;
//   //   notifyListeners();
//   // }

//   void conTrolWind() {
//     dataControlWind = !dataControlWind;
//     data.update({
//       "state_wind": dataControlWind,
//     });
//     notifyListeners();
//   }

//   void conTrolWater() {
//     dataControlWater = !dataControlWater;
//     data.update({
//       "state_water": dataControlWater,
//     });
//     notifyListeners();
//   }
// }
