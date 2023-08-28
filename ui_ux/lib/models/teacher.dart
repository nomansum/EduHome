import 'dart:convert';

class Teacher {
  final String id;
  final String fullName;
  final String gender;
  final String experience;
  final String location;
  final String email;
  final String phoneNumber;
  final String occupation;
  final String institution;
  final String subject;
  String? picturePath;
  final String teachingSubject;
  final String minSalary;

  var rating;

  final String maxSalary;

  Teacher(
      {required this.id,
      required this.fullName,
      required this.gender,
      required this.experience,
      required this.location,
      required this.email,
      required this.phoneNumber,
      required this.occupation,
      required this.institution,
      required this.subject,
      this.picturePath,
      required this.teachingSubject,
      required this.minSalary,
      required this.maxSalary,
      this.rating});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      "fullName": fullName,
      "gender": gender,
      "experience": experience,
      "location": location,
      "email": email,
      "phoneNumber": phoneNumber,
      "occupation": occupation,
      "institution": institution,
      "subject": subject,
      "picturePath": picturePath,
      "teachingSubject": teachingSubject,
      "minSalary": minSalary,
      "maxSalary": maxSalary,
    };
  }

  String toJson() => json.encode(toMap());
}
