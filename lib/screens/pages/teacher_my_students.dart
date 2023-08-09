import 'package:flutter/material.dart';

class TeacherMyStudents extends StatefulWidget {
  const TeacherMyStudents({super.key});

  @override
  State<TeacherMyStudents> createState() => _TeacherMyStudentsState();
}

class _TeacherMyStudentsState extends State<TeacherMyStudents> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Center(
        child: Text(" My Students List "),
      ),
    );
  }
}