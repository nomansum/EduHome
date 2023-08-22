import 'package:eduhome_project/constants/dropdown_list.dart';
import 'package:eduhome_project/constants/heading_textfield.dart';
import 'package:eduhome_project/constants/icon_constants.dart';
import 'package:eduhome_project/constants/input_decoration.dart';
import 'package:eduhome_project/constants/profile.dart';
import 'package:eduhome_project/pages/landing/landingPage.dart';
import 'package:eduhome_project/services/authenticate/authentication_repository.dart';
import 'package:eduhome_project/services/authenticate/controllers/logout_controller.dart';
import 'package:eduhome_project/widgets/teacher_subject_salary.dart';
import 'package:eduhome_project/widgets/update_drop_down_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateTeacherProfile extends StatefulWidget {
  UpdateTeacherProfile({super.key});

  var userDetails = Profile(
      fullName: "Muntasir",
      gender: "Male",
      experiance: 2,
      location: "Chadpur",
      phn: "+88011545542",
      occupation: "Student",
      instituition: "SUST",
      minSalary: "30000",
      maxSalary: "50000",
      subjects: "CSE");
//fullName,
//gender
//experience
//location
//email
//phoneNumber
//occupation
//instituition
//subject
//picturePath
//teachingSubject
//rating
//minSalary
//maxSalary
//studentId

  @override
  State<UpdateTeacherProfile> createState() => _UpdateTeacherProfileState();
}

