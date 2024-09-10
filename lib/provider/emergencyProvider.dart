import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../config/utils.dart';
import '../model/emergency.dart';
import 'auth.dart';

class EmergencyService extends ChangeNotifier {
  Emergency currencEmergency = Emergency(
      type: "Healthcare",
      location: "",
      acceptedBy: "",
      status: "pending",
      userId: "userId");
  Future<bool> createEmergency(Emergency emergency, String accessToken) async {
    final response = await http.post(
      Uri.parse('${Utils.baseUrl}/emrgency'),
      body: jsonEncode(emergency.toMap()),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
    );
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      currencEmergency = emergency;
      return true;
    } else {
      return false;
    }
  }

  Future<bool> isEmergencyAvailable(Emergency emergency) async {
    final response = await http.get(
      Uri.parse('${Utils.baseUrl}/emrgency/${emergency.id}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ',
      },
    );
    return false;
  }

  static Future<List<Emergency>> fetchEmergencies() async {
    final response =
        await http.get(Uri.parse('${Utils.baseUrl}/emrgency'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ',
    });
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Emergency.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch emergencies');
    }
  }

  static Future<void> updateEmergency(Emergency emergency) async {
    final response = await http.put(
      Uri.parse('${Utils.baseUrl}/emrgency'),
      body: jsonEncode(emergency.toMap()),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ',
      },
    );
  }

  static Future<void> deleteEmergency(int id) async {
    final response =
        await http.delete(Uri.parse('${Utils.baseUrl}/emr,gency'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ',
    });
  }
}
