import 'package:flutter/material.dart';
import '../config/theme.dart';
import 'package:google_fonts/google_fonts.dart';

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
    AspectRatio(
      aspectRatio: 9/16,
      child: Image.asset('assets/logo_2.png')),
    ElevatedButton(
        style: ButtonStyle(
            maximumSize: MaterialStateProperty.all<Size>(
                Size(size.width, size.height)),
            textStyle: MaterialStateProperty.all<TextStyle>(GoogleFonts.inter(fontSize: 16)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32))),
            foregroundColor:
                MaterialStateProperty.all<Color>(ColorTheme.white),
            backgroundColor:
                MaterialStateProperty.all<Color>(ColorTheme.primaryColor)),
        onPressed: () {},
        child: const Text('hi I am here'))
          ],
        );
  }
}
