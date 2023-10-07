import 'dart:developer';

import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LightControlViewModel extends ChangeNotifier {
  LightControlViewModel() : super() {
    getSchedule();
  }

  DatabaseReference hourDB = FirebaseDatabase.instance.ref('hour');
  DatabaseReference minuteDB = FirebaseDatabase.instance.ref('minute');
  int hourFrom = 0;
  int minuteFrom = 0;

  bool isActice = true;
  Time time = Time(hour: 11, minute: 30, second: 20);
  void onTimeChanged(Time newTime) {
    time = newTime;
    notifyListeners();
  }

  void setSchedule(DateTime dateTime) {
    int hour = dateTime.hour.toInt();
    int minute = dateTime.minute.toInt();
    hourFrom = hour;
    minuteFrom = minute;
    log("h=$hour mi=$minute");
    try {
      hourDB.set(hour);
      minuteDB.set(minute);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> getSchedule() async {
    try {
      final snapshot = await hourDB.get();
      // hourFrom = int.parse(data.toString());
      if (snapshot.exists) {
        hourFrom = int.parse(snapshot.value.toString());
      } else {
        hourFrom = 0;
      }
      final snapshot2 = await minuteDB.get();
      // hourFrom = int.parse(data.toString());
      if (snapshot2.exists) {
        minuteFrom = int.parse(snapshot2.value.toString());
      } else {
        minuteFrom = 0;
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  void turnLight(value) {
    isActice = value;
    notifyListeners();
  }
}
