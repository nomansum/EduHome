import 'package:eduhome_project/screens/pages/available_tuition.dart';
import 'package:eduhome_project/screens/pages/teacher_my_students.dart';
import 'package:eduhome_project/screens/pages/teacher_profile.dart';
import 'package:eduhome_project/screens/pages/teacher_schedule.dart';
import 'package:eduhome_project/screens/pages/teacherHome.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;
  final List<Widget> screens = [
    TeacherHome(),
    TeacherSchedule()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
/*It acts as a storage mechanism for preserving the state of widgets 
when navigating between routes or rebuilding the widget tree. */

  Widget currentScreen = TeacherHome();

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
            currentScreen = AvailableTuition();
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
                        currentScreen = TeacherHome();
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
                        currentScreen = TeacherMyStudents();
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
                          'MyStudents',
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
                        currentScreen = TeacherSchedule();
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
                        currentScreen = TeacherProfile();
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