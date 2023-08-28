import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyTutorsCard extends StatelessWidget {
  //final String teacher;
  final String teacherName;
  final String starRating;
  final String gender;
  final String experience;
  final String education;
  final String occupation;
  final String subject;
  final String location;
  final String profileImage;
  final VoidCallback onRatingPressed;

  MyTutorsCard({
    //  required this.teacher,
    required this.teacherName,
    required this.starRating,
    required this.gender,
    required this.experience,
    required this.education,
    required this.occupation,
    required this.subject,
    required this.location,
    required this.profileImage,
    required this.onRatingPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: const Color.fromARGB(255, 224, 220, 220),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 70,
              height: 152,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
                image: DecorationImage(
                  image: NetworkImage(profileImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 115,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          teacherName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),

                        Spacer(), // Expands to take up remaining space

                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 26,
                            width: 50,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Color(0xFF38BBF8),
                                    ),
                                    Text(
                                      starRating,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
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
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.marsAndVenus,
                      color: Colors.grey,
                      size: 18,
                    ),
                    SizedBox(width: 5),
                    Text(
                      gender,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.briefcase,
                      color: Colors.grey,
                      size: 18,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Experience: ${experience} Years',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.buildingColumns,
                      color: Colors.grey,
                      size: 18,
                    ),
                    SizedBox(width: 5),
                    Text(
                      occupation == 'Student'
                          ? 'Studies ${subject} at ${education}'
                          : 'Works at ${education}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    // Add icons and text for subjects, experience, education, etc.
                  ],
                ),
                SizedBox(height: 5),

                Container(
                  width: MediaQuery.of(context).size.width - 115,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        FontAwesomeIcons.locationDot,
                        color: Colors.grey,
                        size: 18,
                      ),
                      SizedBox(width: 5),
                      Text(
                        location,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      Spacer(), // Expands to take up remaining space
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: onRatingPressed,
                          child: Text('RATING'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF00BFA5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     //Spacer(),
                //     Align(
                //       alignment: Alignment.bottomRight,
                //       child: ElevatedButton(
                //         onPressed: onRatingPressed,
                //         child: Text('RATING'),
                //         style: ButtonStyle(
                //           backgroundColor: MaterialStateProperty.all<Color>(
                //             Color(0xFF00BFA5),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
