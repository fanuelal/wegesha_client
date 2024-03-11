import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wegesha_client/screens/sign_in.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(milliseconds: 1500), () => {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AuthScreen()))
    });

}

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Wegesha'),

        ),
      ),
    );
  }
}