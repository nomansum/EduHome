import 'dart:convert';

class Student {
  final String id;
  final String fullName;
  final String location;
  final String email;
  final String phoneNumber;
  String? picturePath;
  final String institution;

  final String classStudies;

  Student({
    required this.id,
    required this.fullName,
    required this.location,
    required this.email,
    required this.phoneNumber,
    this.picturePath,
    required this.institution,
    required this.classStudies,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      "fullName": fullName,
      "location": location,
      "email": email,
      "phoneNumber": phoneNumber,
      "picturePath": picturePath,
      "institution": institution,
      "classStudies": classStudies,
    };
  }

  String toJson() => json.encode(toMap());
}
