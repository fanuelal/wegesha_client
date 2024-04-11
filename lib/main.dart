import 'package:flutter/material.dart';
import 'package:wegesha_client/screens/appointment.dart';
// import 'package:wegesha_client/screens/Splash.dart';

// import 'package:wegesha_client/screens/direct.dart';
// import './screens/auth_page.dart';
// import 'screens/auth_type.dart';
// import 'package:wegesha_client/screens/sign_in.dart';
 import './screens/list_doctor.dart';

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
      home:  const Appointment(),
    );
  }
}
