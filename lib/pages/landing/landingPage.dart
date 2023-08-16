import 'package:flutter/material.dart';
import 'package:eduhome_project/pages/authenticate/signInStudent.dart';
import 'package:eduhome_project/pages/authenticate/signInTeacher.dart';
import 'package:get/get.dart';
class landingPage extends StatelessWidget {
  const landingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Text('Hello'),
          Image.asset(
            "assets/LandingPage.JPG",
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 230.0),
              child: Text(
                'EduHOME',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 210.0),
              child: Text(
                'Your Gateway to knowledge.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 150.0),
              child: ElevatedButton(
                onPressed: () {
                 Get.to(()=>SignInStudent());
                },
                child: Text(
                  "Hire a Tutor",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFF00BFA5),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(270, 50),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 80.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(()=>SignInTeacher());
                },
                child: Text(
                  "Become a Tutor",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFF00BFA5),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(270, 50),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
