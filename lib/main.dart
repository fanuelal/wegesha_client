import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wegesha_client/provider/emergencyProvider.dart';
import 'package:wegesha_client/provider/hcp_provider.dart';
import 'package:wegesha_client/screens/auth_board.dart';
import 'package:wegesha_client/screens/home_screen.dart';
import 'package:wegesha_client/screens/profile.dart';
import './provider/auth.dart';
import 'provider/user.provider.dart';
import 'screens/auth_page.dart';
import 'screens/mapScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => EmergencyService()),
        ChangeNotifierProvider(create: (_) => Hcp_Provider()),
        ChangeNotifierProvider(create: (_) => EmergencyService())
      ],
      child: const MyApp(),
    ),
  );
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
      routes: {
        // HomeScreen.route:(context) => HomeScreen(),
        Profile.route:(context) => const Profile(),
      },
      home: const AuthPage(
        title: "login",
      ),
    );
  }
}
