import 'dart:convert';

class FilterObjectStudent {
  String teachingSubject;
  String gender;
  String experience;
  String minSalary;
  String maxSalary;
  String location;

  FilterObjectStudent({
    this.teachingSubject = "",
    this.gender = "",
    this.experience = "",
    this.minSalary = "",
    this.maxSalary = "",
    this.location = "",
  });

  Map<String, dynamic> toMap() {
    return {
      'teachingSubject': teachingSubject,
      'gender': gender,
      'experience': experience,
      'minSalary': minSalary,
      'maxSalary': maxSalary,
      'location': location,
    };
  }

  String toJson() => jsonEncode(toMap());
}
