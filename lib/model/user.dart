class UserModel {
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String dateOfBirth;
  final String userType;
  String location;
  final bool isOnline;
  String profilePicture;

  UserModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.userType,
    this.location = "",
    required this.isOnline,
    this.profilePicture = "",
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
      userType: json['userType'] ?? '',
      location: json['location'] ?? '',
      isOnline: json['isOnline'] ?? false,
      profilePicture: json['profilePicture'] ?? '',
    );
  }

    Map<String, dynamic> toJson() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'dateOfBirth': dateOfBirth,
      'userType': userType,
      'location': location,
      'isOnline': isOnline,
      'profilePicture': profilePicture,
    };
  }
}
