import 'package:flutter/material.dart';
import 'package:ui_ux/models/Student.dart';
import 'package:ui_ux/models/teacher2.dart';
import 'package:ui_ux/pages/student/services/student_services.dart';
import 'package:ui_ux/pages/student/studentNotificationPage.dart';
import 'package:ui_ux/pages/student/studentRateTeacher.dart';
import 'package:ui_ux/provider/student_provider.dart';
import 'package:ui_ux/widgets/student/my_tutors.dart';

class studentMyTutors extends StatefulWidget {
  const studentMyTutors({super.key});

  @override
  State<studentMyTutors> createState() => _studentMyTutorsState();
}

class _studentMyTutorsState extends State<studentMyTutors> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Teacher2> myTeachers = [];

  String picturePath = '';
  String fullName = '';
  String studentId = '';

  Student? currentStudent = StudentUser.getCurrentStudentUser();

  @override
  void initState() {
    super.initState();
    picturePath = currentStudent!.picturePath.toString();
    fullName = currentStudent!.fullName;
    studentId = currentStudent!.id;

    fetchMyTeachersForStudent();
  }

  Future<void> fetchMyTeachersForStudent() async {
    try {
      List<Teacher2> fetchedMyTeachers =
          await ApiService().fetchMyTeachersForStudent('$studentId');
      setState(() {
        myTeachers = fetchedMyTeachers;
      });
    } catch (e) {
      print('Error fetching teachers: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 10),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              picturePath,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fullName,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => studentNotification(),
                  ),
                );
              },
              icon: Icon(Icons.notifications_active_outlined),
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'My Teachers',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      decoration: TextDecoration.underline),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                child: Column(
                  children: myTeachers.map((teacher) {
                    return MyTutorsCard(
                      teacherName: teacher.fullName,
                      starRating:
                          '${teacher.calculateMeanRating().toStringAsFixed(1)}', // Replace with actual star rating
                      gender: teacher.gender, // Replace with actual subjects
                      experience:
                          teacher.experience, // Replace with actual experience
                      education:
                          teacher.institution, // Replace with actual education
                      occupation:
                          teacher.occupation, // Replace with actual occupation
                      subject: teacher.subject, // Replace with actual subject
                      location:
                          teacher.location, // Replace with actual location
                      profileImage: teacher.picturePath,
                      //    'https://images.unsplash.com/photo-1581382575275-97901c2635b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80', //teacher.picturePath,
                      onRatingPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RateTeacher(
                              teacherId: teacher.id,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
