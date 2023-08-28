// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:ui_ux/constants/filter_object.dart';
// import 'package:ui_ux/constants/tuition_post.dart';
// import 'package:ui_ux/models/Teacher.dart';
// import 'package:ui_ux/pages/teacher/services/teacher_services.dart';
// import 'package:ui_ux/pages/teacher/teacherNotification.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:ui_ux/provider/teacher_provider.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import '../../models/advertisement.dart';
// import '../../widgets/my_drawer.dart';

// class TeacherHome extends StatefulWidget {
//   const TeacherHome({super.key});

//   @override
//   State<TeacherHome> createState() => _TeacherHomeState();
// }

// class _TeacherHomeState extends State<TeacherHome> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   List<Advertisement> tuitionList = [];
//   List<Advertisement> filteredTuitionList = [];

//   String picturePath = '';
//   String fullName = '';
//   String teacherId = '';

//   Teacher? currentTeacher = TeacherUser.getCurrentTeacherUser();

//   @override
//   void initState() {
//     super.initState();
//     //  picturePath = currentStudent!.picturePath;
//     picturePath = currentTeacher?.picturePath ??
//         ''; // Use an empty string as default if picturePath is null
//     fullName = currentTeacher?.fullName ??
//         ''; // Use an empty string as default if fullName is null

//     teacherId = currentTeacher?.id ?? '';

//     //teacherId = currentTeacher!.id;

//     //  fullName = currentStudent!.fullName;
//     fetchTuitionAdvertisements();
//   }

// //doing this just for changing the state to applied
//   Future<void> fetchTuitionAdvertisements() async {
//     try {
//       List<Advertisement> fetchedTuitionList =
//           await ApiService().fetchTuitionList(context);

//       fetchedTuitionList = fetchedTuitionList.map((item) {
//         return Advertisement(
//           id: item.id,
//           tuitionType: item.tuitionType,
//           classNumber: item.classNumber,
//           teacherGender: item.teacherGender,
//           daysInWeek: item.daysInWeek,
//           salary: item.salary,
//           subjects: item.subjects,
//           location: item.location,
//           studentId: item.studentId,
//           teacherId: item.teacherId,
//           booked: item.booked,
//           applied: item.applied,
//         );
//       }).toList();

//       setState(() {
//         tuitionList = fetchedTuitionList;
//       });
//     } catch (e) {
//       print('Error fetching tuition advertisements: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: Padding(
//           padding: const EdgeInsets.only(top: 8.0, left: 10),
//           child: CircleAvatar(
//             backgroundImage: NetworkImage(picturePath
//                 // 'https://images.unsplash.com/photo-1581382575275-97901c2635b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80',
//                 ),
//           ),
//         ),
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Welcome Back',
//               style: TextStyle(color: Colors.black),
//             ),
//             Text(
//               fullName,
//               style: Theme.of(context).textTheme.bodyText1,
//             ),
//           ],
//         ),
//         actions: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: IconButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => teacherNotification(),
//                   ),
//                 );
//               },
//               icon: Icon(Icons.notifications_active_outlined),
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//       endDrawer: MyDrawer(
//         onDataSelected: (FilterObject selectedData) async {
//           final url =
//               Uri.parse('http://192.168.0.103:4002/filter/getAdvertisements');
//           final headers = <String, String>{
//             'Content-Type': 'application/json; charset=UTF-8',
//           };
//           final data = selectedData.toJson();

//           try {
//             var response = await http.post(
//               url,
//               headers: headers,
//               body: data,
//             );

