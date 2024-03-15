import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wegesha_client/config/theme.dart';
import '../screens/auth_type.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controllerColor = ColorTheme.primaryColor;
    return Scaffold(
      body: OnBoardingSlider(
        headerBackgroundColor: ColorTheme.white,
        pageBackgroundColor: ColorTheme.white,
        finishButtonText: 'Get Started',
        onFinish: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const AuthType()),
          );
        },
        finishButtonStyle: FinishButtonStyle(
            backgroundColor: ColorTheme.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        controllerColor: controllerColor,
        centerBackground: true,
        skipTextButton: const Text('Skip'),
        // trailing: const Text('Login'),
        background: [
          Image.asset(
            'assets/doctor_image1.jpg',
            fit: BoxFit.fill,
            width: size.width, height: size.height * 0.5,
            // color: ColorTheme.white,
          ),
          Image.asset(
            'assets/doctor_image2.jpg',
            fit: BoxFit.fill,
            width: size.width,
            height: size.height * 0.6,
          ),
          Image.asset(
            'assets/doctor_image3.jpg',
            fit: BoxFit.fill,
            width: size.width,
            height: size.height * 0.5,
          )
        ],
        totalPage: 3,
        speed: 1.8,
        pageBodies: [
          Container(
            height: size.height,
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.6,
                ),
                Text(
                  'Consult only with a doctor you trust',
                  style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0,
                      color: ColorTheme.black),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 480,
                ),
                Text(
                  'Find a lot of specialist doctors in one place',
                  style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0,
                      color: ColorTheme.black),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 480,
                ),
                Text(
                  'Get connect our Online Consultation',
                  style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0,
                      color: ColorTheme.black),
                ),
              ],
            ),
          ),
          // const AuthType()
        ],
      ),
    );
  }
}
