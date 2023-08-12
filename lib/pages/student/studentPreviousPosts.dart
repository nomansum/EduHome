import 'package:eduhome_project/constants/tuition.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eduhome_project/pages/student/studentApplicantTeacherList.dart';
import 'package:eduhome_project/pages/student/studentEditTuitionPost.dart';


class StudentPosts extends StatefulWidget {
  const StudentPosts({super.key});

  @override
  State<StudentPosts> createState() => _StudentPostsState();
}

class _StudentPostsState extends State<StudentPosts> {
  var fetchedPosts = [
    Tuition(
        id: "23sdf",
        preferredGender: "Male",
        daysInWeek: 4,
        salary: 9000,
        studentClass: "12",
        subjects: "Phy,Math",
        address: "sylhet",
        booked: false),
    Tuition(
        id: "23s23df",
        preferredGender: "FMale",
        daysInWeek: 4,
        salary: 9000,
        studentClass: "12",
        subjects: "Chem,Math",
        address: "amborkahan0",
        booked: true),
    Tuition(
        id: "23sasdfdf",
        preferredGender: "FMale",
        daysInWeek: 4,
        salary: 9000,
        studentClass: "12",
        subjects: "Bio,Phy",
        address: "sylhet",
        booked: false),
    Tuition(
        id: "23sdsdfaf",
        preferredGender: "FMale",
        daysInWeek: 4,
        salary: 9000,
        studentClass: "12",
        subjects: "Math",
        address: "sylhet",
        booked: true),
    Tuition(
        id: "23sasdfdf",
        preferredGender: "FMale",
        daysInWeek: 4,
        salary: 9000,
        studentClass: "12",
        subjects: "Organic",
        address: "sylhet",
        booked: false),
    Tuition(
        id: "23asdfsdf",
        preferredGender: "FMale",
        daysInWeek: 4,
        salary: 9000,
        studentClass: "12",
        subjects: "C",
        address: "sylhet",
        booked: true)
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SafeArea(
                    child: TextButton(
                      child: Text(
                        '< My Posts',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w800,
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
                height: 10,
              ),
              Center(
                child: Text(
                  "Previous Posts",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: fetchedPosts.map((item) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 200,
                        width: 333,
                        decoration: BoxDecoration(
                            color: item.booked
                                ? Colors.red.shade300
                                : Colors.greenAccent.shade100,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: item.booked
                                  ? Colors.redAccent.shade700
                                  : Colors.green.shade600,
                            )),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Need Tutor For Class ${item.studentClass} Student",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 21),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "${item.daysInWeek} Days/Week",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 21),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Row(
                                children: [
                                  Text(
                                    "Salary: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17),
                                  ),
                                  Text(
                                    "${item.salary} BDT",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Row(
                                children: [
                                  Text(
                                    "Subjects: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17),
                                  ),
                                  Text(
                                    "${item.subjects}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Row(
                                children: [
                                  Text(
                                    "Preferred Tutor: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17),
                                  ),
                                  Text(
                                    "${item.preferredGender}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Row(
                                children: [
                                  Text(
                                    "Location: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17),
                                  ),
                                  Text(
                                    "${item.address}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      item.booked
                                          ? SizedBox(
                                              width: 0,
                                            )
                                          : IconButton(
                                              onPressed: () {
                                                // EDIT  BUTTON
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        EditTuitionPost(),
                                                  ),
                                                );
                                              },
                                              icon: FaIcon(
                                                  FontAwesomeIcons.penToSquare,
                                                  color: item.booked
                                                      ? Colors.red.shade900
                                                      : Colors.greenAccent
                                                          .shade700)),
                                      IconButton(
                                          onPressed: () {
                                            // POST DELETE BUTTON
                                          },
                                          icon: FaIcon(
                                              FontAwesomeIcons.trashCan,
                                              color: item.booked
                                                  ? Colors.red.shade900
                                                  : Colors
                                                      .greenAccent.shade700)),
                                    ],
                                  ),
                                ),
                                item.booked
                                    ? SizedBox(
                                        width: 95,
                                      )
                                    : SizedBox(
                                        width: 50,
                                      ),
                                Container(
                                  child: Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ApplicantList(),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                          primary: item.booked
                                              ? Colors.red.shade700
                                              : Colors
                                                  .green, // Background color
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            // Rounded border
                                            side: BorderSide(
                                                color: item.booked
                                                    ? Colors.red.shade900
                                                    : Colors.green.shade600,
                                                width: 2.0),
                                          ),
                                          padding: EdgeInsets.all(15.0),
                                          elevation: 4 // Padding
                                          ),
                                      child: Text(
                                        item.booked ? "BOOKED" : "APPLICANTS",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                )
                              ],
                            )
                          ],
                        )),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
