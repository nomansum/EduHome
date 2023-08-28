import 'package:ui_ux/constants/Colors.dart';
import 'package:ui_ux/models/Teacher.dart';
import 'package:ui_ux/provider/teacher_provider.dart';
import 'package:ui_ux/services/authenticate/authentication_repository.dart';
import 'package:ui_ux/services/data_repository.dart';
import 'package:ui_ux/services/storage_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/quickalert.dart';

class TeacherProfileUpdate extends GetxController {
  static TeacherProfileUpdate get instance => Get.find();

  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  final teaches = TextEditingController();
  final location = TextEditingController();
  final gender = TextEditingController();
  final experience = TextEditingController();
  final occupation = TextEditingController();
  final instituition = TextEditingController();
  final minSalary = TextEditingController();
  final maxSalary = TextEditingController();
  final subject = TextEditingController();
  final picturePath = TextEditingController();

  Future<void> updateTeacherProfile(Teacher data) async {
    try {
      await DataRespository.updateTeacherData(data);
    } catch (e) {
      QuickAlert.show(
          context: Get.context!,
          type: QuickAlertType.error,
          text: e.toString(),
          title: "Error",
          confirmBtnColor: buttonColor);
    }
  }

  Future<void> updateTeacherPassword(String password) async {
    try {
      await AuthenticationRepository.instance.updateUserPassword(password);
    } catch (e) {
      QuickAlert.show(
          context: Get.context!,
          type: QuickAlertType.error,
          text: "Updating Password Failed ... contact with developers",
          title: "Error",
          confirmBtnColor: buttonColor);
    }
  }

  Future<void> uploadProfilePicture(XFile file) async {
    var downloadUrl = await StorageRepo.instance.uploadFile(
        file, AuthenticationRepository.instance.uid.value.toString());

    TeacherUser.currentTeacher?.picturePath = downloadUrl;
    print("Image URL :" + downloadUrl);
  }
}