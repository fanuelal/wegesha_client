import 'package:flutter/material.dart';
import '../widget/Button.dart';

class AuthType extends StatefulWidget {
  const AuthType({super.key});

  @override
  State<AuthType> createState() => _AuthTypeState();
}

class _AuthTypeState extends State<AuthType> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
            height: size.height * 0.5,
            width: size.width * 0.8,
            child: Image.asset('assets/logo.png')),
        Button(
            title: "Login",
            height: 0.1,
            width: 0.75,
            onTap: () {},
            isElevated: false),
        const SizedBox(
          height: 16,
        ),
        Button(
          title: "Sign Up",
          height: 0.1,
          width: 0.75,
          onTap: () {},
        )
      ],
    );
  }
}
