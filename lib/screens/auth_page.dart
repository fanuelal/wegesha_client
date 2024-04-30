import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:wegesha_client/provider/user.provider.dart';
import 'package:wegesha_client/screens/home_screen.dart';
import '../config/theme.dart';
import '../widget/Button.dart';
import '../widget/input_filed.dart';
import '../provider/auth.dart';
import 'package:provider/provider.dart';

import '../widget/signInAuth.dart';
import '../widget/signUpAuth.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController emailSignUp = TextEditingController();
  TextEditingController passwordSignUp = TextEditingController();
  // firstName, lastName, emailSignUp, passwordSignUp
  void dispose() {
    // Dispose the controllers when the widget is disposed
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isLoginTitle = widget.title.toLowerCase() == 'login';
    bool checkBoxValue = false;
    bool isLogging = false;
    final auth = Provider.of<Auth>(context, listen: false);
    final user = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: GoogleFonts.inter(
            color: ColorTheme.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [isLoginTitle ? const SignInAuth() : SignUpAuth()],
          ),
        ),
      ),
    );
  }
}
