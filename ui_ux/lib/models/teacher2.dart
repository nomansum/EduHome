class Teacher2 {
  final String id;
  final String fullName;
  final String gender;
  final String experience;
  final String location;
  final String email;
  final String phoneNumber;
  // final String password;
  final String occupation;
  final String institution;
  final String subject;
  final String picturePath;
  final List<String> teachingSubject;
  final List<int> rating;
  final String minSalary;
  final String maxSalary;
  final List<String> studentId;

  Teacher2({
    required this.id,
    required this.fullName,
    required this.gender,
    required this.experience,
    required this.location,
    required this.email,
    required this.phoneNumber,
    // required this.password,
    required this.occupation,
    required this.institution,
    required this.subject,
    required this.picturePath,
    required this.teachingSubject,
    required this.rating,
    required this.minSalary,
    required this.maxSalary,
    required this.studentId,
  });

  double calculateMeanRating() {
    if (rating.isEmpty) {
      return 3.0; // Default rating if no values are present
    }

    int totalRatings = rating.reduce((sum, value) => sum + value);
    return totalRatings / rating.length;
  }

  factory Teacher2.fromJson(Map<String, dynamic> json) {
    return Teacher2(
      id: json['_id'],
      fullName: json['fullName'],
      gender: json['gender'],
      experience: json['experience'],
      location: json['location'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      // password: json['password'],
      occupation: json['occupation'],
      institution: json['institution'],
      subject: json['subject'],
      picturePath: json['picturePath'],
      teachingSubject: List<String>.from(json['teachingSubject']),
      rating: List<int>.from(json['rating'] ?? []),
      minSalary: json['minSalary'],
      maxSalary: json['maxSalary'],
      studentId: List<String>.from(json['studentId']),
    );
  }
}
