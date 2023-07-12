import 'package:eduhome_project/constants/dropdown_list.dart';
import 'package:eduhome_project/widgets/custom_dropdown.dart';
import 'package:eduhome_project/widgets/teacher_subject_salary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants/heading_textfield.dart';
import '../../constants/icon_constants.dart';
import '../../constants/input_decoration.dart';
import '../../widgets/back_button.dart';

class TeacherRegister extends StatefulWidget {
  const TeacherRegister({super.key});

  @override
  State<TeacherRegister> createState() => _TeacherRegisterState();
}

class _TeacherRegisterState extends State<TeacherRegister> {
  final _formKey = GlobalKey<FormState>();
  final nameEditingController = TextEditingController();
  final classEditingController = TextEditingController();
  final locationEditingController = TextEditingController();
  final phoneEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  String genderInput = "";
  String experienceInput = "";
  String occupationInput = "";
  String instituteInput = "";
  bool _obscureText = true;
  bool isStudent = false;

  String minInput = "";
  String maxInput = "";
  String subjectInput = "";

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
    return Scaffold(
      body: Center(
          child: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                width: 333,
                decoration: containerDecoration,
                child: TextFormField(
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
                    if (value == null || value.isEmpty || value.length < 6) {
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
                      onPressed: () {},
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Color(
                              int.parse("#00CC99".substring(1, 7), radix: 16) +
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
      )),
    );
  }
}
