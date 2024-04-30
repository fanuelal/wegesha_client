import './user.dart';

class HPC {
  final String specialty;
  final String experienceYears;
  final int rateCount;
  final double rated;
  final firstname;
  final lastName;
  String phoneNumber;
  bool isOnline;
  final String profilePicture;
  final description;
  HPC(
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

  factory HPC.fromJson(Map<String, dynamic> json) {
    return HPC(
        specialty: json["specialty"],
        experienceYears: json["experienceYears"],
        rateCount: json["rateCount"],
        rated: json["rated"],
        firstname: ["firstname"],
        lastName: ["lastName"],
        profilePicture: json["profilePicture"],
        description: json["description"]);
  }
  Map<String, dynamic> toMap(HPC hpc) {
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
