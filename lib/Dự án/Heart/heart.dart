import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'measure.dart';
import 'scien.dart';

// import '';
class MyHeart extends StatelessWidget {
  const MyHeart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 21, 38, 53),
            title: Text('My Heart'),
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Measure', icon: Icon(Icons.heart_broken_outlined)),
                Tab(text: 'History', icon: Icon(Icons.history_edu_outlined)),
                Tab(text: 'FAQ', icon: Icon(Icons.save_as_rounded)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Center(
                child: Measure(),
              ),
              Center(
                  child: Text(
                      'Step2 - Define a recursive case: Define the problem in terms of smaller subproblems. Break the problem down into smaller versions of itself, and call the function recursively to solve each subproblem.')),
              Center(
                child: Heart_Scien(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
