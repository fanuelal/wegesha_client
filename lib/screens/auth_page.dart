import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wegesha_client/config/theme.dart';
import 'package:wegesha_client/widget/Button.dart';
import 'package:wegesha_client/widget/input_filed.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    bool isLoginTitle = widget.title.toLowerCase() == 'login';
    bool checkBoxValue = false;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(
            color: ColorTheme.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: ColorTheme.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            isLoginTitle
                ? SignInAuth(size, emailController, passwordController, context)
                : SignUpAuth(size, passwordController, checkBoxValue)
          ],
        ),
      ),
    );
  }

  Column SignUpAuth(
      Size size, TextEditingController passwordController, checkBoxValue) {
    return Column(
      children: [
        Container(
          //  margin: const EdgeInsets.symmetric(vertical:100, horizontal: 10),
          margin: EdgeInsets.only(
              top: size.height * 0.05,
              right: size.width * 0.03,
              left: size.width * 0.03),

          child: InputFiled(
            controller: passwordController,
            prefixIcon: Icons.person_3_outlined,
            suffixIcon: Icons.remove_red_eye,
            placeholder: "Enter your name",
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
            prefixIcon: Icons.email_outlined,
            suffixIcon: Icons.remove_red_eye,
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
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: size.height * 0.05),
          child: Row(
            children: [
              Checkbox(
                checkColor: Colors.green,
                value: checkBoxValue,
                onChanged: (bool? value) {
                  setState(() {
                    checkBoxValue = !checkBoxValue;
                    // print(!checkBoxValue);
                  });
                },
              ), //
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: "I agree to the wegesha client ",
                    style: GoogleFonts.inter(
                      color: ColorTheme.gray,
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text: 'Terms of Service',
                        style: GoogleFonts.inter(
                          color: ColorTheme.primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      TextSpan(
                        text: ' and ',
                        style: GoogleFonts.inter(
                          color: ColorTheme.gray,
                          fontSize: 15,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: GoogleFonts.inter(
                          color: ColorTheme.primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Add your logic here
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: size.height * 0.05),
          child: Button(
              title: "Sign Up",
              height: 0.07,
              width: 0.75,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AuthPage(
                              title: 'Login',
                            )));
              },
              isElevated: true),
        ),
        Container(
        margin: EdgeInsets.only(top: size.height * 0.05),
        child: RichText(
          text: TextSpan(
            text: "Have an account? ",
            style: GoogleFonts.inter(
              color: ColorTheme.gray,
              fontSize: 15,
            ),
            children: [
              TextSpan(
                text: 'Sign in',
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
                                  title: 'Login',
                                )));
                  },
              ),
            ],
          ),
        ),
      )
      ],
    );
  }

  Column SignInAuth(Size size, TextEditingController emailController,
      TextEditingController passwordController, BuildContext context) {
    return Column(children: [
      Container(
        // margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 10),
        margin: EdgeInsets.only(
            top: size.height * 0.05,
            right: size.width * 0.03,
            left: size.width * 0.03),

        child: InputFiled(
          controller: emailController,
          prefixIcon: Icons.email_outlined,
          suffixIcon: Icons.remove_red_eye,
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
        child: Button(
            title: "Login",
            height: 0.07,
            width: 0.75,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AuthPage(
                            title: 'Login',
                          )));
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
  }
}
