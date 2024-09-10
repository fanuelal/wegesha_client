import 'dart:async';
import 'package:flutter/material.dart';
import 'onboarding.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _controller.forward().then((_) {
      Timer(
          const Duration(milliseconds: 1500),
          () {
          if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OnBoarding()),
          );
        }
          } 
              );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff199A8E),
        body: Center(
          child: AspectRatio(
            aspectRatio: 9 / 16,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: FadeTransition(
                opacity: _opacityAnimation,
                child: Image.asset(
                  'assets/white_logo.png',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
