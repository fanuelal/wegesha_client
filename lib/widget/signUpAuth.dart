import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wegesha_client/provider/user.provider.dart';
import '../config/theme.dart';
import '../screens/auth_page.dart';
import '../widget/Button.dart';
import '../widget/input_filed.dart';

class SignUpAuth extends StatefulWidget {
  @override
  State<SignUpAuth> createState() => _SignUpAuthState();
}

class _SignUpAuthState extends State<SignUpAuth> {
  TextEditingController passwordSignUp = TextEditingController();
  TextEditingController emailSignUp = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  DateTime? pickedDate;
  bool isProcessing = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = Provider.of<UserProvider>(context);
    bool checkBoxValue = false;
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
            controller: emailSignUp,
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
            controller: passwordSignUp,
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
            },
          ),
        ),
        // Text(),
        Container(
          margin: EdgeInsets.only(top: size.height * 0.02),
          child: Row(
            children: [
              Checkbox(
                value: checkBoxValue,
                onChanged: (bool? value) {
                  setState(() {
                    checkBoxValue = value ?? false;
                  });
                },
                activeColor: Colors.orange,
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
        isProcessing
            ? CircularProgressIndicator(
                color: ColorTheme.primaryColor,
              )
            : Container(
                margin: EdgeInsets.only(top: size.height * 0.05),
                child: Button(
                    title: "Sign Up",
                    height: 0.07,
                    width: 0.75,
                    onTap: () async {
                      if (firstName.text != null ||
                          lastName.text != null ||
                          emailSignUp != null ||
                          passwordSignUp != null ||
                          pickedDate != null) {
                        Map<String, dynamic> jsonCreate = {
                          "firstName": firstName.text,
                          "lastName": lastName.text,
                          "email": emailSignUp.text,
                          "password": passwordSignUp.text,
                          "dateOfBirth": pickedDate!.toIso8601String()
                        };
                        setState(() {
                          isProcessing = true;
                        });
                        String response = await user.createUser(jsonCreate);
                        setState(() {
                          isProcessing = false;
                        });
                        Color snackBarColor = ColorTheme.red;
                        if (response == 'user successfully created') {
                          snackBarColor = Colors.green;
                        }
                        SnackBar snackBar = SnackBar(content: Text(response));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AuthPage(
                                      title: 'Login',
                                    )));
                      } else {
                        SnackBar snackBar = SnackBar(
                          content: Text("All fileds Required"),
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
}
