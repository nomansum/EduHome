import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicantListCard extends StatelessWidget {
  final String teacherName;
  final String starRating;
  final String subjects;
  final String experience;
  final String salaryRange;
  final String occupation;
  final String education;
  final String subject;
  final String location;
  final String profileImage;
  final void Function() onAcceptPressed;

  const ApplicantListCard({
    required this.teacherName,
    required this.starRating,
    required this.subjects,
    required this.experience,
    required this.salaryRange,
    required this.occupation,
    required this.education,
    required this.subject,
    required this.location,
    required this.profileImage,
    required this.onAcceptPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: const Color.fromARGB(255, 224, 220, 220),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 168,
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
                child: Row(
                  children: [
                    Text(
                      teacherName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Container(
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
                                style: GoogleFonts.poppins(
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
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.book,
                    color: Colors.grey,
                    size: 18,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Teaches ${subjects}',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 13),
                  )
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
                  SizedBox(width: 2),
                  Text(
                    '${experience} experience',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 13),
                  )
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.dollar,
                    color: Colors.grey,
                    size: 18,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Expected Salary: ${salaryRange} Tk',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 13),
                  )
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
                  )
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
                        onPressed: onAcceptPressed,
                        child: Text('ACCEPT'),
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
            ],
          ),
        ],
      ),
    );
  }
}
