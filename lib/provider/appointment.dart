import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wegesha_client/config/utils.dart';
import '../model/appointment.dart';
import 'package:http/http.dart' as http;

class AppointmentService extends ChangeNotifier {
  List<Appointment> appointments = [
    Appointment(
        doctorId: "",
        imageUrl: "imageUrl",
        name: "Dr. Helene Alemayehu",
        date: "jul 20, 2024",
        time: "2:00AM",
        status: "pending",
        fieldType: "Neurology")
  ];

  Future<void> createAppointment(Appointment appointment) async {
    try {
      final response =
          await http.post(Uri.parse('${Utils.baseUrl}/appointment'), 
          body: jsonEncode(appointment),
          headers: {

          }
          );
      final decodedData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        appointments.add(appointment);
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> deleteAppointment(Appointment appointment) async {
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
