import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../config/utils.dart';
import '../model/emergency.dart';
import 'auth.dart';

class EmergencyService extends ChangeNotifier {
  static Future<void> createEmergency(Emergency emergency) async {
    final response = await http.post(
      Uri.parse('${Utils.baseUrl}/emrgency'),
      body: jsonEncode(emergency.toMap()),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Auth.accessToken}',
      },
    );
  }

  static Future<List<Emergency>> fetchEmergencies() async {
    final response =
        await http.get(Uri.parse('${Utils.baseUrl}/emrgency'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Auth.accessToken}',
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
        'Authorization': 'Bearer ${Auth.accessToken}',
      },
    );
  }

  static Future<void> deleteEmergency(int id) async {
    final response =
        await http.delete(Uri.parse('${Utils.baseUrl}/emr,gency'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Auth.accessToken}',
    });
  }
}
