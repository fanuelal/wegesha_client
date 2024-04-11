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

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
    final user = Provider.of(context, listen: false);
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              isLoginTitle
                  ? SignInAuth(size, emailController, passwordController,
                      context, isLogging, auth)
                  : SignUpAuth(size, passwordController, checkBoxValue, user)
            ],
          ),
        ),
      ),
    );
  }

  Widget SignUpAuth(Size size, TextEditingController passwordController,
      checkBoxValue, UserProvider user) {
    DateTime dob;
    var pickedDate;
    TextEditingController firstName = TextEditingController();
    TextEditingController lastName = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Column(
      children: [
        Container(
          //  margin: const EdgeInsets.symmetric(vertical:100, horizontal: 10),
          margin: EdgeInsets.only(
              top: size.height * 0.02,
              right: size.width * 0.03,
              left: size.width * 0.03),

          child: InputFiled(
            controller: firstName,
            prefixIcon: Icons.person_3_outlined,
            placeholder: "First Name",
            color: ColorTheme.primaryColor,
            isError: false,
          ),
        ),
        Container(
          //  margin: const EdgeInsets.symmetric(vertical:100, horizontal: 10),
          margin: EdgeInsets.only(
              top: size.height * 0.02,
              right: size.width * 0.03,
              left: size.width * 0.03),

          child: InputFiled(
            controller: lastName,
            prefixIcon: Icons.person_3_outlined,
            placeholder: "Last Name",
            color: ColorTheme.primaryColor,
            isError: false,
          ),
        ),
        Container(
          //  margin: const EdgeInsets.symmetric(vertical:100, horizontal: 10),
          margin: EdgeInsets.only(
              top: size.height * 0.02,
              right: size.width * 0.03,
              left: size.width * 0.03),

          child: InputFiled(
            controller: email,
            prefixIcon: Icons.email_outlined,
            placeholder: "Email",
            color: ColorTheme.primaryColor,
            isError: false,
          ),
        ),
        Container(
          //  margin: const EdgeInsets.symmetric(vertical:100, horizontal: 10),
          margin: EdgeInsets.only(
              top: size.height * 0.02,
              right: size.width * 0.03,
              left: size.width * 0.03),

          child: InputFiled(
            controller: password,
            prefixIcon: Icons.lock_outline,
            suffixIcon: Icons.remove_red_eye_sharp,
            placeholder: "Password",
            color: ColorTheme.primaryColor,
            isError: false,
            suffixIconNeeded: true,
            isPassword: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton.icon(
            icon: const Icon(Icons.calendar_view_day_rounded),
            label: Text('Date of Birth'),
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(
                  Size(size.width * 0.9, size.height * 0.065)),
              textStyle: MaterialStateProperty.all<TextStyle>(
                  GoogleFonts.inter(fontSize: 16)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      side: BorderSide(color: ColorTheme.primaryColor),
                      borderRadius: BorderRadius.circular(32))),
              foregroundColor:
                  MaterialStateProperty.all<Color>(ColorTheme.primaryColor),
              // backgroundColor:
              //     MaterialStateProperty.all<Color>(ColorTheme.primaryColor)
            ),
            onPressed: () async {
              pickedDate = await showDatePickerDialog(
                splashColor: ColorTheme.primaryColor,
                leadingDateTextStyle: TextStyle(color: ColorTheme.primaryColor),
                slidersColor: ColorTheme.primaryColor,
                currentDateTextStyle: TextStyle(
                    color: ColorTheme.primaryColor,
                    fontWeight: FontWeight.bold),
                currentDateDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: ColorTheme.primaryColor)),
                highlightColor: ColorTheme.primaryColor,
                context: context,
                minDate: DateTime(1900, 1, 1),
                maxDate: DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day),
              );
              Map<String, dynamic> jsonCreate = {
                "firstName": firstName,
                "lastName": lastName,
                "email": email,
                "password": password,
                "datePicked": pickedDate
              };
              String response = await user.createUser(jsonCreate);
              SnackBar snackBar = SnackBar(content: Text(response));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ),
        // Text(),
        Container(
          margin: EdgeInsets.only(top: size.height * 0.02),
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
              RichText(
                text: TextSpan(
                  text: "I agree to the wegesha client ",
                  style: GoogleFonts.inter(
                    color: ColorTheme.gray,
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(
                      text: '\n Terms of Service',
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

  Column SignInAuth(
      Size size,
      TextEditingController emailController,
      TextEditingController passwordController,
      BuildContext context,
      bool isLogging,
      Auth authProvider) {
    Auth auth = Auth();
    // var result = false;
    // Future<void> SignIN() async {
    //   // setState(() async {
    //   result = await auth.signIn(emailController.text, passwordController.text);
    //   // });
    // }

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
            ? const CircularProgressIndicator()
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
                        MaterialPageRoute(builder: (context) => HomeScreen()));
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
  }
}
