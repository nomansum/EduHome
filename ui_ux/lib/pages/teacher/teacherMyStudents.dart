import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_ux/models/Teacher.dart';
import 'package:ui_ux/models/student2.dart';
import 'package:ui_ux/pages/teacher/services/teacher_services.dart';
import 'package:ui_ux/pages/teacher/teacherNotification.dart';
import 'package:ui_ux/provider/teacher_provider.dart';
import 'package:ui_ux/widgets/myStudentsCard.dart';

class teacherMyStudents extends StatefulWidget {
  const teacherMyStudents({super.key});

  @override
  State<teacherMyStudents> createState() => _teacherMyStudentsState();
}

class _teacherMyStudentsState extends State<teacherMyStudents> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Student2> myStudents = [];

  String picturePath = '';
  String fullName = '';
  String teacherId = '';

  Teacher? currentTeacher = TeacherUser.getCurrentTeacherUser();

  @override
  void initState() {
    super.initState();
    fullName = currentTeacher!.fullName;
    picturePath = currentTeacher!.picturePath.toString();
    teacherId = currentTeacher!.id;
    fetchMyStudentsForTeacher();
  }

  Future<void> fetchMyStudentsForTeacher() async {
    try {
      List<Student2> fetchedMyStudents = await ApiService()
          .fetchMyStudentsForTeacher('$teacherId'); //giving teacherID
      setState(() {
        myStudents = fetchedMyStudents;
      });
    } catch (e) {
      print('Error fetching tuition offers: $e');
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
              //  'https://images.unsplash.com/photo-1581382575275-97901c2635b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80',
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hola!",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            Text(
              fullName,
              style: TextStyle(fontSize: 18, color: Colors.black),
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
                    builder: (context) => teacherNotification(),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'My Students',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 23,
                  decoration: TextDecoration.underline,
                  //  fontFamily: "Poppins",
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SingleChildScrollView(
              child: Column(
                children: myStudents.map((student) {
                  return MyStudentCard(
                    studentName: student.fullName,
                    classNumber: student.classStudies,
                    phoneNumber: student.phoneNumber,
                    location: student.location,
                    imageUrl: student.picturePath,
                    //     'https://images.unsplash.com/photo-1581382575275-97901c2635b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80',
                    // image: student.picturePath.isNotEmpty
                    //     ? NetworkImage(student.picturePath)
                    //     : null,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
