import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/Teacher.dart';

class TeacherUser extends GetxController {
  static TeacherUser get instance => Get.find();

  Teacher? currentTeacher = null;

  Teacher? getCurrentTeacherUser() {
    return this.currentTeacher;
  }
}
