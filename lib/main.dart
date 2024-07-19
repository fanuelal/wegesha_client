import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wegesha_client/provider/emergencyProvider.dart';
import 'package:wegesha_client/provider/hcp_provider.dart';
import 'package:wegesha_client/screens/Splash.dart';
import 'package:wegesha_client/screens/auth_board.dart';
import 'package:wegesha_client/screens/home_screen.dart';
import 'package:wegesha_client/screens/profile.dart';
import 'package:wegesha_client/widget/bottomNavBar.dart';
import './provider/auth.dart';
import 'provider/user.provider.dart';
import 'screens/auth_page.dart';
import 'screens/mapScreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => EmergencyService()),
        ChangeNotifierProvider(create: (_) => Hcp_Provider()),
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
        Profile.route: (context) => const Profile(),
      },
      home: const AuthOrHome(),
    );
  }
}

class AuthOrHome extends StatefulWidget {
  const AuthOrHome({super.key});

  @override
  _AuthOrHomeState createState() => _AuthOrHomeState();
}

class _AuthOrHomeState extends State<AuthOrHome> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    await Provider.of<Auth>(context, listen: false).getTokenLocally();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    print("_isloading is running $_isLoading");
    if (_isLoading) {
      print("splash screen popup");
      return const Splash();
    } else {
      return auth.accessToken.isEmpty
          ? const AuthPage(title: "Login")
          : BottomNav(accessToken: auth.accessToken);
    }
  }
}
