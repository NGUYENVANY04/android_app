import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class DataFirebase extends ChangeNotifier {
  DataFirebase() : super() {
    readDataGas();
    readDataFire();
    conTrolWater();
    conTrolWind();
  }

  final data = FirebaseDatabase.instance.ref();
  late String gas = "";
  late String fire = "";
  late String wind = "";
  late String water = "";
  bool dataGas = false;
  bool dataFire = false;
  bool isShow = false;
  void showMore() {
    isShow = !isShow;
    notifyListeners();
  }

  void readDataGas() {
    data.child("state_gas").onValue.listen((event) {
      dataGas = event.snapshot.value as bool;
      if (dataGas == true) {
        dataControlWind = true;
      } else {
        dataControlWind = false;
      }
      notifyListeners();
    });
  }

  void readDataFire() {
    data.child("state_fire").onValue.listen((event) {
      dataFire = event.snapshot.value as bool;
      if (dataFire == true) {
        dataControlWater = true;
      } else {
        dataControlWater = false;
      }
      notifyListeners();
    });
  }

  bool dataControlWind = false;
  bool dataControlWater = false;

  void conTrolWind() {
    dataControlWind = !dataControlWind;
    data.update({
      "state_wind": dataControlWind,
    });
    notifyListeners();
  }

  void conTrolWater() {
    dataControlWater = !dataControlWater;
    data.update({
      "state_water": dataControlWater,
    });
    notifyListeners();
  }
}
