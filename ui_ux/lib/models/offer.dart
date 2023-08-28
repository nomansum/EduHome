class Offer {
  final String studentName;
  final String studentId;
  final String teacherId;
  final String classNumber;
  final String picturePath;
  final String location;
  final String note;

  Offer({
    required this.studentName,
    required this.studentId,
    required this.teacherId,
    required this.classNumber,
    required this.picturePath,
    required this.location,
    required this.note,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      studentName: json['studentName'],
      studentId: json['studentId'],
      teacherId: json['teacherId'],
      classNumber: json['classStudies'] ?? 0,
      picturePath: json['picturePath'],
      location: json['location'],
      note: json['note'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'studentName': studentName,
      'studentId': studentId,
      'teacherId': teacherId,
      'class': classNumber,
      'location': location,
      'note': note,
    };
  }
}
