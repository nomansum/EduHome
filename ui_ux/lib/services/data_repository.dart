import 'dart:convert';

import 'package:ui_ux/constants/custom_exception.dart';
import 'package:ui_ux/constants/ip.dart';
import 'package:ui_ux/models/Student.dart';
import 'package:ui_ux/models/Teacher.dart';
import 'package:ui_ux/provider/student_provider.dart';
import 'package:ui_ux/provider/teacher_provider.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DataRespository {
  static Future<void> saveTeacherData(Teacher teacherData) async {
    final url = Uri.parse('${ip}/users/saveTeacherData');
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

      print("HERE");
      var responseData = await jsonDecode(response.body);

      //print(responseData['email']);
      //  print(responseData['teachingSubject'].join(","));

      TeacherUser.currentTeacher = new Teacher(
          id: responseData['_id'],
          fullName: responseData['fullName'],
          gender: responseData['gender'],
          experience: responseData['experience'],
          location: responseData['location'],
          email: responseData['email'],
          phoneNumber: responseData['phoneNumber'],
          occupation: responseData['occupation'],
          institution: responseData['institution'],
          subject: responseData['subject'],
          picturePath: responseData['picturePath'],
          teachingSubject: responseData['teachingSubject'].join(","),
          minSalary: responseData['minSalary'],
          maxSalary: responseData['maxSalary']);
      print(TeacherUser.currentTeacher?.id.toString());
    } catch (e) {
      throw CustomException(
          "Could not fetch data sorry. Contact The Database Owner");
    }
  }

  static Future<void> getTeacherData(String email) async {
    final url = Uri.parse('${ip}/users/getTeacherData');
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

      //print(responseData['email']);
      //  print(responseData['teachingSubject'].join(","));

      if (response.statusCode == 200) {
        var responseData = await jsonDecode(response.body);

        TeacherUser.currentTeacher = new Teacher(
            id: responseData[0]['_id'],
            fullName: responseData[0]['fullName'],
            gender: responseData[0]['gender'],
            experience: responseData[0]['experience'],
            location: responseData[0]['location'],
            email: responseData[0]['email'],
            phoneNumber: responseData[0]['phoneNumber'],
            occupation: responseData[0]['occupation'],
            institution: responseData[0]['institution'],
            subject: responseData[0]['subject'],
            picturePath: responseData[0]['picturePath'],
            teachingSubject: responseData[0]['teachingSubject'].join(","),
            minSalary: responseData[0]['minSalary'],
            maxSalary: responseData[0]['maxSalary']);
        //print(TeacherUser.currentTeacher?.id.toString());
      }
    } catch (e) {
      throw CustomException(
          "Could not fetch data sorry. Contact The Database Owner");
    }
  }

  static Future<void> saveStudentData(Student studentData) async {
    final url = Uri.parse('${ip}/users/saveStudentData');
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final data = studentData.toJson();

    try {
      var response = await http.post(
        url,
        headers: headers,
        body: data,
      );

      print("HERE");
      var responseData = await jsonDecode(response.body);
      //  print(responseData['teachingSubject'].join(","));
      StudentUser.currentStudent = new Student(
          id: responseData['_id'],
          fullName: responseData['fullName'],
          classStudies: responseData['classStudies'],
          location: responseData['location'],
          email: responseData['email'],
          phoneNumber: responseData['phoneNumber'],
          picturePath: responseData['picturePath'],
          institution: responseData['institution']);

      print(StudentUser.currentStudent?.id.toString());

      //print(StudentUser.currentStudent?.id.toString());
    } catch (e) {
      throw CustomException(
          "Could not fetch data sorry. Contact The Database Owner");
    }
  }

  static Future<void> getStudentData(String email) async {
    final url = Uri.parse('${ip}/users/getStudentData');
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

      //print(responseData['email']);
      //  print(responseData['teachingSubject'].join(","));

      if (response.statusCode == 200) {
        var responseData = await jsonDecode(response.body);

        StudentUser.currentStudent = new Student(
            id: responseData[0]['_id'],
            fullName: responseData[0]['fullName'],
            classStudies: responseData[0]['classStudies'],
            location: responseData[0]['location'],
            email: responseData[0]['email'],
            phoneNumber: responseData[0]['phoneNumber'],
            picturePath: responseData[0]['picturePath'],
            institution: responseData[0]['institution']);

        print(StudentUser.currentStudent?.id.toString());
      }
    } catch (e) {
      throw CustomException(
          "Could not fetch data sorry. Contact The Database Owner");
    }
  }

  static Future<void> updateStudentData(Student studentData) async {
    final url = Uri.parse('${ip}/users/updateStudentProfile');
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final data = studentData.toJson();

    try {
      var response = await http.post(
        url,
        headers: headers,
        body: data,
      );

      if (response.statusCode == 200) {
        var responseData = await jsonDecode(response.body);
        StudentUser.currentStudent = Student(
            id: responseData['_id'],
            fullName: responseData['fullName'],
            location: responseData['location'],
            email: responseData['email'],
            phoneNumber: responseData['phoneNumber'],
            picturePath: responseData['picturePath'],
            institution: responseData['institution'],
            classStudies: responseData['classStudies']);
        print(StudentUser.currentStudent?.id.toString());
      }
    } catch (e) {
      throw CustomException("Something went wrong in server");
    }
  }

  static Future<void> updateTeacherData(Teacher teacherData) async {
    final url = Uri.parse('${ip}/users/updateTeacherProfile');
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
        var responseData = await jsonDecode(response.body);
        TeacherUser.currentTeacher = new Teacher(
            id: responseData['_id'],
            fullName: responseData['fullName'],
            gender: responseData['gender'],
            experience: responseData['experience'],
            location: responseData['location'],
            email: responseData['email'],
            phoneNumber: responseData['phoneNumber'],
            occupation: responseData['occupation'],
            institution: responseData['institution'],
            subject: responseData['subject'],
            picturePath: responseData['picturePath'],
            teachingSubject: responseData['teachingSubject'].join(","),
            minSalary: responseData['minSalary'],
            maxSalary: responseData['maxSalary']);
      }
    } catch (e) {
      throw CustomException("Something went wrong in server");
    }
  }
}
