class Advertisement {
  String id;
  String tuitionType;
  String classNumber;
  String teacherGender;
  int daysInWeek;
  int salary;
  String subjects;
  String location;
  String studentId;
  List<String> teacherId;
  bool booked;
  bool applied;

  Advertisement({
    required this.id,
    required this.tuitionType,
    required this.classNumber,
    required this.teacherGender,
    required this.daysInWeek,
    required this.salary,
    required this.subjects,
    required this.location,
    required this.studentId,
    required this.teacherId,
    required this.booked,
    required this.applied,
  });

  factory Advertisement.fromJson(Map<String, dynamic> json) {
    return Advertisement(
      id: json['_id'],
      tuitionType: json['tuitionType'],
      classNumber: json['class'],
      teacherGender: json['teacherGender'],
      daysInWeek: json['daysInWeek'],
      salary: json['salary'],
      subjects: json['subjects'],
      location: json['location'],
      studentId: json['studentId'],
      teacherId: List<String>.from(json['teacherId']),
      booked: json['booked'],
      applied: json['applied'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'tuitionType': tuitionType,
      'class': classNumber,
      'teacherGender': teacherGender,
      'daysInWeek': daysInWeek,
      'salary': salary,
      'subjects': subjects,
      'location': location,
      'studentId': studentId,
      'teacherId': teacherId,
      'booked': booked.toString(),
    };

    // Add id field only if it's not empty
    if (id.isNotEmpty) {
      data['_id'] = id;
    }

    return data;
  }
}
