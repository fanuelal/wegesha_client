import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wegesha_client/config/theme.dart';
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
        Column(
          children: [
            SizedBox(
                height: size.height * 0.5,
                width: size.width * 0.8,
                child: Image.asset('assets/logo.png')),
            Column(
              children: [
                DefaultTextStyle(
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: ColorTheme.black),
                  child: const Text(
                    "Let’s get started!",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.1,
                      horizontal: size.width * 0.1),
                  child: DefaultTextStyle(
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: ColorTheme.gray),
                    child: const Text(
                      "Login to enjoy the features we’ve provided, and stay healthy!",
                    ),
                  ),
                ),
                //
              ],
            )
          ],
        ),
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
