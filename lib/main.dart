import 'package:flutter/material.dart';
import 'package:eduhome_project/pages/landing/landingPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/studentHome',
      // routes: {
      //   '/studentNotifications': (context) => studentNotification(),
      //   '/studentHome': (context) => studentHome(),
      // },
      home: landingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
