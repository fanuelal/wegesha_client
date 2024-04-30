import 'package:flutter/material.dart';
import '../model/hcp.dart';

class Hcp_Provider extends ChangeNotifier {
  // userId, licenseImage, specialty, experienceYears, rateCount, rated
  List<HCP> hpcs = [
    new HCP(
        specialty: "Pediatrics",
        experienceYears: 8,
        rateCount: 30,
        rated: 4.7,
        firstname: "Alice",
        lastName: "Smith",
        profilePicture: "alice_profile.jpg",
        description:
            "Passionate about providing comprehensive care for children."),
    new HCP(
        specialty: "Dermatology",
        experienceYears: 12,
        rateCount: 60,
        rated: 3.2,
        firstname: "Michael",
        lastName: "Johnson",
        profilePicture: "michael_profile.jpg",
        description:
            "Skilled in diagnosing and treating various skin conditions."),
    new HCP(
        specialty: "Orthopedics",
        experienceYears: 15,
        rateCount: 45,
        rated: 4.5,
        firstname: "Emily",
        lastName: "Brown",
        profilePicture: "emily_profile.jpg",
        description: "Expertise in orthopedic surgeries and rehabilitation."),
         HCP(
      specialty: "Cardiology",
      experienceYears: 20,
      rateCount: 70,
      rated: 4.7,
      firstname: "David",
      lastName: "Wilson",
      profilePicture: "david_profile.jpg",
      description: "Specializes in heart conditions and cardiac surgeries.",
    ),
    HCP(
      specialty: "Neurology",
      experienceYears: 18,
      rateCount: 55,
      rated: 4.6,
      firstname: "Sophia",
      lastName: "Garcia",
      profilePicture: "sophia_profile.jpg",
      description: "Expert in diagnosing and treating neurological disorders.",
    ),
    // Additional static samples
    HCP(
      specialty: "Ophthalmology",
      experienceYears: 10,
      rateCount: 40,
      rated: 4.4,
      firstname: "Oliver",
      lastName: "Roberts",
      profilePicture: "oliver_profile.jpg",
      description: "Specializes in eye diseases and surgeries.",
    ),
    HCP(
      specialty: "Gastroenterology",
      experienceYears: 22,
      rateCount: 65,
      rated: 4.9,
      firstname: "Emma",
      lastName: "Davis",
      profilePicture: "emma_profile.jpg",
      description: "Expert in digestive system disorders and treatments.",
    ),
  ];
  List<HCP> filterHome() {
    hpcs.sort((a, b) => a.rated.compareTo(b.rated));
    List<HCP> homeFiltered = hpcs.sublist(0, 3);
    return homeFiltered;
  }
}
