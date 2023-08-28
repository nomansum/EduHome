import 'package:ui_ux/constants/Colors.dart';
import 'package:ui_ux/models/Student.dart';
import 'package:ui_ux/pages/authenticate/email_verification.dart';
import 'package:ui_ux/pages/landing/studentLanding.dart';
import 'package:ui_ux/services/authenticate/authentication_repository.dart';
import 'package:ui_ux/services/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNumber = TextEditingController();
  final classStudies = TextEditingController();
  final location = TextEditingController();
  final institution = TextEditingController();

  void registerUser(
      String email, String password, Student signUpStudentData) async {
    try {
      await AuthenticationRepository.instance
          .createUserWithEmailAndPassword(email, password);

      await DataRespository.saveStudentData(signUpStudentData);

      AuthenticationRepository.instance.authReload();

      final user = AuthenticationRepository.instance.getCurrentUser();

      AuthenticationRepository.instance.setInitialScreen(user);
    } catch (e) {
      QuickAlert.show(
          context: Get.context!,
          type: QuickAlertType.error,
          text: e.toString(),
          title: "Error",
          confirmBtnColor: buttonColor);
    }
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
