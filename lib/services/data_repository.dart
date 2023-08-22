import 'dart:convert';

import 'package:eduhome_project/constants/custom_exception.dart';
import 'package:eduhome_project/constants/ip.dart';
import 'package:eduhome_project/models/Teacher.dart';
import 'package:eduhome_project/provider/teacher_provider.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DataRespository extends GetxController {
  static DataRespository get instance => Get.find();

  Future<void> saveTeacherData(Teacher teacherData) async {
    final url = Uri.parse('http://${ip}:4000/users/saveTeacherData');
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final data = teacherData.toJson();

    try {
      var response = await http.post(
        url,
        headers: headers,
        body: data,
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        TeacherUser.instance.currentTeacher = Teacher(
            id: responseData[0]['_id'],
            fullName: responseData[0]['fullName'],
            gender: responseData[0]['gender'],
            experience: responseData[0]['experience'],
            location: responseData[0]['location'],
            email: responseData[0]['email'],
            phoneNumber: responseData[0]['phoneNumber'],
            occupation: responseData[0]['occupation'],
            institution: responseData[0]['instituition'],
            subject: responseData[0]['subject'],
            picturePath: responseData[0]['picturePath'],
            teachingSubject: responseData[0]['teachingSubject'],
            minSalary: responseData[0]['minSalary'],
            maxSalary: responseData[0]['maxSalary']);
        print(TeacherUser.instance.currentTeacher);
      }
    } catch (e) {
      throw CustomException(
          "Could not fetch data sorry. Contact The Database Owner");
    }
  }
}
