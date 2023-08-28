import 'package:ui_ux/constants/Colors.dart';
import 'package:ui_ux/services/authenticate/authentication_repository.dart';
import 'package:ui_ux/services/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

class TeacherSignInController extends GetxController {
  static TeacherSignInController get instance => Get.find();

  BuildContext? context = Get.context;

  final emailValue = TextEditingController();
  final passwordValue = TextEditingController();

  void signInTeacherWithEmailAndPassword(String email, String password) async {
    try {
      await AuthenticationRepository.instance
          .loginUserWithEmailAndPassword(email, password);

      final user = await AuthenticationRepository.instance.getCurrentUser();

      if (AuthenticationRepository.instance.userActualType.value
                  .toString()
                  .toLowerCase() ==
              'tutor' &&
          AuthenticationRepository.instance.userType.value
                  .toString()
                  .toLowerCase() ==
              'tutor') {
       await DataRespository.getTeacherData(email);
      }

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
