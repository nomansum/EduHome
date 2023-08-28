import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ui_ux/constants/ip.dart';
import 'package:ui_ux/models/Student.dart';
import 'dart:convert';

import 'package:ui_ux/models/teacher2.dart';
import 'package:ui_ux/pages/teacher/services/teacher_services.dart';
import 'package:ui_ux/provider/student_provider.dart';

class RateTeacher extends StatefulWidget {
  final String teacherId;

  const RateTeacher({
    required this.teacherId,
  });

  @override
  State<RateTeacher> createState() => _RateTeacherState();
}

class _RateTeacherState extends State<RateTeacher> {
  int _selectedRating = 3;

  Teacher2? teacherDetails;
  String studentId = "";

  Student? currentStudent = StudentUser.getCurrentStudentUser();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    studentId = currentStudent!.id;
    fetchTeacherDetails();
  }

  Future<void> fetchTeacherDetails() async {
    try {
      Teacher2 fetchedDetails = await ApiService().fetchTeacherDetails(widget
          .teacherId); // Notice that we expect a single Teacher2 object, not a list
      if (fetchedDetails != null) {
        // Check if details are not null
        setState(() {
          teacherDetails = fetchedDetails;
          print('$teacherDetails');
        });
      }
    } catch (e) {
      print('Error fetching teacher details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SafeArea(
                child: TextButton(
                  child: Text(
                    '< Rating',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    teacherDetails?.picturePath ?? "",

                    // 'https://images.unsplash.com/photo-1581382575275-97901c2635b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80',
                  ),
                  radius: 50,
                ),
                Positioned(
                  bottom:
                      0, // Adjust this value to position the container vertically
                  right:
                      0, // Adjust this value to position the container horizontally
                  child: Container(
                    height: 26,
                    width: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star,
                              color: Color(0xFF38BBF8),
                            ),
                            Text(
                              //    "4",
                              teacherDetails != null
                                  ? teacherDetails!
                                      .calculateMeanRating()
                                      .toStringAsFixed(1)
                                  : "3",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(253, 219, 109, 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            teacherDetails?.fullName ?? "Unknown",
            // "nahid",
            //  teacherDetails!.fullName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Divider(
            height: 20,
            color: Colors.grey,
            thickness: 2,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(top: 2),
            width: 325,
            height: 50,
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
            child: DropdownButtonFormField<int>(
              value: _selectedRating,
              onChanged: (int? newValue) {
                setState(() {
                  _selectedRating = newValue ?? 3;
                });
              },
              items:
                  <int>[1, 2, 3, 4, 5].map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text('$value'),
                );
              }).toList(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  FontAwesomeIcons.pen,
                  size: 20,
                ),
                border: InputBorder.none,
                hintText: 'Give Rating',
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                final response = await http.post(
                  Uri.parse(
                      '${ip}/api/student/rateTeacher/${widget.teacherId}'),
                  headers: {"Content-Type": "application/json"},
                  body: json.encode({"rating": _selectedRating}),
                );

                if (response.statusCode == 200) {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.success,
                    animType: AnimType.topSlide,
                    showCloseIcon: true,
                    title: "Success",
                    desc: "Rating Submitted Successfully.",
                    btnOkOnPress: () {
                      Navigator.pop(context);
                    },
                  ).show();
                }
              } catch (e) {
                //handle error
              }
            },
            child: Text('Give Rating'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Color(0xFF00BFA5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
