import 'package:flutter/material.dart';
import '../config/theme.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Button extends StatefulWidget {
  final double height;
  final double width;
  final Function() onTap;
  final String title;
  late bool isElevated = false;
  Button(
      {super.key,
      required this.title,
      required this.height,
      required this.width,
      required this.onTap,
      this.isElevated = true});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isProcessing = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * widget.height,
      width: size.width * widget.width,
      child: ElevatedButton(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all<TextStyle>(
                  GoogleFonts.inter(fontSize: 16)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      side: BorderSide(color: ColorTheme.primaryColor),
                      borderRadius: BorderRadius.circular(32))),
              foregroundColor: MaterialStateProperty.all<Color>(
                  widget.isElevated
                      ? ColorTheme.white
                      : ColorTheme.primaryColor),
              backgroundColor: widget.isElevated
                  ? MaterialStateProperty.all<Color>(ColorTheme.primaryColor)
                  : MaterialStateProperty.all<Color>(ColorTheme.white)),
          onPressed: () async {
            setState(() {
              isProcessing = true;
            });
            widget.onTap();
            setState(() {
              isProcessing = false;
            });
          },
          child: isProcessing
              ? const CircularProgressIndicator()
              : Text(
                  widget.title,
                  style: const TextStyle(fontWeight: FontWeight.w400),
                )),
    );
  }
}
