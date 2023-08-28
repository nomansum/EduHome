import 'package:ui_ux/constants/Colors.dart';
import 'package:ui_ux/constants/dropdown_list.dart';
import 'package:ui_ux/constants/heading_textfield.dart';
import 'package:ui_ux/constants/icon_constants.dart';
import 'package:ui_ux/constants/input_decoration.dart';
import 'package:ui_ux/constants/profile.dart';
import 'package:ui_ux/models/Student.dart';
import 'package:ui_ux/models/Teacher.dart';
import 'package:ui_ux/pages/landing/landingPage.dart';
import 'package:ui_ux/provider/teacher_provider.dart';
import 'package:ui_ux/services/authenticate/authentication_repository.dart';
import 'package:ui_ux/services/authenticate/controllers/logout_controller.dart';
import 'package:ui_ux/services/profileupdate/controller/teacher_profile_update_controller.dart';
import 'package:ui_ux/widgets/custom_dropdown.dart';
import 'package:ui_ux/widgets/custom_dropdown2.dart';
import 'package:ui_ux/widgets/teacher_subject_salary.dart';
import 'package:ui_ux/widgets/update_drop_down_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class UpdateTeacherProfile extends StatefulWidget {
  UpdateTeacherProfile({super.key});

  @override
  State<UpdateTeacherProfile> createState() => _UpdateTeacherProfileState();
}

class _UpdateTeacherProfileState extends State<UpdateTeacherProfile> {
  final _formKey = GlobalKey<FormState>();

  final controller = Get.put(TeacherProfileUpdate());

  Teacher? currentTeacher = TeacherUser.getCurrentTeacherUser();

  final ImagePicker picker = ImagePicker();

  late String fullName = ""; // userDetails.fullName;
  late String genderInput = ""; //userDetails.gender;
  late String experienceInput = ""; // userDetails.experiance.toString();
  late String occupationInput = ""; //userDetails.occupation;
  late String instituteInput = ""; //userDetails.instituition;
  late bool _obscureText = true;
  late bool isStudent = (currentTeacher!.occupation ==
      "Student"); //userDetails.occupation == "Student"?true:false;

