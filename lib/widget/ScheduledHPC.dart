import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/theme.dart';

class ScheduledHCP extends StatelessWidget {
  const ScheduledHCP(
      {super.key,
      required this.size,
      required this.imageUrl,
      required this.name,
      required this.date,
      required this.time,
      required this.status,
      required this.fieldType});

  final String imageUrl;
  final String name;
  final String date;
  final String time;
  final String status;
  final String fieldType;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.width * 0.02),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 1, style: BorderStyle.solid, color: ColorTheme.iconGrey)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "DR muluneh weldu",
                    style: GoogleFonts.inter(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Chardiologist",
                    style: GoogleFonts.inter(
                      color: ColorTheme.gray,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              CircleAvatar(
                radius: size.width * 0.08,
                backgroundImage: NetworkImage(
                    "https://st2.depositphotos.com/1158045/6457/i/450/depositphotos_64572953-stock-photo-smiling-doctor-at-hospital.jpg"),
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            children: [
              Icon(
                Icons.calendar_month_rounded,
                color: ColorTheme.darkGray,
              ),
              SizedBox(
                width: size.width * 0.015,
              ),
              Text(
                "02/03/16",
                style: GoogleFonts.inter(
                  color: ColorTheme.darkGray,
                ),
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              Icon(
                Icons.schedule,
                color: ColorTheme.darkGray,
              ),
              SizedBox(
                width: size.width * 0.015,
              ),
              Text(
                "2:00 PM",
                style: GoogleFonts.inter(
                  color: ColorTheme.darkGray,
                ),
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              CircleAvatar(
                radius: size.width * 0.008,
                backgroundColor: Colors.green,
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Text(
                "Confirmed",
                style: GoogleFonts.inter(
                  color: ColorTheme.darkGray,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * 0.4,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorTheme.highLight,
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      "Cancle",
                      style: GoogleFonts.inter(
                          color: ColorTheme.darkGray,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: size.width * 0.4,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorTheme.primaryColor,
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {},
                    child: Text(
                      "Reschedule",
                      style: GoogleFonts.inter(
                          color: ColorTheme.white, fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
