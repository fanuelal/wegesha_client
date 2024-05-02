import 'package:flutter/material.dart';
import 'package:wegesha_client/config/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class DateOfMonth extends StatefulWidget {
  final String date;
  final String day;
  final Function(String, String) onSelected;
  const DateOfMonth(
      {Key? key,
      required this.date,
      required this.day,
      required this.onSelected})
      : super(key: key);

  @override
  State<DateOfMonth> createState() => _DateOfMonthState();
}

class _DateOfMonthState extends State<DateOfMonth> {
  Color containerColor = Colors.transparent;
  Color textColor = ColorTheme.black;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        setState(() {
          containerColor = (containerColor == ColorTheme.primaryColor)
              ? Colors.transparent
              : ColorTheme.primaryColor; // Toggle the color on tap
          textColor = (containerColor == ColorTheme.primaryColor)
              ? Colors.white
              : ColorTheme.black;
        });
        widget.onSelected(widget.date, widget.day);
      },
      highlightColor:
          const Color.fromRGBO(0, 0, 0, 0), // Remove default highlight color
      splashColor: Colors.transparent,
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.13,
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
          top: size.height * 0.03,
          left: size.width * 0.04,
          bottom: size.height * 0.03,
        ),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "${widget.day} \n",
            style: GoogleFonts.inter(
              color: ColorTheme.iconGrey,
              fontSize: 10,
            ),
            children: [
              TextSpan(
                text: widget.date,
                style: GoogleFonts.inter(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
