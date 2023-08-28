import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_ux/constants/filter_object_student.dart';
import 'package:ui_ux/models/Student.dart';
import 'package:ui_ux/models/student2.dart';
import 'package:ui_ux/models/teacher2.dart';
import 'package:ui_ux/pages/student/services/student_services.dart';
import 'package:ui_ux/pages/student/studentNotificationPage.dart';
import 'package:ui_ux/pages/student/studentOfferTeacherPage.dart';
import 'package:ui_ux/provider/student_provider.dart';
import 'package:ui_ux/widgets/student/teacher_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../widgets/student/student_my_drawer.dart';
import 'package:ui_ux/constants/ip.dart';

class studentHome extends StatefulWidget {
  const studentHome({super.key});

  @override
  State<studentHome> createState() => _studentHomeState();
}

class _studentHomeState extends State<studentHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ApiService _apiService = ApiService();

  final TextEditingController textController = TextEditingController();

  List<Teacher2> teachers = [];
  List<Teacher2> filteredTeachers = [];

  bool isSearching = false;

  String picturePath = '';
  String fullName = '';

  Student? currentStudent = StudentUser.getCurrentStudentUser();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullName = currentStudent!.fullName;
    picturePath = currentStudent!.picturePath.toString();

    textController.addListener(_onSearchTextChanged);

    fetchTeachers();
  }

  Future<void> fetchTeachers() async {
    try {
      List<Teacher2> fetchedTeachers =
          await _apiService.getALlTeachers(context);
      setState(() {
        teachers = fetchedTeachers;
      });
    } catch (e) {
      print('Error fetching teachers: $e');
    }
  }

  // void _onSearchTextChanged() {
  //   String searchText = textController.text.toLowerCase();
  //   setState(() {
  //     if (searchText.isNotEmpty) {
  //       isSearching = true;
  //       filteredTeachers = teachers
  //           .where((teacher) =>
  //               teacher.fullName.toLowerCase().contains(searchText) ||
  //               teacher.teachingSubject.any(
  //                   (subject) => subject.toLowerCase().contains(searchText)))
  //           .toList();
  //     } else {
  //       isSearching = false;
  //     }
  //   });
  // }
  
  //implemented this in submission hackathon
  void _onSearchTextChanged() {
    String searchText = textController.text.toLowerCase();
    setState(() {
      if (searchText.isNotEmpty) {
        isSearching = true;
        filteredTeachers = teachers
            .where((teacher) =>
                teacher.fullName.toLowerCase().contains(searchText) ||
                teacher.institution.toLowerCase().contains(searchText) ||
                teacher.teachingSubject.any(
                    (subject) => subject.toLowerCase().contains(searchText)))
            .toList();
      } else {
        isSearching = false;
      }
    });
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
            backgroundImage: NetworkImage(picturePath),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back',
              style: TextStyle(
                color: Colors.black87,
                //     fontFamily: 'Poppins',
              ),
            ),
            Text(
              fullName,
              style: Theme.of(context).textTheme.bodyText1,
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

      //drawer for left side drawer, endDrawer for right side drawer

      endDrawer: StudentMyDrawer(
        onDataSelected: (FilterObjectStudent selectedData) async {
          //      print(selectedData.teachingSubject);
          final url = Uri.parse('${ip}/filter/getTutors');
          final headers = <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          };
          final data = selectedData.toJson();

          try {
            var response = await http.post(
              url,
              headers: headers,
              body: data,
            );

            if (response.statusCode == 200) {
              var responseData = jsonDecode(response.body);
              // print(responseData.toString());
              List<Teacher2> fetchedTeacher = List<Teacher2>.from(
                  responseData.map((data) => Teacher2.fromJson(data)));
              setState(() {
                filteredTeachers = fetchedTeacher;
                //   print(filteredTeachers.toString());
              });
            } else {
              print('Error: Request failed with status ${response.statusCode}');
            }
          } catch (e) {
            print('Error: $e');
          }
        },
        applyFilters: () {
          Navigator.pop(context); // Close the drawer
        },
        clearFilters: () {
          setState(() {
            filteredTeachers = teachers;
          });
          Navigator.pop(context); // Close the drawer
        },
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    width: MediaQuery.of(context).size.width - 64,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: textController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search Teacher Name or Subject',
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    icon: FaIcon(FontAwesomeIcons.sliders,
                        color: Color(0xFF00BFA5)),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Teachers',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
              SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: (isSearching || filteredTeachers.isNotEmpty
                          ? filteredTeachers
                          : teachers)
                      .map((teacher) {
                    return TeacherListCard(
                      teacher: teacher,
                      teacherName: teacher.fullName,
                      subjects: teacher.teachingSubject.join(', '),
                      experience: teacher.experience,
                      salaryRange:
                          '${teacher.minSalary} - ${teacher.maxSalary}',
                      occupation: teacher.occupation,
                      education: teacher.institution,
                      subject:
                          teacher.subject.isNotEmpty ? teacher.subject : "",
                      location: teacher.location,
                      profileImage: teacher.picturePath,
                      onOfferPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OfferTeacher(
                              teacherId: teacher.id,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