  late String minInput = ""; //userDetails.minSalary;
  late String maxInput = ""; //userDetails.maxSalary;
  late String subjectInput = ""; //userDetails.subjects;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (currentTeacher != null) {
      controller.fullName.text = currentTeacher!.fullName;
      controller.phoneNo.text = currentTeacher!.phoneNumber;
      controller.picturePath.text = currentTeacher!.picturePath.toString();
      controller.teaches.text = currentTeacher!.teachingSubject;
      controller.location.text = currentTeacher!.location;
      controller.gender.text = currentTeacher!.gender;
      controller.experience.text = currentTeacher!.experience;
      controller.occupation.text = currentTeacher!.occupation;
      controller.instituition.text = currentTeacher!.institution;
      controller.minSalary.text = currentTeacher!.minSalary;
      controller.maxSalary.text = currentTeacher!.maxSalary;
      controller.subject.text = currentTeacher!.subject;
    }
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
        controller.subject.text = 'None';
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
      controller.experience.text = value;
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
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                currentTeacher!.picturePath.toString()),
                            radius: 50,
                          ),
                          Positioned(
                            bottom:
                                5, // Adjust this value to position the container vertically
                            right:
                                10, // Adjust this value to position the container horizontally
                            child: GestureDetector(
                              onTap: () async {
                                XFile? image = await picker.pickImage(
                                    source: ImageSource.gallery);

                                await TeacherProfileUpdate.instance
                                    .uploadProfilePicture(image as XFile);

                                setState(() {
                                  currentTeacher!.picturePath =
                                      TeacherUser.currentTeacher!.picturePath;
                                  controller.picturePath.text =
                                      currentTeacher!.picturePath!;
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.camera,
                                color: Color(0xFF00BFA5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
                      // initialValue: fullName,
                      validator: (value) {
                        //value = value.toString();
                        final bool nameValid = RegExp(r"^[a-zA-Z\s'-]+$")
                            .hasMatch(value.toString());
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
                            CustomDropDownButton1(
                              value: controller.gender.text,
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
                                "Experience",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            CustomDropDownButton1(
                              value: controller.experience
                                  .text, //widget.userDetails.experiance.toString(),
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
                  HeadingText(headingText: "Teaches"),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 48,
                    decoration: containerDecoration,
                    child: TextFormField(
                      validator: (value) {
                        final bool subjectValid =
                            RegExp(r'^[\w\s]+(,[\w\s]+)*$')
                                .hasMatch(value.toString());
                        if (!subjectValid)
                          return "Please Provide The Format: Phy,Math,Chem....";
                        return null;
                      },
                      cursorColor: Colors.grey[900],
                      controller: controller.teaches,
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
                    width: MediaQuery.of(context).size.width - 48,
                    decoration: containerDecoration,
                    child: TextFormField(
                      validator: (value) {
                        //value = value.toString();

                        final bool phnValid = RegExp(
                                r'(^(\+88|0088)?(01){1}[3456789]{1}(\d){8})$')
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
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 6) {
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
                            CustomDropDownButton1(
                              value: controller.occupation.text,
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
                              value: controller.instituition.text,
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

                  isStudent
                      ? Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              width: MediaQuery.of(context).size.width - 80,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12.0, 0, 0, 0),
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
                            ),
                            CustomDropDownButton2(
                              value: controller.subject.text,
                              items: subjectList.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                              iconData: FontAwesomeIcons.book,
                              onChangeFunctionality: handleSubject,
                            ),
                          ],
                        )
                      : SizedBox(
                          height: 1,
                        ),

                  SizedBox(
                    height: 5,
                  ),

                  Container(
                      width: MediaQuery.of(context).size.width - 48,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            width: MediaQuery.of(context).size.width - 80,
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
                                salaryWidth:
                                    MediaQuery.of(context).size.width * 0.42,
                                hintText: " Min",
                                onChangeFunctionality: handleMin,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              SubjectSalary(
                                salaryWidth:
                                    MediaQuery.of(context).size.width * 0.42,
                                hintText: "  Max",
                                onChangeFunctionality: handleMax,
                              )
                            ],
                          ),
                        ],
                      )
                      //////// // ? Column(
                      //     children: [
                      //       Container(
                      //         alignment: Alignment.topLeft,
                      //         width: 310,
                      //         child: Text(
                      //           "Expected Salary",
                      //           style: TextStyle(
                      //             fontFamily: "Poppins",
                      //             fontSize: 15,
                      //             fontWeight: FontWeight.w400,
                      //           ),
                      //           textAlign: TextAlign.left,
                      //         ),
                      //       ),
                      //       Row(
                      //         // mainAxisSize: MainAxisSize.max,
                      //         mainAxisAlignment: isStudent
                      //             ? MainAxisAlignment.end
                      //             : MainAxisAlignment.spaceEvenly,
                      //         children: [
                      //           SubjectSalary(
                      //             salaryWidth: 160,
                      //             hintText: "Min",
                      //             onChangeFunctionality: handleMin,
                      //           ),
                      //           SizedBox(
                      //             width: 5,
                      //           ),
                      //           SubjectSalary(
                      //             salaryWidth: 160,
                      //             hintText: "Max",
                      //             onChangeFunctionality: handleMax,
                      //           )
                      //         ],
                      ///////////////       ),
                      //     ],
                      //   )
                      //Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     children: [
                      //       Column(
                      //         children: [
                      //           Container(
                      //             alignment: Alignment.topLeft,
                      //             width: 145,
                      //             child: Text(
                      //               "Subject",
                      //               style: TextStyle(
                      //                 fontFamily: "Poppins",
                      //                 fontSize: 15,
                      //                 fontWeight: FontWeight.w400,
                      //               ),
                      //               textAlign: TextAlign.left,
                      //             ),
                      //           ),
                      //           CustomDropDownButton1(
                      //             value: controller.subject.text,
                      //             items: subjectList.map((valueItem) {
                      //               return DropdownMenuItem(
                      //                 value: valueItem,
                      //                 child: Text(valueItem),
                      //               );
                      //             }).toList(),
                      //             iconData: Icons.class_outlined,
                      //             onChangeFunctionality: handleSubject,
                      //           ),
                      //         ],
                      //       ),
                      //       Column(
                      //         children: [
                      //           Container(
                      //             alignment: Alignment.topLeft,
                      //             width: 145,
                      //             child: Text(
                      //               "Expected Salary",
                      //               style: TextStyle(
                      //                 fontFamily: "Poppins",
                      //                 fontSize: 15,
                      //                 fontWeight: FontWeight.w400,
                      //               ),
                      //               textAlign: TextAlign.left,
                      //             ),
                      //           ),
                      //           Row(
                      //             // mainAxisSize: MainAxisSize.max,
                      //             mainAxisAlignment: MainAxisAlignment.end,
                      //             children: [
                      //               SubjectSalary(
                      //                 salaryWidth: 80,
                      //                 hintText: "Min",
                      //                 onChangeFunctionality: handleMin,
                      //               ),
                      //               SizedBox(
                      //                 width: 5,
                      //               ),
                      //               SubjectSalary(
                      //                 salaryWidth: 80,
                      //                 hintText: "Max",
                      //                 onChangeFunctionality: handleMax,
                      //               )
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     ],
                      //   )
                      //  : , //Column
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
                        //print(genderInput);
                        // print(minInput);
                        // print(maxInput);
                        if (_formKey.currentState!.validate()) {
                          print("Teacher Profile URL : " +
                              controller.picturePath.text.toString());
                          Teacher data = new Teacher(
                              id: currentTeacher!.id,
                              fullName: controller.fullName.text.trim(),
                              gender: controller.gender.text.trim(),
                              experience: controller.experience.text.trim(),
                              location: controller.location.text.trim(),
                              email: currentTeacher!.email.toString(),
                              phoneNumber: controller.phoneNo.text.trim(),
                              occupation: controller.occupation.text.trim(),
                              institution: controller.instituition.text.trim(),
                              picturePath: controller.picturePath.text.trim(),
                              subject: controller.subject.text.trim(),
                              teachingSubject: controller.teaches.text.trim(),
                              minSalary: controller.minSalary.text.trim(),
                              maxSalary: controller.maxSalary.text.trim());

                          await TeacherProfileUpdate.instance
                              .updateTeacherPassword(
                                  controller.password.text.trim());

                          await TeacherProfileUpdate.instance
                              .updateTeacherProfile(data);

                          //   await TeacherProfileUpdate.instance.updateTeacherProfile( data);

                          QuickAlert.show(
                              context: context,
                              type: QuickAlertType.success,
                              title: "Update Done",
                              confirmBtnColor: buttonColor,
                              text: "Profile Successfully Updated");
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
