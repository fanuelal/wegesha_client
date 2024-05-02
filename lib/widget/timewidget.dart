import 'package:flutter/material.dart';
import 'package:wegesha_client/config/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Time extends StatefulWidget {
  final String time;
  final Function(String) onSelected;
  const Time({Key? key, required this.time, required this.onSelected})
      : super(key: key);

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  Color containerColor = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        setState(() {
          containerColor = (containerColor == ColorTheme.primaryColor)
              ? Colors.transparent
              : ColorTheme.primaryColor; // Toggle the color on tap
        });
        widget.onSelected(widget.time);
      },
      highlightColor: Colors.transparent, // Remove default highlight color
      splashColor: Colors.transparent,
      child: Container(
        height: size.height * 0.05,
        width: size.width * 0.25,
        padding: EdgeInsets.only(
          top: size.height * 0.015,
          bottom: size.height * 0.015,
        ),
        decoration: BoxDecoration(
          color: containerColor, // Apply the color to the container
          border: Border.all(color: ColorTheme.gray),
          borderRadius: BorderRadius.circular(17),
        ),
        margin: EdgeInsets.only(
          top: size.height * 0.02,
          left: size.width * 0.04,
          right: size.width * 0.04,
          bottom: size.height * 0.03,
        ),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "${widget.time} \n",
            style: GoogleFonts.inter(
              color: ColorTheme.iconGrey,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
