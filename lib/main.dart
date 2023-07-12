import 'package:eduhome_project/screens/authenticate/sign_in.dart';
import 'package:eduhome_project/screens/authenticate/student_register.dart';
import 'package:eduhome_project/screens/authenticate/teacher_register.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TeacherRegister(),
    );
  }
}