//             if (response.statusCode == 200) {
//               var responseData = jsonDecode(response.body);
//               // print(responseData.toString());
//               List<Advertisement> fetchedFilteredTuitionList =
//                   List<Advertisement>.from(
//                       responseData.map((data) => Advertisement.fromJson(data)));
//               setState(() {
//                 filteredTuitionList = fetchedFilteredTuitionList;
//               });
//             } else {
//               print('Error: Request failed with status ${response.statusCode}');
//             }
//           } catch (e) {
//             print('Error: $e');
//           }
//         },
//       ), //drawer for left side drawer, endDrawer for right side drawer
//       body: Center(
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Stack(children: [
//             Column(
//               children: [
//                 SizedBox(height: 5),
//                 Center(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         children: [
//                           SizedBox(
//                             width: 25,
//                           ),
//                         ],
//                       ),
//                       Positioned(
//                         top: 30,
//                         left: 20,
//                         child: Text(
//                           "Tuition Posts",
//                           style: TextStyle(
//                             decoration: TextDecoration.underline,
//                             fontSize: 25,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 8.0),
//                         child: Column(
//                           children: [
//                             IconButton(
//                               onPressed: () {
//                                 _scaffoldKey.currentState?.openEndDrawer();
//                               },
//                               icon: FaIcon(FontAwesomeIcons.sliders,
//                                   color: Color(0xFF00BFA5)),
//                               //iconSize: 5,
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children:

//                       //  tuitionList.map((item) {
//                       // Show the filtered advertisements if available, otherwise show the default ones
//                       (filteredTuitionList.isNotEmpty
//                               ? filteredTuitionList
//                               : tuitionList)
//                           .map((item) {
//                     bool appliedAdvertisement = false;

//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TuitionCard(
//                           cardHeight: 220,
//                           cardWidth: 333,
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 height: 3,
//                               ),
//                               Text(
//                                 "Need Tutor For Class ${item.classNumber} Student",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 21,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                               Text(
//                                 "${item.daysInWeek} Days/Week",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600, fontSize: 21),
//                                 textAlign: TextAlign.center,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "Salary: ",
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 17,
//                                       ),
//                                     ),
//                                     Text(
//                                       "${item.salary} BDT",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w500,
//                                           fontSize: 19),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "Type : ",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 17),
//                                     ),
//                                     Text(
//                                       "${item.tuitionType}",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w500,
//                                           fontSize: 19),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "Subjects: ",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 17),
//                                     ),
//                                     Text(
//                                       "${item.subjects}",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w500,
//                                           fontSize: 19),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "Preferred Tutor: ",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 17),
//                                     ),
//                                     Text(
//                                       "${item.teacherGender}",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w500,
//                                           fontSize: 19),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "Location: ",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 17),
//                                     ),
//                                     Text(
//                                       "${item.location}",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w500,
//                                           fontSize: 19),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   ElevatedButton(
//                                     onPressed: () async {
//                                       try {
//                                         appliedAdvertisement =
//                                             await ApiService()
//                                                 .applyForTuitionAdvertisement(
//                                                     teacherId, item.id);
//                                         if (appliedAdvertisement) {
//                                           setState(() {
//                                             item.applied = true;
//                                           });
//                                           saveTuitionListToSharedPreferences(
//                                               tuitionList);

//                                           AwesomeDialog(
//                                             context: context,
//                                             dialogType: DialogType.success,
//                                             animType: AnimType.topSlide,
//                                             showCloseIcon: true,
//                                             title: "Congratulations",
//                                             desc:
//                                                 "Successfully Apllied For The Tuition.",
//                                             btnOkOnPress: () {
//                                               //  Navigator.pop(context);
//                                             },
//                                           ).show();
//                                         }

//                                         // Show success message or perform any other actions
//                                       } catch (e) {
//                                         // Handle the error
//                                       }
//                                     },
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: item.applied
//                                           ? Colors.blueGrey[300]
//                                           : Colors.green,
//                                       // Change the background color based on the application status
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(10.0),
//                                       ),
//                                       padding: EdgeInsets.all(15.0),
//                                     ),
//                                     child: Text(
//                                       item.applied
//                                           ? 'Applied'
//                                           : 'Apply', // Change button text based on the application status
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 15,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 5,
//                                   )
//                                 ],
//                               )
//                             ],
//                           )),
//                     );
//                   }).toList(),
//                 )
//               ],
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }

// // Save tuitionList to SharedPreferences
// Future<void> saveTuitionListToSharedPreferences(
//     List<Advertisement> tuitionList) async {
//   final prefs = await SharedPreferences.getInstance();
//   final tuitionListJson = tuitionList.map((item) => item.toJson()).toList();
//   await prefs.setString('tuitionList', jsonEncode(tuitionListJson));
// }

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ui_ux/constants/filter_object.dart';
import 'package:ui_ux/constants/ip.dart';
import 'package:ui_ux/constants/tuition_post.dart';
import 'package:ui_ux/models/Teacher.dart';
import 'package:ui_ux/pages/teacher/services/teacher_services.dart';
import 'package:ui_ux/pages/teacher/teacherNotification.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_ux/provider/teacher_provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/advertisement.dart';
import '../../widgets/my_drawer.dart';

class TeacherHome extends StatefulWidget {
  const TeacherHome({super.key});

  @override
  State<TeacherHome> createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Advertisement> tuitionList = [];
  List<Advertisement> filteredTuitionList = [];

  String picturePath = '';
  String fullName = '';
  String teacherId = '';

  Teacher? currentTeacher = TeacherUser.getCurrentTeacherUser();

  @override
  void initState() {
    super.initState();
    picturePath = currentTeacher!.picturePath.toString();
    //picturePath = currentTeacher?.picturePath ??
    //  ''; // Use an empty string as default if picturePath is null
    //  fullName = currentTeacher?.fullName ??
    //    ''; // Use an empty string as default if fullName is null

    //teacherId = currentTeacher?.id ?? '';

    teacherId = currentTeacher!.id;

    fullName = currentTeacher!.fullName;

    fetchTuitionAdvertisements();
  }

//doing this just for changing the state to applied
  Future<void> fetchTuitionAdvertisements() async {
    try {
      List<Advertisement> fetchedTuitionList =
          await ApiService().fetchTuitionList(context);

      fetchedTuitionList = fetchedTuitionList.map((item) {
        return Advertisement(
          id: item.id,
          tuitionType: item.tuitionType,
          classNumber: item.classNumber,
          teacherGender: item.teacherGender,
          daysInWeek: item.daysInWeek,
          salary: item.salary,
          subjects: item.subjects,
          location: item.location,
          studentId: item.studentId,
          teacherId: item.teacherId,
          booked: item.booked,
          applied: item.applied,
        );
      }).toList();

      setState(() {
        tuitionList = fetchedTuitionList;
      });
    } catch (e) {
      print('Error fetching tuition advertisements: $e');
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
            backgroundImage: NetworkImage(picturePath
                // 'https://images.unsplash.com/photo-1581382575275-97901c2635b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80',
                ),
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
      endDrawer: MyDrawer(
        onDataSelected: (FilterObject selectedData) async {
          print("Selected Data : " + selectedData.toString());
          final url = Uri.parse('${ip}/filter/getAdvertisements');
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
              print(responseData.toString());
              List<Advertisement> fetchedFilteredTuitionList =
                  List<Advertisement>.from(
                      responseData.map((data) => Advertisement.fromJson(data)));
              setState(() {
                filteredTuitionList = fetchedFilteredTuitionList;
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
            filteredTuitionList = tuitionList;
          });
          Navigator.pop(context); // Close the drawer
        },
      ), //drawer for left side drawer, endDrawer for right side drawer
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                  ],
                ),
                Positioned(
                  top: 30,
                  left: 20,
                  child: Text(
                    "Tuition Posts",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState?.openEndDrawer();
                        },
                        icon: FaIcon(FontAwesomeIcons.sliders,
                            color: Color(0xFF00BFA5)),
                        //iconSize: 5,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:

                  //  tuitionList.map((item) {
                  // Show the filtered advertisements if available, otherwise show the default ones
                  (filteredTuitionList.isNotEmpty
                          ? filteredTuitionList
                          : tuitionList)
                      .map((item) {
                bool appliedAdvertisement =
                    item.teacherId.contains(currentTeacher!.id.toString());
                if (item.booked) {
                  return SizedBox();
                }
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TuitionCard(
                      cardHeight: 220,
                      cardWidth: MediaQuery.of(context).size.width - 48,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Need Tutor For Class ${item.classNumber} Student",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 21,
                            ),
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
                                    fontSize: 17,
                                  ),
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
                                  "Type : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17),
                                ),
                                Text(
                                  "${item.tuitionType}",
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  try {
                                    appliedAdvertisement = await ApiService()
                                        .applyForTuitionAdvertisement(
                                            teacherId, item.id);
                                    if (appliedAdvertisement) {
                                      setState(() {
                                        item.applied = true;
                                      });
                                      saveTuitionListToSharedPreferences(
                                          tuitionList);

                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.success,
                                        animType: AnimType.topSlide,
                                        showCloseIcon: true,
                                        title: "Congratulations",
                                        desc:
                                            "Successfully Apllied For The Tuition.",
                                        btnOkOnPress: () {
                                          //  Navigator.pop(context);
                                        },
                                      ).show();
                                    }

                                    // Show success message or perform any other actions
                                  } catch (e) {
                                    // Handle the error
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      item.applied || appliedAdvertisement
                                          ? Colors.blueGrey[300]
                                          : Colors.green,
                                  // Change the background color based on the application status
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding: EdgeInsets.all(15.0),
                                ),
                                child: Text(
                                  item.applied || appliedAdvertisement
                                      ? 'Applied'
                                      : 'Apply', // Change button text based on the application status
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
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
    );
  }
}

// Save tuitionList to SharedPreferences
Future<void> saveTuitionListToSharedPreferences(
    List<Advertisement> tuitionList) async {
  final prefs = await SharedPreferences.getInstance();
  final tuitionListJson = tuitionList.map((item) => item.toJson()).toList();
  await prefs.setString('tuitionList', jsonEncode(tuitionListJson));
}
