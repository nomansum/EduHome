import 'package:flutter/material.dart';

class TeacherNotifications extends StatefulWidget {
  const TeacherNotifications({super.key});

  @override
  State<TeacherNotifications> createState() => _TeacherNotificationsState();
}

class _TeacherNotificationsState extends State<TeacherNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Teacher Notification"),
            TextButton(onPressed:(){Navigator.pop(context);},
            child: Text("Back"),)
          ],
        ),
      ),
    );
  }
}