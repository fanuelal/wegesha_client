import 'package:flutter/material.dart';
import '../config/theme.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  final double height;
  final double width;
  final Function()? onTap;
  late bool isElevated = false;
  Button(
      {super.key,
      required this.height,
      required this.width,
      required this.onTap,
      this.isElevated = true});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * height,
      width: size.width * width,
      child: ElevatedButton(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all<TextStyle>(
                  GoogleFonts.inter(fontSize: 16)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      side: BorderSide(color: ColorTheme.primaryColor),
                      borderRadius: BorderRadius.circular(32))),
              foregroundColor:
                  MaterialStateProperty.all<Color>(isElevated? ColorTheme.white : ColorTheme.primaryColor),
              
              backgroundColor:
                  isElevated ? MaterialStateProperty.all<Color>(ColorTheme.primaryColor) : MaterialStateProperty.all<Color>(ColorTheme.white)),
          onPressed: onTap,
          child: const Text('Login')),
    );
  }
}
