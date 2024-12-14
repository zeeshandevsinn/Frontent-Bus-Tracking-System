import 'package:bus_tracking_management_system/screens/dashboard_screen.dart';
import 'package:bus_tracking_management_system/screens/login_screen.dart';
import 'package:bus_tracking_management_system/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late String title;
   late Widget currentScreen;

   @override
  void initState() {
    title = "DashBoard";
    currentScreen =  StudentDashboard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       theme: ThemeData(
          useMaterial3: false,
          primarySwatch: Colors.blue,
        ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}
