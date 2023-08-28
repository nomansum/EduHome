import 'package:flutter/material.dart';
import 'package:ui_ux/pages/student/studentPostTuition.dart';
import 'package:ui_ux/pages/student/studentHome.dart';
import 'package:ui_ux/pages/student/studentMyTutors.dart';
import 'package:ui_ux/pages/student/studentProfile.dart';
import 'package:ui_ux/pages/student/studentSchedule.dart';

class StudentLandingPage extends StatefulWidget {
  const StudentLandingPage({super.key});

  @override
  State<StudentLandingPage> createState() => _StudentLandingPageState();
}

class _StudentLandingPageState extends State<StudentLandingPage> {
  int currentTab = 0;
  final List<Widget> screens = [
    studentHome(),
    studentMyTutors(),
    studentSchedule(),
    studentSchedule()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
/*It acts as a storage mechanism for preserving the state of widgets 
when navigating between routes or rebuilding the widget tree. */

  Widget currentScreen = studentHome();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            //  currentScreen = PostTuition();
            currentScreen = TuitionPostPage();
            currentTab = 4;
          });
        },
        child: Icon(Icons.add_circle_rounded,
            color: currentTab == 4 ? Colors.black : Colors.white),
        backgroundColor: Color(0xFF00BFA5),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        shadowColor: Colors.grey,
        color: Colors.white,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                //Default
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = studentHome();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_filled,
                          color:
                              currentTab == 0 ? Color(0xFF00BFA5) : Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: currentTab == 0
                                ? Color(0xFF00BFA5)
                                : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = studentMyTutors();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.people_outline_sharp,
                          color:
                              currentTab == 1 ? Color(0xFF00BFA5) : Colors.grey,
                        ),
                        Text(
                          'MyTutors',
                          style: TextStyle(
                            color: currentTab == 1
                                ? Color(0xFF00BFA5)
                                : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),

              //Right Tab Bar Icons
              SizedBox(
                width: 15,
              ),
              Row(
                //Default
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = studentSchedule();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color:
                              currentTab == 2 ? Color(0xFF00BFA5) : Colors.grey,
                        ),
                        Text(
                          'Schedule',
                          style: TextStyle(
                            color: currentTab == 2
                                ? Color(0xFF00BFA5)
                                : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = UpdateStudentProfile();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color:
                              currentTab == 3 ? Color(0xFF00BFA5) : Colors.grey,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: currentTab == 3
                                ? Color(0xFF00BFA5)
                                : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
