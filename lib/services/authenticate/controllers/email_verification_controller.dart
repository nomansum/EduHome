import 'package:eduhome_project/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import '../authentication_repository.dart';
import 'package:quickalert/quickalert.dart';

class MailVerificationController extends GetxController {
  late Timer _timer;

  BuildContext? context = Get.context;

  @override
  void onInit() {
    super.onInit();
    sendVerificationEmail();
    setTimerForAutoRedirect();
  }

  Future<void> sendVerificationEmail() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();

      QuickAlert.show(
          context: context!,
          type: QuickAlertType.success,
          confirmBtnColor: buttonColor,
          title: "Email Sent",
          text: "Verification Email Sent. Please Check",
          autoCloseDuration: Duration(seconds: 2));
    } catch (e) {
      SnackBar(content: Text(e.toString()));
    }
  }

  void setTimerForAutoRedirect() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      AuthenticationRepository.instance.authReload();

      final user = AuthenticationRepository.instance.getCurrentUser();

      if (user!.emailVerified) {
        timer.cancel();
        AuthenticationRepository.instance.setInitialScreen(user);
      }
    });
  }
}
