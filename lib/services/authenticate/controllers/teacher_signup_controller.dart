import 'package:eduhome_project/pages/authenticate/email_verification.dart';
import 'package:eduhome_project/pages/landing/studentLanding.dart';
import 'package:eduhome_project/pages/landing/teacherLanding.dart';
import 'package:eduhome_project/services/authenticate/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  void registerUser(String email, String password) async {
    await AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);

    AuthenticationRepository.instance.authReload();

// all data are in these textformfield save Data in MONGODB

    final user = AuthenticationRepository.instance.getCurrentUser();
    // AuthenticationRepository.instance.setInitialScreen(user);

    AuthenticationRepository.instance.setInitialScreen(user);
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
