
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

void registerUser(String email,String password){

AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);



}




}