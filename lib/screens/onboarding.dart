import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter/widgets.dart';
// import 'package:wegesha_client/screens/data/bording_model.dart';
// import 'package:wegesha_client/config/theme.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:wegesha_client/config/theme.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// // import 'package:wegesha_client/images';
// class Onboarding extends StatefulWidget {
//   final _controller = PageController();
//   @override
//   _OnboardingState createState() => _OnboardingState();
// }

// class _OnboardingState extends State<Onboarding> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: PageView.builder(
//               itemCount: contents.length,
//               itemBuilder: (_, i) {
//                 return Padding(
//                   padding: const EdgeInsets.only(top: 30),
//                   child: Column(
//                     children: [
//                       Container(
//                         height: 20,
//                         width: 29,
//                         margin: const EdgeInsets.only(top: 0, left: 254),
//                         child: const Text(
//                           "skip",
//                           style: TextStyle(
//                               fontFamily: "Inter",
//                               fontSize: 14,
//                               fontWeight: FontWeight.w400,
//                               // lineHeight: 20,
//                               letterSpacing: 0,
//                               // textAlign: TextAlign.center,
//                               color: Color(0xFFA1A8B0)),
//                         ),
//                       ),
//                       Container(
//                         color: Color.fromARGB(255, 43, 92, 147),
//                         width: 311,
//                         height: 468,
//                         alignment: Alignment.center,
//                         margin: const EdgeInsets.only(top: 20),
//                         child: Image.asset(
//                           contents[i].image,
//                           height: 300,
//                         ),
//                       ),
//                       Container(
//                         height: 80,
//                         width: 280,
//                         alignment: Alignment.topLeft,
//                         child: Text(
//                           contents[i].description,
//                           style: const TextStyle(
//                               fontFamily: "Inter",
//                               fontSize: 22,
//                               fontWeight: FontWeight.w700,
//                               // lineHeight: 20,
//                               letterSpacing: 0,
//                               // textAlign: TextAlign.center,
//                               color: Color(0xFF101623)),
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                             height: 60,
//                             width: 60,
//                             margin: const EdgeInsets.only(top: 50),
//                             child: TextButton(
//                               // child: Text("next"),
//                               child: Icon(
//                                 Icons.arrow_forward,
//                                 size: 30,
//                               ),
//                               onPressed: () {},
//                               style: TextButton.styleFrom(
//                                 backgroundColor: ColorTheme.primaryColor,
//                                 foregroundColor: Colors.white,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(50),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             height: 60,
//                             width: 60,
//                             margin: const EdgeInsets.only(top: 50),
//                             child: TextButton(
//                               // child: Text("next"),
//                               child: Icon(
//                                 Icons.arrow_forward,
//                                 size: 30,
//                               ),
//                               onPressed: () {},
//                               style: TextButton.styleFrom(
//                                 backgroundColor: ColorTheme.primaryColor,
//                                 foregroundColor: Colors.white,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(50),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controllerColor = ColorTheme.primaryColor;
    return CupertinoApp(
      home: OnBoardingSlider(
        headerBackgroundColor: ColorTheme.white,
        pageBackgroundColor: ColorTheme.white,
        finishButtonText: 'Register',
        finishButtonStyle: FinishButtonStyle(
        backgroundColor: ColorTheme.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
        ),
         controllerColor: controllerColor,
         centerBackground: true,
        skipTextButton: const Text('Skip'),
        trailing: const Text('Login'),
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
            height: size.height * 0.7,
          )
        ],
        totalPage: 3,
        speed: 1.8,
        pageBodies: [
          Container(
            height: size.height,
            width: size.width,
            padding:  EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.6,
                ),
                Text(
                  'Consult only with a doctor you trust',
                  style:  TextStyle(
                      fontFamily: "Inter",
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      // lineHeight: 20,
                      letterSpacing: 0,
                      // textAlign: TextAlign.center,
                      color: Color(0xFF101623)),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text(
                  'Find a lot of specialist doctors in one place',
                  style:  TextStyle(
                      fontFamily: "Inter",
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      // lineHeight: 20,
                      letterSpacing: 0,
                      // textAlign: TextAlign.center,
                      color: Color(0xFF101623)),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text(
                  'Get connect our Online Consultation',
                  style:  TextStyle(
                      fontFamily: "Inter",
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      // lineHeight: 20,
                      letterSpacing: 0,
                      // textAlign: TextAlign.center,
                      color: Color(0xFF101623)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
