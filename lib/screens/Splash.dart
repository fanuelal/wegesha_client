import 'dart:async';

import 'package:flutter/material.dart';
import 'onboarding.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(milliseconds: 2500),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => OnBoarding())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff199A8E),
      body: Center(
        child: AspectRatio(
            aspectRatio: 9 / 16,
            child: Image.asset(
              'assets/white_logo.png',
            )),
      ),
    );
  }
}
