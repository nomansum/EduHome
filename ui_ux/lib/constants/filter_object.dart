import 'dart:convert';

class FilterObject {
  String subjects;
  String teacherGender;
  String daysInWeek;
  String minSalary;
  String maxSalary;
  String location;

  FilterObject({
    this.subjects = "",
    this.teacherGender = "",
    this.daysInWeek = "",
    this.minSalary = "",
    this.maxSalary = "",
    this.location = "",
  });

  Map<String, dynamic> toMap() {
    return {
      'subjects': subjects,
      'teacherGender': teacherGender,
      'daysInWeek': daysInWeek,
      'minSalary': minSalary,
      'maxSalary': maxSalary,
      'location': location,
    };
  }

  String toJson() => jsonEncode(toMap());
}
