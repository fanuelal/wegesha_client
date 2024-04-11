import './user.dart';

class HPC extends UserModel {
  final String licenseImage;
  final String specialty;
  final String experienceYears;
  final int rateCount;
  final double rated;

  HPC(
      {firstname,
      email,
      lastName,
      phoneNumber,
      dateOfBirth,
      userType,
      isOnline,
      profilePicture,
      required this.licenseImage,
      required this.specialty,
      required this.experienceYears,
      required this.rateCount,
      required this.rated})
      : super(
            email: email,
            firstName: firstname,
            lastName: lastName,
            phoneNumber: phoneNumber,
            dateOfBirth: dateOfBirth,
            userType: userType,
            isOnline: isOnline,
            profilePicture: profilePicture);
}
