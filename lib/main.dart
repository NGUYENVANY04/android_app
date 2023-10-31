import 'package:android_app/home.dart';
import 'package:android_app/page_project/view_mode/data_firebase.dart';
import 'package:android_app/page_project/view_mode/data_temp.dart';
import 'package:android_app/page_project/view_widget/temp_widget.dart';
import 'package:android_app/page_project/view_widget/widget_dashboard.dart';
import 'package:android_app/page_project/view_widget/widget_state_device.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataFirebase>(
          create: (_) => DataFirebase(),
          child: const StateHouse(),
        ),
        ChangeNotifierProvider<InfoViewModel>(
          create: (_) => InfoViewModel(),
          child: const InfoWidget(),
        ),
        ChangeNotifierProvider<DataFirebase>(
          create: (_) => DataFirebase(),
          child: const StateDevice(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
