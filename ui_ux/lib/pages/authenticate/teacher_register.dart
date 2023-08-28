import 'package:ui_ux/constants/dropdown_list.dart';
import 'package:ui_ux/models/Teacher.dart';
import 'package:ui_ux/pages/authenticate/signInTeacher.dart';
import 'package:ui_ux/pages/landing/teacherLanding.dart';
import 'package:ui_ux/services/authenticate/authentication_repository.dart';
import 'package:ui_ux/services/authenticate/controllers/teacher_signup_controller.dart';
import 'package:ui_ux/widgets/custom_dropdown.dart';
import 'package:ui_ux/widgets/teacher_subject_salary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui_ux/constants/images.dart';
import '../../constants/heading_textfield.dart';
import '../../constants/icon_constants.dart';
import '../../constants/input_decoration.dart';
import '../../widgets/back_button.dart';
import 'package:get/get.dart';

class TeacherRegister extends StatefulWidget {
  const TeacherRegister({super.key});

  @override
  State<TeacherRegister> createState() => _TeacherRegisterState();
}

class _TeacherRegisterState extends State<TeacherRegister> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(TeacherSignUpController());
  String genderInput = "Male";
  String experienceInput = "0";
  String occupationInput = "Student";
  String instituteInput = "None";
  bool _obscureText = true;
  bool isStudent = false;

  String minInput = "";
  String maxInput = "";
  String subjectInput = "None";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.experiance.text = "0";
    controller.gender.text = "Male";
    controller.instituition.text = "None";
    controller.subject.text = "None";
    controller.maxSalary.text = "50000";
    controller.minSalary.text = "1000";
  }

  void handleSubject(String value) {
    setState(() {
      subjectInput = value;
      controller.subject.text = value;
    });
  }

  void handleMin(String value) {
    setState(() {
      minInput = value;
      controller.minSalary.text = value;
    });
  }

  void handleMax(String value) {
    setState(() {
      maxInput = value;
      controller.maxSalary.text = value;
    });
  }

  void handleOccupation(String value) {
    setState(() {
      occupationInput = value;
      controller.occupation.text = value;
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
      controller.instituition.text = value;
    });
  }

  void handleGender(String value) {
    setState(() {
      genderInput = value;
      controller.gender.text = value;
    });
  }

  void handleExperience(String value) {
    setState(() {
      experienceInput = value;
      controller.experiance.text = value;
    });
  }

  static const IconData arrow_drop_down_circle_outlined = arrowDropdown;

  static const IconData location_on = Location;

  static const IconData smartphone = Mobile;

  static const IconData key_outlined = outlinedKey;

  String _selectedItem = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BackButtonWidget(),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "One Step Away!",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Poppins"),
                ),
                Text(
                  "Please Tell Us About You",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins"),
                ),
                SizedBox(
                  height: 25,
                ),
                HeadingText(headingText: "Full Name"),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 48,
                  decoration: containerDecoration,
                  child: TextFormField(
                    validator: (value) {
                      //value = value.toString();
                      final bool nameValid =
                          RegExp(r"^[a-zA-Z\s'-]+$").hasMatch(value.toString());
                      if (nameValid)
                        return null;
                      else
                        return 'Please Provide Your Name Not Anything Else';
                    },
                    cursorColor: Colors.grey[900],
                    controller: controller.fullName,
                    decoration: inputDecoration,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                HeadingText(headingText: "Email"),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 48,
                  decoration: containerDecoration,
                  child: TextFormField(
                    validator: (value) {
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value.toString());

                      if (!emailValid) return "A valid format please";
                      return null;
                    },
                    cursorColor: Colors.grey[900],
                    controller: controller.email,
                    decoration: inputDecoration,
                  ),
                ),

                SizedBox(
                  height: 5,
                ),
                HeadingText(headingText: "Teaches"),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 48,
                  decoration: containerDecoration,
                  child: TextFormField(
                    validator: (value) {
                      final bool subjectValid = RegExp(r'^[\w\s]+(,[\w\s]+)*$')
                          .hasMatch(value.toString());
                      if (!subjectValid)
                        return "Please Provide The Format: Phy,Math,Chem....";
                      return null;
                    },
                    cursorColor: Colors.grey[900],
                    controller: controller.teaches,
                    decoration: inputDecoration,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                //  HeadingText(headingText: "Class"),
                Container(
                  // height: 70,
                  width: MediaQuery.of(context).size.width - 48,
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
                          CustomDropDownButton(
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
                          CustomDropDownButton(
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
                  width: MediaQuery.of(context).size.width - 48,
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
                    controller: controller.location,
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
                HeadingText(headingText: "Phone Number"),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 48,
                  decoration: containerDecoration,
                  child: TextFormField(
                    validator: (value) {
                      //value = value.toString();

                      final bool phnValid =
                          RegExp(r'(^(\+88|0088)?(01){1}[3456789]{1}(\d){8})$')
                              .hasMatch(value.toString());
                      if (!phnValid) return "Please Provide The Valid Phone";

                      return null;
                    },
                    cursorColor: Colors.grey[900],
                    controller: controller.phoneNo,
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
                  width: MediaQuery.of(context).size.width - 48,
                  decoration: containerDecoration,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        return "Please Enter Password with length at least 6";
                      }
                      return null;
                    },
                    cursorColor: Colors.grey[900],
                    controller: controller.password,
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
                  width: MediaQuery.of(context).size.width - 48,
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
                          CustomDropDownButton(
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
                          CustomDropDownButton(
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
                  width: MediaQuery.of(context).size.width - 48,
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
                                CustomDropDownButton(
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
                                  width:
                                      MediaQuery.of(context).size.width - 220,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SubjectSalary(
                                      salaryWidth: 80,
                                      hintText: "  Min",
                                      onChangeFunctionality: handleMin,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    SubjectSalary(
                                      salaryWidth: 80,
                                      hintText: "  Max",
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
                                  ? MainAxisAlignment.spaceEvenly
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
                  width: MediaQuery.of(context).size.width - 48,
                  height: 42,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(
                            int.parse("#00CC99".substring(1, 7), radix: 16) +
                                0xFF000000),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0))),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          AuthenticationRepository.instance.userType.value =
                              "Tutor";

                          Teacher signupTeacherData = Teacher(
                              id: "new",
                              fullName: controller.fullName.text.trim(),
                              gender: controller.gender.text.trim(),
                              experience: controller.experiance.text.trim(),
                              location: controller.location.text.trim(),
                              email: controller.email.text.trim(),
                              phoneNumber: controller.phoneNo.text.trim(),
                              occupation: controller.occupation.text.trim(),
                              institution: controller.instituition.text.trim(),
                              subject: controller.subject.text.trim(),
                              picturePath: teacherImage,
                              teachingSubject: controller.teaches.text.trim(),
                              minSalary: controller.minSalary.text.trim(),
                              maxSalary: controller.maxSalary.text.trim());

                          TeacherSignUpController.instance.registerUser(
                              controller.email.text.trim(),
                              controller.password.text.trim(),
                              signupTeacherData);

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Done')),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'You Messed Up With Credentials!!! Try Again...')),
                          );
                        }
                      }
                    },
                    child: Text(
                      "Sign up",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInTeacher(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: Color(int.parse("#00CC99".substring(1, 7),
                                    radix: 16) +
                                0xFF000000),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
