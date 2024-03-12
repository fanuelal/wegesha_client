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
    // final size = MediaQuery.of(context).size;
    return Column(
          children: [
    Image.asset('assets/logo.png'),
    // Button(height: 0.1, width: 0.5, onTap: () {}, isElevated: false),
    Button(height: 0.1, width: 0.5, onTap: () {},)
          ],
        );
  }
}
