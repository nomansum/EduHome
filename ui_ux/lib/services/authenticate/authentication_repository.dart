//import 'dart:html';

import 'dart:convert';

import 'package:ui_ux/constants/custom_exception.dart';
import 'package:ui_ux/constants/ip.dart';
import 'package:ui_ux/pages/authenticate/email_verification.dart';
import 'package:ui_ux/pages/authenticate/signInStudent.dart';
import 'package:ui_ux/pages/landing/landingPage.dart';
import 'package:ui_ux/pages/landing/studentLanding.dart';
import 'package:ui_ux/pages/landing/teacherLanding.dart';
import 'package:ui_ux/pages/student/studentHome.dart';
import 'package:ui_ux/services/authenticate/signup_email_password_failure.dart';
import 'package:ui_ux/services/data_repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;
  var userType = ''.obs;
  var uid = ''.obs;
  var userActualType = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);

    Get.put(DataRespository());

    // print(_auth.currentUser?.email);

    firebaseUser.bindStream(_auth.userChanges());

//setInitialScreen(_auth.currentUser);
  }

  Future<void> authReload() async {
    await _auth.currentUser?.reload();
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  setInitialScreen(User? user) async {
    final userTypeValue = userType.value.toString().toLowerCase();

    final userActualTypeValue = userActualType.value.toString().toLowerCase();

    if (user == null) {
      Get.offAll(() => landingPage());
    } else if (user!.emailVerified &&
        userTypeValue == "tutor" &&
        userActualTypeValue == 'tutor') {
      Get.offAll(() => TeacherLandingPage());
    } else if (user!.emailVerified &&
        userTypeValue == "student" &&
        userActualTypeValue == 'student') {
      Get.offAll(() => StudentLandingPage());
    } else if (user!.emailVerified == false) {
      Get.offAll(() => EmailVerification());
    } else {
      await AuthenticationRepository.instance.logout();

      Get.offAll(() => landingPage());
    }
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      await authReload();

      AuthenticationRepository.instance.uid.value =
          AuthenticationRepository.instance.getCurrentUser()!.uid.toString();

      await AuthenticationRepository.instance.getUserData(email);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw CustomException('User not found. Please check the email.');

        case 'wrong-password':
          throw CustomException('Incorrect password. Please try again.');

        case 'email-already-in-use':
          throw CustomException('Email address is already in use.');
        case 'invalid-email':
          throw CustomException("Invalid Email");

        default:
          throw CustomException('An error occurred: ${e.message}');
      }
      //throw e;
    } catch (e) {
      throw e;
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print("Password Reset Failed!");

      throw e;
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final userTypeValue = userType.value.toString().toLowerCase();

      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await AuthenticationRepository.instance
          .sendUserData(email, userTypeValue);
      await authReload();

      AuthenticationRepository.instance.uid.value =
          AuthenticationRepository.instance.getCurrentUser()!.uid.toString();

      await AuthenticationRepository.instance.getUserData(email);
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');

      throw ex;
    } catch (e) {
      const ex = SignUpWithEmailAndPasswordFailure();

      print("EXCEPTION - ${ex.message}");
      throw ex;
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      final ex = e.code;
      throw ex;
    } catch (_) {
      throw _;
    }
  }

  Future<void> sendUserData(String email, String usertype) async {
    final url = Uri.parse('${ip}/users/saveUserData');
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final data = {'email': email, 'usertype': usertype};

    try {
      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(data),
      );
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> getUserData(String email) async {
    final url = Uri.parse('${ip}/users/getUserData');
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final data = {'email': email};

    try {
      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var usType = responseData[0]['usertype'];

        if (usType != null) {
          AuthenticationRepository.instance.userActualType.value =
              usType.toString();
        } else {
          print('Error: "usertype" field missing in response.');
        }
      } else {
        print('Error: Request failed with status ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('Error', "The Provided Phone Number is not valid");
          } else {
            Get.snackbar("Error", "Something went wrong");
          }
        },
        codeSent: (verificationId, resendToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        });
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));

    return credentials.user != null ? true : false;
  }

  Future<void> logout() async => await _auth.signOut();

  Future<void> updateUserPassword(String password) async {
    User? user = AuthenticationRepository.instance.getCurrentUser();

    try {
      await user!.updatePassword(password);
      AuthenticationRepository.instance.authReload();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
}
