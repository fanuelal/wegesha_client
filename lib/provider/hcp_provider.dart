import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wegesha_client/config/utils.dart';
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
        profilePicture:
            "https://media.istockphoto.com/id/1372002650/photo/cropped-portrait-of-an-attractive-young-female-doctor-standing-with-her-arms-folded-in-the.jpg?s=612x612&w=0&k=20&c=o1QtStNsowOU0HSof6xQ_jZMglU8ZK565gHd655U6S4=",
        description:
            "Passionate about providing comprehensive care for children."),
    new HCP(
        specialty: "Dermatology",
        experienceYears: 12,
        rateCount: 60,
        rated: 3.2,
        firstname: "Michael",
        lastName: "Johnson",
        profilePicture:
            "https://media.istockphoto.com/id/1197650057/photo/portrait-of-female-nurse-using-tablet-at-hospital.jpg?s=612x612&w=0&k=20&c=Z46rTvNKqQfwQv0KYNQj4DbU3fDZ1hP4atPyMgYDZBg=",
        description:
            "Skilled in diagnosing and treating various skin conditions."),
    new HCP(
        specialty: "Orthopedics",
        experienceYears: 15,
        rateCount: 45,
        rated: 4.5,
        firstname: "Emily",
        lastName: "Brown",
        profilePicture:
            "https://www.phoenixmag.com/wp-content/uploads/2022/03/PHM0422TD07-scaled.jpg",
        description: "Expertise in orthopedic surgeries and rehabilitation."),
    HCP(
      specialty: "Cardiology",
      experienceYears: 20,
      rateCount: 70,
      rated: 4.7,
      firstname: "David",
      lastName: "Wilson",
      profilePicture:
          "https://t4.ftcdn.net/jpg/03/20/52/31/240_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg",
      description: "Specializes in heart conditions and cardiac surgeries.",
    ),
    HCP(
      specialty: "Neurology",
      experienceYears: 18,
      rateCount: 55,
      rated: 4.6,
      firstname: "Sophia",
      lastName: "Garcia",
      profilePicture:
          "https://t3.ftcdn.net/jpg/03/08/95/96/240_F_308959677_9dsUpeKnj2wWy42Vr8ofYNeKoazLXgSX.jpg",
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
      profilePicture:
          "https://t3.ftcdn.net/jpg/02/95/51/80/240_F_295518052_aO5d9CqRhPnjlNDTRDjKLZHNftqfsxzI.jpg",
      description: "Specializes in eye diseases and surgeries.",
    ),
    HCP(
      specialty: "Gastroenterology",
      experienceYears: 22,
      rateCount: 65,
      rated: 4.9,
      firstname: "Emma",
      lastName: "Davis",
      profilePicture:
          "https://t4.ftcdn.net/jpg/03/05/41/27/240_F_305412791_XRNiWaFCREjLLpSQfj0e736foBoYXXYv.jpg",
      description: "Expert in digestive system disorders and treatments.",
    ),
  ];
  List<HCP> filterHome() {
    hpcs.sort((a, b) => a.rated.compareTo(b.rated));
    List<HCP> homeFiltered = hpcs.sublist(0, 3);
    return homeFiltered;
  }

 
Future<List<HCP>> getAllHCP(String accessToken) async {
  try {
    final response =
        await http.get(Uri.parse('${Utils.baseUrl}/hcp'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    }); 
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<HCP> newHcpList = [];
      if (data['data'] != null && data['data'].isNotEmpty) {
        List<dynamic> dynamicList = data['data'];
        newHcpList = dynamicList.map((json) => HCP.fromJson(json)).toList();
      }
      hpcs.addAll(newHcpList);
      return hpcs;
    } else {
      print('Error: Response status is not 200');
      return [];
    }
  } catch (error) {
    print('Error on HCP fetching: $error');
    return [];
  }
}
}