class _UpdateTeacherProfileState extends State<UpdateTeacherProfile> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameEditingController;
  final TextEditingController classEditingController = TextEditingController();
  final teachesEditingController = TextEditingController();
  late TextEditingController locationEditingController;
  late TextEditingController phoneEditingController;
  final TextEditingController passwordEditingController =
      TextEditingController();

  @override
  void initState() {
    nameEditingController =
        TextEditingController(text: widget.userDetails.fullName);
    locationEditingController =
        TextEditingController(text: widget.userDetails.location);
    phoneEditingController =
        TextEditingController(text: widget.userDetails.phn);
    // TODO: implement initState
    super.initState();
  }

  late String fullName = ""; // userDetails.fullName;
  late String genderInput = ""; //userDetails.gender;
  late String experienceInput = ""; // userDetails.experiance.toString();
  late String occupationInput = ""; //userDetails.occupation;
  late String instituteInput = ""; //userDetails.instituition;
  late bool _obscureText = true;
  late bool isStudent = true; //userDetails.occupation == "Student"?true:false;

  late String minInput = ""; //userDetails.minSalary;
  late String maxInput = ""; //userDetails.maxSalary;
  late String subjectInput = ""; //userDetails.subjects;

  void handleSubject(String value) {
    setState(() {
      subjectInput = value;
    });
  }

  void handleMin(String value) {
    setState(() {
      minInput = value;
    });
  }

  void handleMax(String value) {
    setState(() {
      maxInput = value;
    });
  }

  void handleOccupation(String value) {
    setState(() {
      occupationInput = value;
      if (occupationInput == 'Student') {
        isStudent = true;
      } else {
        isStudent = false;
      }
    });
  }

  void handleInstitute(String value) {
    setState(() {
      instituteInput = value;
    });
  }

  void handleGender(String value) {
    setState(() {
      genderInput = value;
    });
  }

  void handleExperience(String value) {
    setState(() {
      experienceInput = value;
    });
  }

  static const IconData arrow_drop_down_circle_outlined = arrowDropdown;

  static const IconData location_on = Location;

  static const IconData smartphone = Mobile;

  static const IconData key_outlined = outlinedKey;

  String _selectedItem = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () async {
                          //Carry Out Logout Action
                          await AuthenticationRepository.instance.logout();
                          Get.offAll(() => landingPage());
                        },
                        icon:
                            Icon(IconData(0xe3b3, fontFamily: 'MaterialIcons')),
                        color: Colors.grey.shade900,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        minRadius: 50,
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1581382575275-97901c2635b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  HeadingText(headingText: "Full Name"),
                  Container(
                    height: 50,
                    width: 333,
                    decoration: containerDecoration,
                    child: TextFormField(
                      // initialValue: fullName,
                      validator: (value) {
                        //value = value.toString();
                        if (value == null || value.isEmpty) {
                          return "please enter Full Name";
                        }
                        return null;
                      },
                      cursorColor: Colors.grey[900],
                      controller: nameEditingController,
                      decoration: inputDecoration,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //  HeadingText(headingText: "Class"),
                  Container(
                    // height: 70,
                    width: 333,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              width: 145,
                              child: Text(
                                "Gender",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            CustomDropDownButton1(
                              value: widget.userDetails.gender,
                              items: genderDropDownList.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                              iconData: Icons.people_alt,
                              onChangeFunctionality: handleGender,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              width: 145,
                              child: Text(
                                "Experiance",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            CustomDropDownButton1(
                              value:
                                  "2", //widget.userDetails.experiance.toString(),
                              items: experienceDropdownList.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                              iconData: Icons.business_center_sharp,
                              onChangeFunctionality: handleExperience,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  HeadingText(headingText: "Location"),
                  Container(
                    height: 50,
                    width: 333,
                    decoration: containerDecoration,
                    child: TextFormField(
                      validator: (value) {
                        //value = value.toString();
                        if (value == null || value.isEmpty) {
                          return "please enter Your Location";
                        }
                        return null;
                      },
                      cursorColor: Colors.grey[900],
                      controller: locationEditingController,
                      decoration: inputDecoration.copyWith(
                          prefixIcon: Icon(
                        location_on,
                        color: Colors.grey[900],
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  HeadingText(headingText: "Teaches"),
                  Container(
                    height: 50,
                    width: 333,
                    decoration: containerDecoration,
                    child: TextFormField(
                      validator: (value) {
                        //value = value.toString();
                        if (value == null || value.isEmpty) {
                          return "please enter the subjects you teach";
                        }
                        return null;
                      },
                      cursorColor: Colors.grey[900],
                      controller: teachesEditingController,
                      decoration: inputDecoration.copyWith(
                          prefixIcon: Icon(
                        Icons.book_rounded,
                        color: Colors.grey,
                      )),
                    ),
                  ),

                  SizedBox(
                    height: 5,
                  ),
                  HeadingText(headingText: "Phone Number"),
                  Container(
                    height: 50,
                    width: 333,
                    decoration: containerDecoration,
                    child: TextFormField(
                      validator: (value) {
                        //value = value.toString();
                        if (value == null || value.isEmpty) {
                          return "please enter Your Location";
                        }
                        return null;
                      },
                      cursorColor: Colors.grey[900],
                      controller: phoneEditingController,
                      decoration: inputDecoration.copyWith(
                          prefixIcon: Icon(
                        smartphone,
                        color: Colors.grey[900],
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  HeadingText(headingText: "Password"),
                  Container(
                    height: 50,
                    width: 333,
                    decoration: containerDecoration,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 6) {
                          return "Please Enter Password with length at least 6";
                        }
                        return null;
                      },
                      cursorColor: Colors.grey[900],
                      controller: passwordEditingController,
                      obscureText: _obscureText,
                      decoration: inputDecoration.copyWith(
                          prefixIcon: Icon(
                            key_outlined,
                            color: Colors.grey[900],
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.visibility,
                              color: Colors.grey[900],
                            ),
                            onPressed: () {
                              if (_obscureText) {
                                _obscureText = false;
                              } else {
                                _obscureText = true;
                              }
                              setState(() {});
                            },
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  Container(
                    // height: 70,
                    width: 333,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              width: 145,
                              child: Text(
                                "Occupation",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            CustomDropDownButton1(
                              value: widget.userDetails.occupation,
                              items: occupationList.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                              iconData: Icons.business_center_sharp,
                              onChangeFunctionality: handleOccupation,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              width: 145,
                              child: Text(
                                "Instituition",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            CustomDropDownButton1(
                              value: widget.userDetails.instituition,
                              items: institutionList.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                              iconData: Icons.house_outlined,
                              onChangeFunctionality: handleInstitute,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  Container(
                    width: 333,
                    child: isStudent
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    width: 145,
                                    child: Text(
                                      "Subject",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  CustomDropDownButton1(
                                    value: widget.userDetails.subjects,
                                    items: subjectList.map((valueItem) {
                                      return DropdownMenuItem(
                                        value: valueItem,
                                        child: Text(valueItem),
                                      );
                                    }).toList(),
                                    iconData: Icons.class_outlined,
                                    onChangeFunctionality: handleSubject,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    width: 145,
                                    child: Text(
                                      "Expected Salary",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Row(
                                    // mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SubjectSalary(
                                        salaryWidth: 80,
                                        hintText: "Min",
                                        onChangeFunctionality: handleMin,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      SubjectSalary(
                                        salaryWidth: 80,
                                        hintText: "Max",
                                        onChangeFunctionality: handleMax,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                width: 310,
                                child: Text(
                                  "Expected Salary",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Row(
                                // mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: isStudent
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.spaceEvenly,
                                children: [
                                  SubjectSalary(
                                    salaryWidth: 160,
                                    hintText: "Min",
                                    onChangeFunctionality: handleMin,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SubjectSalary(
                                    salaryWidth: 160,
                                    hintText: "Max",
                                    onChangeFunctionality: handleMax,
                                  )
                                ],
                              ),
                            ],
                          ), ////HERE
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    width: 333,
                    height: 42,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(
                              int.parse("#00CC99".substring(1, 7), radix: 16) +
                                  0xFF000000),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0))),
                      onPressed: () {
                        //print(genderInput);
                        // print(minInput);
                        // print(maxInput);
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Done')),
                          );
                        }
                      },
                      child: Text(
                        "UPDATE",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
