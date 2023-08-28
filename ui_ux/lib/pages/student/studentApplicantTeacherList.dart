import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ui_ux/models/Student.dart';
import 'package:ui_ux/models/advertisement.dart';
import 'package:ui_ux/models/teacher2.dart';
import 'package:ui_ux/pages/student/services/student_services.dart';
import 'package:ui_ux/provider/student_provider.dart';
import 'package:ui_ux/widgets/student/applicant_list.dart';

class ApplicantList extends StatefulWidget {
  final Advertisement advertisement;
  final Function(List<Advertisement> updatedAdvertisements)
      onUpdateAdvertisements;
  final List<Advertisement> fetchedPosts;

  const ApplicantList({
    required this.advertisement,
    required this.onUpdateAdvertisements,
    required this.fetchedPosts,
    Key? key,
  }) : super(key: key);
  @override
  State<ApplicantList> createState() => _ApplicantListState();
}

class _ApplicantListState extends State<ApplicantList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Teacher2> applicants = [];
  String studentId = "";
  Student? currentStudent = StudentUser.getCurrentStudentUser();
  @override
  void initState() {
    super.initState();
    studentId = currentStudent!.id;
    fetchApplicants();
  }

  Future<void> fetchApplicants() async {
    try {
      // print("We are here");
      // print('Advertisement ID: ${widget.advertisement.id}');
      List<Teacher2> fetchedApplicants =
          await ApiService().getAllApplicants(widget.advertisement.id);

      //    print('Fetched Applicants: $fetchedApplicants');

      setState(() {
        applicants = fetchedApplicants;
      });
    } catch (e) {
      print('Error fetching applicants: $e');
    }
  }

  Future<void> _acceptApplicant(String teacherId) async {
    try {
      bool success = await ApiService()
          .acceptApplicant(studentId, teacherId, widget.advertisement.id);
      if (success) {
        setState(() {
          widget.advertisement.booked = true;
        });

        List<Advertisement> updatedPosts = List.from(widget.fetchedPosts);
        updatedPosts.forEach((ad) {
          if (ad.id == widget.advertisement.id) {
            ad.booked = true;
          }
        });

        widget.onUpdateAdvertisements(updatedPosts);

        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.topSlide,
          showCloseIcon: true,
          title: 'Success',
          desc: 'Applicant accepted Successfully.',
          btnOkOnPress: () {
            Navigator.pop(context, updatedPosts);
          },
        ).show();
      }
    } catch (error) {
      //error
      print("Error!Error!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SafeArea(
                child: TextButton(
                  child: Text(
                    '< Applicant List',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'Applicants',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: applicants.map((teacher) {
                      return ApplicantListCard(
                        teacherName: teacher.fullName,

                        starRating:
                            '${teacher.calculateMeanRating().toStringAsFixed(1)}',
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
                        //   'https://images.unsplash.com/photo-1581382575275-97901c2635b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80', //teacher.picturePath,
                        onAcceptPressed: () {
                          _acceptApplicant(teacher.id);
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
