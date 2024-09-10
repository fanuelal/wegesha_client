import './user.dart';

class HCP {
  final String id;
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
      {this.id = '',
      required this.specialty,
      required this.experienceYears,
      required this.rateCount,
      required this.rated,
      required this.firstname,
      this.isOnline = false,
      required this.lastName,
      this.phoneNumber = "",
      this.profilePicture =
          'https://img.freepik.com/premium-photo/international-doctors-day-illustration-doctorshappy-doctors-day-ai-generated_852336-19213.jpg',
      required this.description});

  factory HCP.fromJson(Map<String, dynamic> json) {
    var profilePicture = json['profilePicture'] == ''
        ? 'https://img.freepik.com/premium-photo/international-doctors-day-illustration-doctorshappy-doctors-day-ai-generated_852336-19213.jpg'
        : json['profilePicture'];
    print(json['profilePicture']);
    print(json['profilePicture'] ?? 'hellow world');
    return HCP(
      id: json['id'] ?? '',
      specialty: json['specialty'] ?? '',
      experienceYears: json['experienceYears'] ?? 0,
      rateCount: json['rateCount'] ?? 0,
      rated: (json['rated'] ?? 0).toDouble(),
      firstname: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      isOnline: json['isOnline'] ?? false,
      profilePicture: profilePicture,
      description: json['description'] ?? '',
    );
  }
  Map<String, dynamic> toMap(HCP hpc) {
    return {
      'id': hpc.id,
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
