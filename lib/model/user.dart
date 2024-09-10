class UserModel {
  String id;
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
    this.id = '',
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
      id: json['id'] ?? '',
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
      'id': id,
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


// "id": "9e033d75-b094-47eb-8f25-23d6c908cc2c",
//       "email": "fan@gmail.com",
//       "password": "$2b$10$5AL4wAO5o.PW.aL2RKYP4OSQ6TpuRqFGMjXs6fbvCqECVutQGu.Na",
//       "firstName": "Fanuel",
//       "lastName": "Almaw",
//       "phoneNumber": null,
//       "dateOfBirth": "2000-03-09",
//       "userType": "client",
//       "location": null,
//       "isOnline": true,
//       "profilePicture": null,
//       "createdAt": "2024-04-12T19:00:14.000Z",
//       "updatedAt": "2024-04-12T19:00:14.000Z"
//     }