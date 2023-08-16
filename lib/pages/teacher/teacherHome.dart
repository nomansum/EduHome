import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:eduhome_project/constants/tuition.dart';
import 'package:eduhome_project/constants/tuition_post.dart';
import 'package:eduhome_project/pages/teacher/teacherNotification.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/my_drawer.dart';
import 'package:get/get.dart';

class TeacherHome extends StatefulWidget {
  const TeacherHome({super.key});

  @override
  State<TeacherHome> createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Tuition> tuitionList = [
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
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 10),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1581382575275-97901c2635b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80'),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Muntasir Mamun',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Get.to(()=>teacherNotification());
              },
              icon: Icon(Icons.notifications_active_outlined),
              color: Colors.black,
            ),
          ),
        ],
      ),
      endDrawer:
          MyDrawer(), //drawer for left side drawer, endDrawer for right side drawer
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                      ],
                    ),
                    Text(
                      "Tuition Posts",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState?.openEndDrawer();
                          },
                          icon: FaIcon(FontAwesomeIcons.sliders,
                              color: Color(0xFF00BFA5)),
                          //iconSize: 5,
                        ),
                        Text("Filter")
                      ],
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: tuitionList.map((item) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TuitionCard(
                        cardHeight: 200,
                        cardWidth: 333,
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
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.SUCCES,
                                      animType: AnimType.TOPSLIDE,
                                      showCloseIcon: true,
                                      title: "Congratulations",
                                      desc:
                                          "Successfully Apllied For The Tuition.",
                                      btnOkOnPress: () {
                                        //  Navigator.pop(context);
                                      },
                                    ).show();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green, // Background color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10.0), // Rounded border
                                    ),
                                    padding: EdgeInsets.all(15.0), // Padding
                                  ),
                                  child: Text(
                                    'Apply',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
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
