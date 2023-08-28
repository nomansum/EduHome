import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ui_ux/constants/ip.dart';
import 'package:ui_ux/models/advertisement.dart';
import 'package:ui_ux/models/notification.dart';
import 'package:ui_ux/models/student2.dart';
import 'package:ui_ux/models/teacher2.dart';

import '../../../models/offer.dart';

class ApiService {
  final String baseUrl = '${ip}';

  Future<List<Advertisement>> fetchTuitionList(BuildContext context) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/teacher/advertisement'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<Advertisement> tuitionList = List<Advertisement>.from(
          data.map((json) => Advertisement.fromJson(json)),
        );
        return tuitionList;
      } else {
        throw Exception('Failed to fetch tuition list');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Offer>> fetchPendingOffersForTeacher(String teacherId) async {
    try {
      final response = await http.get(
        //  Uri.parse('$baseUrl/api/teacher/$teacherId/pendingOffer'),

        //for checking purpose
        Uri.parse('$baseUrl/api/teacher/$teacherId/pendingOffer'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        List<Offer> pendingOffers =
            jsonData.map((json) => Offer.fromJson(json)).toList();
        return pendingOffers;
      } else {
        throw Exception(
            'Failed to fetch pending offers for teacher: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching pending offers: $e');
    }
  }

  Future<List<Student2>> fetchMyStudentsForTeacher(String teacherId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/teacher/$teacherId/myStudents'),

        //for checking purpose
        //  Uri.parse('$baseUrl/api/teacher/$teacherId/myStudents'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        List<Student2> myStudents =
            jsonData.map((json) => Student2.fromJson(json)).toList();
        return myStudents;
      } else {
        throw Exception(
            'Failed to fetch students for teacher: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching students for teacher: $e');
    }
  }

  Future<Teacher2> fetchTeacherDetails(String teacherId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/teacher/$teacherId/profile'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);
        Teacher2 teacherDetails = Teacher2.fromJson(jsonData);
        return teacherDetails;
      } else {
        throw Exception(
            'Failed to fetch teacher details: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching teacher details: $e');
    }
  }

  Future<bool> updateTeacherProfile(
      String teacherId, Map<String, dynamic> data) async {
    try {
      final response = await http.patch(
        Uri.parse('$baseUrl/api/teacher/$teacherId/profile'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<List<Advertisement>> fetchFilteredAdvertisements({
    String? subject,
    String? gender,
    String? tuitionType,
    int? salaryRange,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(
            '$baseUrl/api/teacher/applyFilter?subject=$subject&gender=$gender&tuitionType=$tuitionType&salaryRange=$salaryRange'),
        headers: {'Content-Type': 'application/json'},
        // You can pass the filter parameters as query parameters here
        // For example:
        // Uri.parse('$baseUrl/api/teacher/filter?subject=$subject&gender=$gender&experience=$experience&salaryRange=$salaryRange&ratings=$ratings'),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<Advertisement> filteredAdvertisements = List<Advertisement>.from(
          data.map((json) => Advertisement.fromJson(json)),
        );
        return filteredAdvertisements;
      } else {
        throw Exception('Failed to fetch filtered advertisements');
      }
    } catch (e) {
      throw Exception('Error fetching filtered advertisements: $e');
    }
  }

  Future<bool> acceptTuitionOffer(String teacherId, String studentId) async {
    try {
      final response = await http.post(
        Uri.parse(
            //  '$baseUrl/api/teacher/64d8e7d6b7f46ededc395c1e/pendingOffer/$studentId'),
            '$baseUrl/api/teacher/$teacherId/pendingOfferAc/$studentId'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Successfully accepted offer, update state or perform necessary actions
        return true;
      } else {
        // Handle error
        return false;
      }
    } catch (e) {
      // Handle error
      return false;
    }
  }

  Future<bool> rejectTuitionOffer(String teacherId, String studentId) async {
    try {
      final response = await http.post(
        Uri.parse(
            //  '$baseUrl/api/teacher/$teacherId/pendingOffer/$studentId'),
            '$baseUrl/api/teacher/$teacherId/pendingOfferRe/$studentId'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Successfully accepted offer, update state or perform necessary actions
        return true;
      } else {
        // Handle error
        return false;
      }
    } catch (e) {
      // Handle error
      return false;
    }
  }

  Future<bool> applyForTuitionAdvertisement(
      String teacheId, String advertisementId) async {
    final String teacherId = teacheId;

    final Map<String, dynamic> data = {'teacherId': teacherId};

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/teacher/advertisement/apply/$advertisementId'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        //  throw Exception('Failed to apply for tuition');
        return false;
      }
    } catch (e) {
      //throw Exception('Error applying for tuition: $e');
      return false;
    }
  }

  Future<List<NotificationModel>> fetchTeacherNotifications(
      String teacherId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/teacher/$teacherId/notifications'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        List<NotificationModel> notifications =
            jsonData.map((json) => NotificationModel.fromJson(json)).toList();
        return notifications;
      } else {
        throw Exception(
            'Failed to fetch notifications for teacher: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching notifications for teacher: $e');
    }
  }
}
