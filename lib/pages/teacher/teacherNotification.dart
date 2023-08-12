import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class teacherNotification extends StatefulWidget {
  const teacherNotification({super.key});

  @override
  State<teacherNotification> createState() => _teacherNotificationState();
}

class _teacherNotificationState extends State<teacherNotification> {
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
                    '< Notifications',
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
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  FontAwesomeIcons.book,
                  color: Color.fromRGBO(253, 219, 109, 1.0),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: 70,
                  width: 340,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(253, 219, 109, 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 20, 5, 5),
                    child: Text(
                      'You have classes with Tahmid Kabir.',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  FontAwesomeIcons.userPlus,
                  color: Color(0xFF38BBF8),
                  size: 23,
                ),
                SizedBox(
                  width: 7,
                ),
                Container(
                  height: 70,
                  width: 340,
                  decoration: BoxDecoration(
                    color: Color(0xFF38BBF8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 20, 5, 5),
                    child: Text(
                      'Mostahid Hasan applied for your tuition.',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  FontAwesomeIcons.circleCheck,
                  color: Color(0xFF2EEE45),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: 75,
                  width: 340,
                  decoration: BoxDecoration(
                    color: Color(0xFF2EEE45),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 5, 5, 5),
                    child: Text(
                      'Mahir Labib Dihan Accepted your tuition offer. His Contact Number is : 01987654321. You can contact him now.',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  FontAwesomeIcons.circleXmark,
                  color: const Color(0xFFF82525),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: 70,
                  width: 340,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF82525),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 20, 5, 5),
                    child: Text(
                      'Tahmid Kabir Rejected your tuition offer.',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
