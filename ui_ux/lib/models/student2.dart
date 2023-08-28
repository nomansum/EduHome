class Student2 {
  final String fullName;
  final String classStudies;
  final String location;
  final String phoneNumber;
  // final String password;
  late final String picturePath;
  final String institution;
  final List<String> teacherId;
  final String email;

  Student2({
    required this.fullName,
    required this.classStudies,
    required this.location,
    required this.phoneNumber,
    // required this.password,
    required this.picturePath,
    required this.institution,
    required this.teacherId,
    required this.email,
  });

  factory Student2.fromJson(Map<String, dynamic> json) {
    return Student2(
      fullName: json['fullName'],
      classStudies: json['classStudies'],
      location: json['location'],
      phoneNumber: json['phoneNumber'],
      // password: json['password'],
      picturePath: json['picturePath'],
      institution: json['institution'],
      teacherId: List<String>.from(json['teacherId']),
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'classStudies': classStudies,
      'location': location,
      'phoneNumber': phoneNumber,
      //    'password': password,
      'picturePath': picturePath,
      'institution': institution,
      'teacherId': teacherId,
      'email': email,
    };
  }
}
