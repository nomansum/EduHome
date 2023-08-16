import 'package:eduhome_project/constants/dropdown_list.dart';
import 'package:eduhome_project/constants/heading_textfield.dart';
import 'package:eduhome_project/constants/icon_constants.dart';
import 'package:eduhome_project/constants/input_decoration.dart';
import 'package:eduhome_project/constants/profile.dart';
import 'package:eduhome_project/pages/landing/landingPage.dart';
import 'package:eduhome_project/services/authenticate/authentication_repository.dart';
import 'package:eduhome_project/services/authenticate/controllers/logout_controller.dart';
import 'package:eduhome_project/services/authenticate/controllers/student_signup_controller.dart';
import 'package:eduhome_project/widgets/back_button.dart';
import 'package:eduhome_project/widgets/custom_dropdown.dart';
import 'package:eduhome_project/widgets/teacher_subject_salary.dart';
import 'package:eduhome_project/widgets/update_drop_down_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
class UpdateStudentProfile extends StatefulWidget {
  UpdateStudentProfile({super.key});

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

  @override
  State<UpdateStudentProfile> createState() => _UpdateStudentProfileState();
}

class _UpdateStudentProfileState extends State<UpdateStudentProfile> {
  final _formKey = GlobalKey<FormState>();
  final nameEditingController = TextEditingController();
  final classEditingController = TextEditingController();
  final locationEditingController = TextEditingController();
  final phoneEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final instituitionEditingController = TextEditingController();
  bool _obscureText = true;
  static const IconData arrow_drop_down_circle_outlined = arrowDropdown;

  static const IconData location_on = Location;

  static const IconData smartphone = Mobile;

  static const IconData key_outlined = outlinedKey;

  String _selectedItem = "";

  final List<String> _dropdownItems = dropDownList;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameEditingController.dispose();
    classEditingController.dispose();
    locationEditingController.dispose();
    phoneEditingController.dispose();
    passwordEditingController.dispose();
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
                        onPressed: () async{
                           
                         await AuthenticationRepository.instance.logout();
                        Get.offAll(()=>landingPage());
                        },
                        icon: Icon(IconData(0xe3b3, fontFamily: 'MaterialIcons')),
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
                    height: 42,
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
                  HeadingText(headingText: "Class"),
                  Container(
                    height: 42,
                    width: 333,
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
                      controller:
                          TextEditingController(text: _selectedItem ?? ''),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  HeadingText(headingText: "Instituition"),
                  Container(
                    height: 42,
                    width: 333,
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
                      controller: instituitionEditingController,
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
                    height: 42,
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
                    height: 42,
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
                    height: 20,
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
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Done')),
                          );
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