import './user.dart';

class HCP {
  final String specialty;
  final int experienceYears;
  final int rateCount;
  final double rated;
  final firstname;
  final lastName;
  String phoneNumber;
  bool isOnline;
  final String profilePicture;
  final description;
  HCP(
      {required this.specialty,
      required this.experienceYears,
      required this.rateCount,
      required this.rated,
      required this.firstname,
      this.isOnline = false,
      required this.lastName,
      this.phoneNumber = "",
      required this.profilePicture,
      required this.description});

  factory HCP.fromJson(Map<String, dynamic> json) {
    return HCP(
        specialty: json["specialty"],
        experienceYears: json["experienceYears"],
        rateCount: json["rateCount"],
        rated: json["rated"] is double ? json["rated"] : 0.0,
        firstname: json["firstName"],
        lastName: json["lastName"],
        profilePicture: json["profilePicture"],
        description: json["description"]);
  }
  Map<String, dynamic> toMap(HCP hpc) {
    return {
      'firstname': hpc.firstname,
      'lastName': hpc.lastName,
      'specialty': hpc.specialty,
      'experienceYears': hpc.experienceYears,
      'rateCount': hpc.rateCount,
      'rated': hpc.rated,
      'profilePicture': hpc.profilePicture,
      'description': hpc.description
    };
  }
}
