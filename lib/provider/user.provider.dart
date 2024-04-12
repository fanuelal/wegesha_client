import 'dart:convert';

import 'package:flutter/material.dart';
import '../model/user.dart';
import 'package:http/http.dart' as http;
import '../config/utils.dart';

class UserProvider extends ChangeNotifier {
  Future<String> createUser(Map<String, dynamic> user) async {
    String url = "${Utils.baseUrl}/user";
    try {
      user['userType'] = 'client';
      final response =
          await http.post(Uri.parse(url), body: {jsonEncode(user)});
      final decodedData = jsonDecode(response.body);
      if (decodedData.statusCode == 200) {
        return decodedData.message;
      }
      return decodedData.message;
    } catch (error) {
      throw (error);
    }
  }
}
