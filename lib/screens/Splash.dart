import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wegesha_client/screens/auth_board.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(milliseconds: 2500), () => {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AuthScreen()))
    });

}

   @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xff199A8E),
        
      body: Center(
        
        child: Container(
          child: AspectRatio(
      aspectRatio: 9/16,
      child: Image.asset('assets/logo.png',))
        

        ),
       
      ),
    );
  }
}