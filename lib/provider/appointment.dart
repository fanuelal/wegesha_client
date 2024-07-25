import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wegesha_client/config/utils.dart';
import '../model/appointment.dart';
import 'package:http/http.dart' as http;

class AppointmentService extends ChangeNotifier {
  List<AppointmentModel> appointments = [
    // AppointmentModel(
    //     doctorId: "",
    //     patientId: '',
    //     imageUrl: "imageUrl",
    //     name: "Dr. Helene Alemayehu",
    //     date: DateTime.now(),
    //     time: "2:00AM",
    //     status: "pending",
    //     location: '11.23,23.32',
    //     fieldType: "Neurology")
  ];

  Future<void> createAppointment(
      AppointmentModel appointment, String token) async {
    try {
      print(appointment.id);
      print("doctor ID: ${appointment.doctorId}");
      print("ID: ${appointment.id}");
      print("patient: ${appointment.patientId}");

      final response = await http.post(
        Uri.parse('${Utils.baseUrl}/appointment'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "patientId": appointment.patientId,
          "doctorId": appointment.doctorId,
          "dateTime": appointment.date.toIso8601String(),
          "status": "Pending",
          "UserLocation": appointment.location,
          "notes": "Initial consultation",
        }),
      );

      final decodedData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        appointments.add(appointment);
      } else {
        print('Error: ${decodedData['message']}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> fetchAppointmentsByPatient(
      String patientId, String token) async {
    final url = Uri.parse('${Utils.baseUrl}/appointment/patient/$patientId');

    try {
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        final List<dynamic> responseData =
            json.decode(response.body)['data'] ?? [];
        appointments = [];
        responseData.forEach((item) {
          // print("from the provider side: $item");
          appointments.add(AppointmentModel.fromJson(item));
        });
        print(appointments);
        notifyListeners();
      } else {
        print('error on load appointments ${response.body}');
        // throw Exception('Failed to load appointments');
      }
    } catch (error) {
      // throw error;
      print(error);
    }
  }

  Future<void> deleteAppointment(AppointmentModel appointment) async {
    try {
      final response = await http
          .delete(Uri.parse('${Utils.baseUrl}/appointment/${appointment.id}'));
      if (response.statusCode == 200) {
        appointments.add(appointment);
      }
    } catch (error) {
      print(error);
    }
  }
}
