import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:wegesha_client/images';
class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 3,
        itemBuilder: (_, i) {
          return Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                Container(
                  height: 20,
                  width: 29,
                  margin: const EdgeInsets.only(top: 0, left: 254),
                  child: const Text(
                    "skip",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        // lineHeight: 20,
                        letterSpacing: 0,
                        // textAlign: TextAlign.center,
                        color: Color(0xFFA1A8B0)),
                  ),
                ),
                Container(
                  color: Color.fromARGB(255, 43, 92, 147),
                  width: 311,
                  height: 468,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    "images/hand-drawn-iranian-women.avif",
                    height: 300,
                  ),
                ),
                Container(
                  height: 80,
                  width: 280,
                  alignment: Alignment.topLeft,

                  child: const Text(
                    "Consult only with a doctor you trust",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        // lineHeight: 20,
                        letterSpacing: 0,
                        // textAlign: TextAlign.center,
                        color: Color(0xFF101623)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
