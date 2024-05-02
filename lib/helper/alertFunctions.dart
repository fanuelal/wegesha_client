import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

void errorAllertCaller(
    {required String content,
    int sec = 60,
    required BuildContext context}) async {
  AnimatedSnackBar snackBarEmergency = AnimatedSnackBar.material(content,
      type: AnimatedSnackBarType.error,
      mobileSnackBarPosition: MobileSnackBarPosition.top,
      desktopSnackBarPosition: DesktopSnackBarPosition.topLeft,
      snackBarStrategy: RemoveSnackBarStrategy(),
      animationCurve: Easing.standardAccelerate);
  print(content);
  print(sec.toString());
  snackBarEmergency.show(context);
  Future.delayed(Duration(seconds: sec), () {
    snackBarEmergency.remove();
  });
}

void successAllertCaller({required String content, int sec = 30}) async {
  print(content);
  AnimatedSnackBar snackBarEmergency = AnimatedSnackBar.material(content,
      type: AnimatedSnackBarType.success,
      mobileSnackBarPosition: MobileSnackBarPosition.top,
      desktopSnackBarPosition: DesktopSnackBarPosition.topLeft,
      snackBarStrategy: RemoveSnackBarStrategy(),
      animationCurve: Easing.standardAccelerate);

  Future.delayed(const Duration(seconds: 60), () {
    snackBarEmergency.remove();
  });
}
