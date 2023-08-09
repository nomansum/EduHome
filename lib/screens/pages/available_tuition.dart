import 'package:flutter/material.dart';

class AvailableTuition extends StatefulWidget {
  const AvailableTuition({super.key});

  @override
  State<AvailableTuition> createState() => _AvailableTuitionState();
}

class _AvailableTuitionState extends State<AvailableTuition> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Center(
        child: Text(" Available Tuitions "),
      ),
    );
  }
}