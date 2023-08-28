import 'package:ui_ux/constants/tuition.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_ux/models/Student.dart';
import 'package:ui_ux/models/advertisement.dart';
import 'package:ui_ux/pages/student/services/student_services.dart';
import 'package:ui_ux/pages/student/studentApplicantTeacherList.dart';
import 'package:ui_ux/pages/student/studentEditTuitionPost.dart';
import 'package:ui_ux/provider/student_provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import "package:get/get.dart";

class StudentPosts extends StatefulWidget {
  const StudentPosts({super.key});

  @override
  State<StudentPosts> createState() => _StudentPostsState();
}

class _StudentPostsState extends State<StudentPosts> {
  List<Advertisement> fetchedPosts = [];

  String studentId = '';

  Student? currentStudent = StudentUser.getCurrentStudentUser();

  @override
  void initState() {
    super.initState();
    studentId = currentStudent!.id;
// Add this print statement
    print('StudentPosts initState called');
    fetchAdvertisements();
  }

  Future<void> fetchAdvertisements() async {
    try {
      final myAdvertisements =
          await ApiService().fetchMyAdvertisements('$studentId');
      setState(() {
        fetchedPosts = myAdvertisements;
      });
      print('Fetched Advertisements: $fetchedPosts');
    } catch (error) {
      print('Error fetching advertisements: $error');
    }
  }

  Future<void> _deleteAdvertisement(String advertisementId) async {
    try {
      await ApiService().deleteAdvertisement(studentId, advertisementId);
      setState(() {
        // Remove the deleted advertisement from the fetchedPosts list
        fetchedPosts.removeWhere((ad) => ad.id == advertisementId);
      });
    } catch (error) {
      print('Error deleting advertisement: $error');
    }
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
                children: fetchedPosts.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  print('Item ${item.id} - Booked: ${item.booked}');
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 208,
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
                              "Need Tutor For Class ${item.classNumber} Student",
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
                                    "${item.teacherGender}",
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
                                    "${item.location}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
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
                                              onPressed: () async {
                                                // EDIT  BUTTON

                                                var updatedPosts =
                                                    await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        EditTuitionPost(
                                                      advertisement: item,
                                                      onUpdateAdvertisements:
                                                          (updatedAdvertisements) {
                                                        setState(() {
                                                          fetchedPosts = List<
                                                                  Advertisement>.from(
                                                              updatedAdvertisements);
                                                        });
                                                      },
                                                      fetchedPosts:
                                                          fetchedPosts,
                                                    ),
                                                  ),
                                                );

                                                if (updatedPosts != null) {
                                                  setState(() {
                                                    fetchedPosts = List<
                                                            Advertisement>.from(
                                                        updatedPosts);
                                                  });
                                                }
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
                                            AwesomeDialog(
                                              context: context,
                                              dialogType: DialogType.warning,
                                              animType: AnimType.topSlide,
                                              showCloseIcon: true,
                                              title: "Warning",
                                              desc:
                                                  "Are you sure you want to delete the Advertisement?",
                                              btnCancelOnPress: () {},
                                              btnOkText: "Yes",
                                              btnOkOnPress: () {
                                                _deleteAdvertisement(item.id);
                                              },
                                            ).show();
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
                                      //applicant
                                      onPressed: () async {
                                        var updatedPosts = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ApplicantList(
                                              advertisement: item,
                                              onUpdateAdvertisements:
                                                  (updatedAdvertisements) {
                                                setState(() {
                                                  fetchedPosts = List<
                                                          Advertisement>.from(
                                                      updatedAdvertisements);
                                                });
                                              },
                                              fetchedPosts: fetchedPosts,
                                            ),
                                          ),
                                        );

                                        if (updatedPosts != null) {
                                          setState(() {
                                            fetchedPosts =
                                                List<Advertisement>.from(
                                                    updatedPosts);
                                          });
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: item.booked
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
