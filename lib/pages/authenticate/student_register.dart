import 'package:eduhome_project/constants/dropdown_list.dart';
import 'package:eduhome_project/constants/heading_textfield.dart';
import 'package:eduhome_project/constants/icon_constants.dart';
import 'package:eduhome_project/constants/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:eduhome_project/pages/authenticate/signInStudent.dart';
import 'package:eduhome_project/pages/landing/studentLanding.dart';

import '../../widgets/back_button.dart';

class StudentRegister extends StatefulWidget {
  const StudentRegister({super.key});

  @override
  State<StudentRegister> createState() => _StudentRegisterState();
}

class _StudentRegisterState extends State<StudentRegister> {
  final _formKey = GlobalKey<FormState>();
  final nameEditingController = TextEditingController();
  final classEditingController = TextEditingController();
  final locationEditingController = TextEditingController();
  final phoneEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
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
                  controller: TextEditingController(text: _selectedItem ?? ''),
                ),
              ),
              SizedBox(
                height: 5,
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentLandingPage(),
                        ),
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
