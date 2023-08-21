import 'package:eduhome_project/constants/Colors.dart';
import 'package:eduhome_project/services/authenticate/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:quickalert/quickalert.dart";

class StudentSignInController extends GetxController {
  static StudentSignInController get instance => Get.find();

  final emailValue = TextEditingController();
  final passwordValue = TextEditingController();

  BuildContext? context = Get.context;

  void signInStudentWithEmailAndPassword(String email, String password) async {
    try {
      await AuthenticationRepository.instance
          .loginUserWithEmailAndPassword(email, password);

      final user = AuthenticationRepository.instance.getCurrentUser();

      AuthenticationRepository.instance.setInitialScreen(user);
    } catch (e) {
      QuickAlert.show(
          context: context!,
          type: QuickAlertType.error,
          title: "Oops",
          text: e.toString(),
          confirmBtnColor: buttonColor);
    }
  }
}
