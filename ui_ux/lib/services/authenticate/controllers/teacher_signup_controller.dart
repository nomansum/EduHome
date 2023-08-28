import 'package:ui_ux/pages/authenticate/email_verification.dart';
import 'package:ui_ux/pages/landing/studentLanding.dart';
import 'package:ui_ux/pages/landing/teacherLanding.dart';
import 'package:ui_ux/services/authenticate/authentication_repository.dart';
import 'package:ui_ux/services/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

import '../../../models/Teacher.dart';

class TeacherSignUpController extends GetxController {
  static TeacherSignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  final teaches = TextEditingController();
  final location = TextEditingController();
  final gender = TextEditingController();
  final experiance = TextEditingController();
  final occupation = TextEditingController();
  final instituition = TextEditingController();
  final minSalary = TextEditingController();
  final maxSalary = TextEditingController();

  final subject = TextEditingController();

  void registerUser(String email, String password, Teacher teacherData) async {
    try {
      await AuthenticationRepository.instance
          .createUserWithEmailAndPassword(email, password);

      await DataRespository.saveTeacherData(teacherData);

      AuthenticationRepository.instance.authReload();

// all data are in these textformfield save Data in MONGODB

      final user = AuthenticationRepository.instance.getCurrentUser();
      // AuthenticationRepository.instance.setInitialScreen(user);

      AuthenticationRepository.instance.setInitialScreen(user);
    } catch (e) {
      QuickAlert.show(
          context: Get.context!,
          type: QuickAlertType.error,
          text: e.toString());
    }
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
