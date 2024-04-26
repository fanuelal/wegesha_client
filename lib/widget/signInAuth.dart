import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wegesha_client/provider/auth.dart';
import 'package:wegesha_client/widget/bottomNavBar.dart';

import '../config/theme.dart';
import '../screens/auth_page.dart';
import '../screens/home_screen.dart';
import 'Button.dart';
import 'input_filed.dart';

class SignInAuth extends StatefulWidget {
  const SignInAuth({super.key});

  @override
  State<SignInAuth> createState() => _SignInAuthState();
}

class _SignInAuthState extends State<SignInAuth> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLogging = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final auth = Provider.of<Auth>(context);
    return Column(children: [
      Container(
        margin: EdgeInsets.only(
            top: size.height * 0.05,
            right: size.width * 0.03,
            left: size.width * 0.03),
        child: InputFiled(
          controller: emailController,
          prefixIcon: Icons.email_outlined,
          placeholder: "Enter your email",
          color: ColorTheme.primaryColor,
          isError: false,
        ),
      ),
      Container(
        //  margin: const EdgeInsets.symmetric(vertical:100, horizontal: 10),
        margin: EdgeInsets.only(
            top: size.height * 0.05,
            right: size.width * 0.03,
            left: size.width * 0.03),

        child: InputFiled(
          controller: passwordController,
          prefixIcon: Icons.lock_outline,
          suffixIcon: Icons.remove_red_eye,
          placeholder: "Enter your password",
          color: ColorTheme.primaryColor,
          isError: false,
          suffixIconNeeded: true,
          isPassword: true,
        ),
      ),
      Container(
        alignment: Alignment.topRight,
        margin: EdgeInsets.only(right: size.width * 0.05),
        child: Text(
          "Forgot Password?",
          style: GoogleFonts.inter(
            color: ColorTheme.primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: size.height * 0.05),
        child: isLogging
            ?  CircularProgressIndicator(color: ColorTheme.primaryColor,)
            : Button(
                title: "Login",
                height: 0.07,
                width: 0.75,
                onTap: () async {
                  setState(() {
                    isLogging = true;
                  });
                  final response = await auth.signIn(
                      emailController.text, passwordController.text);
                  setState(() {
                    isLogging = false;
                  });
                  if (auth.isLoggedIn) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BottomNav()));
                  } else {
                    SnackBar snackBar = SnackBar(
                      content: Text(response),
                      backgroundColor: Colors.red,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                isElevated: true),
      ),
      Container(
        margin: EdgeInsets.only(top: size.height * 0.05),
        child: RichText(
          text: TextSpan(
            text: "Don't have an account? ",
            style: GoogleFonts.inter(
              color: ColorTheme.gray,
              fontSize: 15,
            ),
            children: [
              TextSpan(
                text: 'Sign Up',
                style: GoogleFonts.inter(
                  color: ColorTheme.primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Add your sign up logic here
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AuthPage(
                                  title: 'Sign Up',
                                )));
                  },
              ),
            ],
          ),
        ),
      )
    ]);
    ;
  }
}
