import 'package:ui_ux/constants/input_decoration.dart';
import 'package:ui_ux/pages/authenticate/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordPhoneScreen extends StatelessWidget {
  const ForgotPasswordPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CircleAvatar(
                    minRadius: 150,
                    backgroundImage: AssetImage('assets/forgotPassword2.png'),
                    backgroundColor: Colors.white,
                  )
                ]),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Forgot Password!",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins"),
                ),
                Text(
                  "Try Recovery With Phone",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins"),
                ),
                const SizedBox(
                  height: 15,
                ),
                Form(
                    child: Column(
                  children: [
                    Container(
                      decoration: containerDecoration,
                      height: 50,
                      width: MediaQuery.of(context).size.width - 30,
                      child: TextFormField(
                        decoration: inputDecoration.copyWith(
                            prefixIcon: Icon(
                              Icons.phone_android_rounded,
                              color: Colors.grey.shade400,
                            ),
                            label: Text("Phone"),
                            hintText: "Phone"),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 30,
                      height: 42,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(int.parse("#00CC99".substring(1, 7),
                                    radix: 16) +
                                0xFF000000),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0))),
                        onPressed: () {
                          Get.to(() => OTPScreen());
                        },
                        child: Text(
                          "NEXT",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Click"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
