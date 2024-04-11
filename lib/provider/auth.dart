import 'dart:convert';

import 'package:flutter/material.dart';
import '../model/user.dart';
import '../config/utils.dart';
import 'package:http/http.dart' as http;

class Auth extends ChangeNotifier {
  final url = Uri.parse('${Utils.baseUrl}/login');
  late UserModel userProfile;
  bool isLoggedIn = false;
  late String accessToken;
  Future<String> signIn(email, password) async {
    try {
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'email': email, 'password': password}));
      final data = response.body;
      final decodedData = jsonDecode(data);
      if (response.statusCode == 200) {
        userProfile = UserModel.fromJson(decodedData['data']);
        print(userProfile);
        isLoggedIn = true;
        accessToken = decodedData['accessToken'];
        notifyListeners();
        return decodedData['message'];
      } else {
        isLoggedIn = false;
        notifyListeners();
        return decodedData['message'];
      }
    } catch (error) {
      throw (error);
    }
  }
}
