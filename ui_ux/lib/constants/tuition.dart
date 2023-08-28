class Tuition {
  final String id;
  final String preferredGender;
  final String tuitionType;
  final int daysInWeek;
  final double salary;
  final String studentClass;
  final String subjects;
  final String address;
  final bool booked;
  Tuition(
      {required this.id,
      required this.preferredGender,
      required this.tuitionType,
      required this.daysInWeek,
      required this.salary,
      required this.studentClass,
      required this.subjects,
      required this.address,
      required this.booked});
}
