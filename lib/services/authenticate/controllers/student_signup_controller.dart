
import 'package:eduhome_project/pages/authenticate/email_verification.dart';
import 'package:eduhome_project/pages/landing/studentLanding.dart';
import 'package:eduhome_project/services/authenticate/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{

static SignUpController get instance => Get.find();

final email = TextEditingController();
final password = TextEditingController();
final fullName = TextEditingController();
final phoneNo = TextEditingController();
final classNo = TextEditingController();
final location = TextEditingController();

void registerUser(String email,String password)async{

await AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);


///all the datas are in the text field save these data in mongoDB

final user = AuthenticationRepository.instance.getCurrentUser();
  AuthenticationRepository.instance.setInitialScreen(user);

}

void phoneAuthentication(String phoneNo){



  AuthenticationRepository.instance.phoneAuthentication(phoneNo);



}



}