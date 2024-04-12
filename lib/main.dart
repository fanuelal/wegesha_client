import 'package:flutter/material.dart';
import 'package:wegesha_client/screens/auth_page.dart';
// import 'package:wegesha_client/screens/Splash.dart';
// import 'package:wegesha_client/screens/profile.dart';
// import './screens/auth_page.dart';
// import 'screens/home_screen.dart';
// import 'screens/auth_type.dart';
// import 'package:wegesha_client/screens/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wegesha',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthPage(title: "Login",),
    );
  }
}
