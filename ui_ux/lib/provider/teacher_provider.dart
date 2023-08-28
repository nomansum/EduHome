import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/Teacher.dart';

class TeacherUser {
  static Teacher? currentTeacher = null;

  static Teacher? getCurrentTeacherUser() {
    return TeacherUser.currentTeacher;
  }
}
