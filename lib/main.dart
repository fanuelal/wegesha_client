import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wegesha_client/screens/auth_board.dart';
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
        ChangeNotifierProvider(create: (_) => UserProvider())
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
      // home: const AuthPage(title: 'Login'),
      home: AuthPage(
        title: "login",
      ),
    );
  }
}
