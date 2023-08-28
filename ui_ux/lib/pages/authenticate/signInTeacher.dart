import 'package:ui_ux/constants/heading_textfield.dart';
import 'package:ui_ux/constants/icon_constants.dart';
import 'package:ui_ux/constants/input_decoration.dart';
import 'package:ui_ux/pages/authenticate/methods/forgot_password_model_button_sheet.dart';
import 'package:ui_ux/services/authenticate/authentication_repository.dart';
import 'package:ui_ux/services/authenticate/controllers/teacher_signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui_ux/pages/authenticate/teacher_register.dart';
import 'package:ui_ux/pages/landing/teacherLanding.dart';
import 'package:get/get.dart';

class SignInTeacher extends StatefulWidget {
  const SignInTeacher({super.key});

  @override
  State<SignInTeacher> createState() => _SignInTeacherState();
}

class _SignInTeacherState extends State<SignInTeacher> {
  final controller = Get.put(TeacherSignInController());

  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  //final isPassword = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const IconData person_rounded = roundedPerson;
    const IconData key_outlined = outlinedKey;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins"),
              ),
              Text(
                "Sign in to your account",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              HeadingText(headingText: "E-Mail"),
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
                  controller: controller.emailValue,
                  decoration: inputDecoration.copyWith(
                    prefixIcon: Icon(
                      Icons.mail_outline_rounded,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
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
                  obscureText: _obscureText,
                  controller: controller.passwordValue,
                  decoration: inputDecoration.copyWith(
                      prefixIcon: Icon(
                        key_outlined,
                        color: Colors.grey[600],
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.visibility,
                          color: Colors.grey[600],
                        ),
                        onPressed: () {
                          if (_obscureText) {
                            _obscureText = false;
                          } else {
                            _obscureText = true;
                          }
                          setState(() {});
                        },
                      )
                      // suffixIcon: Builder(builder: builder)
                      ),
                ),
              ),
              Container(
                width: 322,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        AuthenticationRepository.instance.userType.value =
                            "Tutor";

                        ForgetPasswordScreen.buildShowModalBottomSheet(context);
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.black,
                            decoration: TextDecoration.underline),
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      try {
                        AuthenticationRepository.instance.userType.value =
                            "Tutor";

                        TeacherSignInController.instance
                            .signInTeacherWithEmailAndPassword(
                                controller.emailValue.text.trim(),
                                controller.passwordValue.text.trim());
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Wrong Credentials!!!")),
                        );
                      }
                    }
                  },
                  child: Text(
                    "Sign In",
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
                    "Don't have an account?",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TeacherRegister(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color(
                              int.parse("#00CC99".substring(1, 7), radix: 16) +
                                  0xFF000000),
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
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
