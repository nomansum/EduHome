import 'package:ui_ux/pages/authenticate/email_recovery_screen.dart';
import 'package:ui_ux/pages/authenticate/forget_password_mail.dart';
import 'package:ui_ux/pages/authenticate/forget_password_number.dart';
import 'package:flutter/material.dart';

import '../../../widgets/forgot_password_button.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        builder: (context) => Container(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Try One Method To Recover!",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Text(
                      "Select one of the options given below to recover your password",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 15,
                          fontWeight: FontWeight.w200),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ForgotPasswordBtnWidget(
                      onTap: () {
                        //Get.toNamed('/forgotPasswordMail');
                        Get.to(() => EmailRecovery());
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             ForgotPasswordMailScreen()));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EmailRecovery()));
                      },
                      btnIcon: Icons.mail_outline_rounded,
                      title: "E-Mail",
                      subTitle: "Reset Via E-mail Verification",
                    ),
                  ],
                ),
              ),
            ));
  }
}
