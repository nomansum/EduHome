import 'dart:io';
import 'package:ui_ux/constants/Colors.dart';

import 'package:ui_ux/constants/dropdown_list.dart';
import 'package:ui_ux/constants/heading_textfield.dart';
import 'package:ui_ux/constants/icon_constants.dart';
import 'package:ui_ux/constants/input_decoration.dart';
import 'package:ui_ux/constants/profile.dart';
import 'package:ui_ux/pages/landing/landingPage.dart';
import 'package:ui_ux/models/Student.dart';
import 'package:ui_ux/provider/student_provider.dart';
import 'package:ui_ux/services/authenticate/authentication_repository.dart';
import 'package:ui_ux/services/authenticate/controllers/logout_controller.dart';
import 'package:ui_ux/services/authenticate/controllers/student_signup_controller.dart';
import 'package:ui_ux/services/profileupdate/controller/student_profile_update_controller.dart';
import 'package:ui_ux/widgets/back_button.dart';
import 'package:ui_ux/widgets/custom_dropdown.dart';
import 'package:ui_ux/widgets/update_drop_down_field.dart';
import 'package:ui_ux/widgets/teacher_subject_salary.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/quickalert.dart';

class UpdateStudentProfile extends StatefulWidget {
  UpdateStudentProfile({super.key});

  @override
  State<UpdateStudentProfile> createState() => _UpdateStudentProfileState();
}

class _UpdateStudentProfileState extends State<UpdateStudentProfile> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(StudentProfileUpdate());
  Student? currentStudent = StudentUser.getCurrentStudentUser();

  bool _obscureText = true;
  static const IconData arrow_drop_down_circle_outlined = arrowDropdown;

  static const IconData location_on = Location;

  static const IconData smartphone = Mobile;

  static const IconData key_outlined = outlinedKey;

  String _selectedItem = "";

  final List<String> _dropdownItems = dropDownList;

  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (currentStudent != null)
      controller.fullName.text = currentStudent!.fullName.toString();
    controller.classStudies.text = currentStudent!.classStudies.toString();
    controller.institution.text = currentStudent!.institution.toString();
    controller.location.text = currentStudent!.location.toString();
    controller.phoneNumber.text = currentStudent!.phoneNumber.toString();
    controller.picturePath.text = currentStudent!.picturePath.toString();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () async {
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
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                currentStudent!.picturePath.toString()),
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

                                await StudentProfileUpdate.instance
                                    .uploadProfilePicture(image as XFile);

                                setState(() {
                                  currentStudent!.picturePath =
                                      StudentUser.currentStudent!.picturePath;
                                  controller.picturePath.text =
                                      currentStudent!.picturePath!;
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
                    height: 42,
                    width: MediaQuery.of(context).size.width - 48,
                    decoration: containerDecoration,
                    child: TextFormField(
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
                  HeadingText(headingText: "Class"),
                  Container(
                    height: 42,
                    width: MediaQuery.of(context).size.width - 48,
                    decoration: containerDecoration,
                    child: TextFormField(
                      cursorColor: Colors.grey[900],
                      decoration: inputDecoration.copyWith(
                          suffixIcon: PopupMenuButton(
                        icon: Icon(
                          arrow_drop_down_circle_outlined,
                          color: Colors.grey[900],
                        ),
                        itemBuilder: (context) {
                          return _dropdownItems.map((String item) {
                            return PopupMenuItem(
                              child: Text(item),
                              value: item,
                            );
                          }).toList();
                        },
                        onSelected: (String selectedItem) {
                          setState(() {
                            _selectedItem = selectedItem;
                          });
                        },
                      )),
                      controller: controller.classStudies,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  HeadingText(headingText: "Instituition"),
                  Container(
                    height: 42,
                    width: MediaQuery.of(context).size.width - 48,
                    decoration: containerDecoration,
                    child: TextFormField(
                      validator: (value) {
                        //value = value.toString();
                        if (value == null || value.isEmpty) {
                          return "please enter Your Instituition";
                        }
                        return null;
                      },
                      cursorColor: Colors.grey[900],
                      controller: controller.institution,
                      decoration: inputDecoration.copyWith(
                          prefixIcon: Icon(
                        Icons.house_outlined,
                        color: Colors.grey[900],
                      )),
                    ),
                  ),
                  HeadingText(headingText: "Location"),
                  Container(
                    height: 42,
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
                    height: 42,
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
                      controller: controller.phoneNumber,
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
                    height: 42,
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
                    height: 20,
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
                          Student updateStudentData = new Student(
                              id: currentStudent!.id,
                              fullName: controller.fullName.text.trim(),
                              location: controller.location.text.trim(),
                              email: currentStudent!.email,
                              phoneNumber: controller.phoneNumber.text.trim(),
                              picturePath: controller.picturePath.text.trim(),
                              institution: controller.institution.text.trim(),
                              classStudies:
                                  controller.classStudies.text.trim());
                          await StudentProfileUpdate.instance
                              .updateStudentPassword(controller.password.text);
                          await StudentProfileUpdate.instance
                              .updateStudentProfile(updateStudentData);

                          QuickAlert.show(
                              context: context,
                              type: QuickAlertType.success,
                              title: "Update Done",
                              confirmBtnColor: buttonColor,
                              text: "Profile Successfully Updated");
                        }
                      },
                      child: Text(
                        "Update",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
