import 'dart:io';

import 'package:ui_ux/constants/Colors.dart';
import 'package:ui_ux/models/Student.dart';
import 'package:ui_ux/pages/authenticate/email_verification.dart';
import 'package:ui_ux/pages/landing/studentLanding.dart';
import 'package:ui_ux/provider/student_provider.dart';
import 'package:ui_ux/services/authenticate/authentication_repository.dart';
import 'package:ui_ux/services/data_repository.dart';
import 'package:ui_ux/services/storage_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/quickalert.dart';

class StudentProfileUpdate extends GetxController {
  static StudentProfileUpdate get instance => Get.find();

  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNumber = TextEditingController();
  final classStudies = TextEditingController();
  final location = TextEditingController();
  final institution = TextEditingController();
  final picturePath = TextEditingController();

  Future<void> updateStudentProfile(Student data) async {
    try {
      await DataRespository.updateStudentData(data);
    } catch (e) {
      QuickAlert.show(
          context: Get.context!,
          type: QuickAlertType.error,
          text: e.toString(),
          title: "Error",
          confirmBtnColor: buttonColor);
    }
  }

  Future<void> updateStudentPassword(String password) async {
    try {
      await AuthenticationRepository.instance.updateUserPassword(password);
    } catch (e) {
      QuickAlert.show(
          context: Get.context!,
          type: QuickAlertType.error,
          text: e.toString(),
          title: "Error",
          confirmBtnColor: buttonColor);
    }
  }

  Future<void> uploadProfilePicture(XFile file) async {
    var downloadUrl = await StorageRepo.instance.uploadFile(
        file, AuthenticationRepository.instance.uid.value.toString());

    StudentUser.currentStudent?.picturePath = downloadUrl;
    print("Image URL :" + downloadUrl);
  }
}
