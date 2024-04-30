import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import '../model/user.dart';
import '../config/utils.dart';
import 'package:http/http.dart' as http;

class Auth extends ChangeNotifier {
  final url = Uri.parse('${Utils.baseUrl}/login');
  late UserModel userProfile;
  bool isLoggedIn = false;
  static late String accessToken;
  Future<String> signIn(String email, String password) async {
    var message = "";
    if (email != null && password != null) {
      try {
        var response = await http
            .post(
          url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'email': email, 'password': password}),
        )
            .timeout(
          const Duration(seconds: 30),
          onTimeout: () {
            throw TimeoutException(
                'The connection timed out, please try again.');
          },
        );
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
      } on TimeoutException catch (error) {
        return error.toString();
      } catch (error) {
        print(error);
        // throw (error);
        return "Connection Failed";
      }
    } else {
      return "All input are required";
    }
  }

  void rememberMe() {}
}
