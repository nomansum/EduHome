import 'package:ui_ux/constants/Colors.dart';
import 'package:ui_ux/constants/dropdown_list.dart';
import 'package:ui_ux/constants/heading_textfield.dart';
import 'package:ui_ux/constants/icon_constants.dart';
import 'package:ui_ux/constants/input_decoration.dart';
import 'package:ui_ux/models/Student.dart';
import 'package:ui_ux/pages/authenticate/email_verification.dart';
import 'package:ui_ux/pages/authenticate/otp_screen.dart';
import 'package:ui_ux/services/authenticate/authentication_repository.dart';
import 'package:ui_ux/services/authenticate/controllers/student_signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui_ux/pages/authenticate/signInStudent.dart';
import 'package:ui_ux/pages/landing/studentLanding.dart';
import 'package:quickalert/quickalert.dart';
import 'package:ui_ux/constants/images.dart';
import '../../widgets/back_button.dart';
import 'package:get/get.dart';

class StudentRegister extends StatefulWidget {
  const StudentRegister({super.key});

  @override
  State<StudentRegister> createState() => _StudentRegisterState();
}

class _StudentRegisterState extends State<StudentRegister> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(SignUpController());

  bool _obscureText = true;

  static const IconData arrow_drop_down_circle_outlined = arrowDropdown;

  static const IconData location_on = Location;

  static const IconData smartphone = Mobile;

  static const IconData key_outlined = outlinedKey;

  String _selectedItem = "";

  final List<String> _dropdownItems = dropDownList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.classStudies.text = "None";
    controller.institution.text = "None";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

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
                height: 40,
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
                height: 42,
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
                height: 25,
              ),
              HeadingText(headingText: "E-Mail"),
              Container(
                height: 42,
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
                        controller.classStudies.text = _selectedItem;
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
              SizedBox(
                height: 5,
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

                    final bool phnValid =
                        RegExp(r'(^(\+88|0088)?(01){1}[3456789]{1}(\d){8})$')
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
                      try {
                        AuthenticationRepository.instance.userType.value =
                            "student";

                        Student signUpStudentData = Student(
                            id: "new",
                            fullName: controller.fullName.text.trim(),
                            location: controller.location.text.trim(),
                            email: controller.email.text.trim(),
                            phoneNumber: controller.phoneNumber.text.trim(),
                            picturePath: studentImage,
                            institution: controller.institution.text.trim(),
                            classStudies: controller.classStudies.text.trim());

                        SignUpController.instance.registerUser(
                            controller.email.text.trim(),
                            controller.password.text.trim(),
                            signUpStudentData);
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
                height: 10,
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
                            builder: (context) => SignInStudent(),
                          ),
                        );
                      },
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
