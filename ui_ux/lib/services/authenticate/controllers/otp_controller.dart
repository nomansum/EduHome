import 'package:ui_ux/pages/landing/studentLanding.dart';
import 'package:ui_ux/pages/student/studentHome.dart';
import 'package:ui_ux/services/authenticate/authentication_repository.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);

    isVerified ? Get.offAll(StudentLandingPage()) : Get.back();
  }
}
