import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user.dart';
import '../config/utils.dart';
import 'package:http/http.dart' as http;

class Auth extends ChangeNotifier {
  final url = Uri.parse('${Utils.baseUrl}/login');
  late UserModel userProfile;
  bool isLoggedIn = false;
  String accessToken = '';
  Future<String> signIn(String email, String password) async {
    var message = "";
    if (email != null && password != null) {
      try {
        print('${Utils.baseUrl}/login');

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
          isLoggedIn = true;
          accessToken = decodedData['data']['accessToken'];
          await _saveUserAndToken();
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
        return "Connection Failed ${error}";
      }
    } else {
      return "All input are required";
    }
  }

  Future<void> getTokenLocally() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('authToken') ?? '';
    final userProfileString = prefs.getString('userProfile');
    if (userProfileString != null) {
      userProfile = UserModel.fromJson(jsonDecode(userProfileString));
      print(userProfileString);
      isLoggedIn = true;
    }
    notifyListeners();
  }

  Future<void> _saveUserAndToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', accessToken);
    await prefs.setString('userProfile', jsonEncode(userProfile.toJson()));
  }

  void logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = "";
    userProfile = UserModel(
        email: "",
        firstName: "",
        lastName: "",
        phoneNumber: "",
        dateOfBirth: "",
        userType: "",
        isOnline: false);
    prefs.remove('authToken');
  }

  void rememberMe(String username, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('passkey', password);
  }

  Future<Map<String, String>> rememberedAccount() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = await prefs.getString('usename') ?? '';
    String password = await prefs.getString('password') ?? '';
    return {'username': username, 'password': password};
  }
}
