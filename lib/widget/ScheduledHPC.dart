import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../config/theme.dart';
import '../screens/mapScreen.dart';

class ScheduledHCP extends StatelessWidget {
  ScheduledHCP(
      {super.key,
      required this.id,
      required this.size,
      this.imageUrl = 'https://img.lovepik.com/photo/40013/3144.jpg_wh860.jpg',
      required this.name,
      required this.date,
      required this.time,
      required this.status,
      required this.fieldType,
      required this.location});
  final String id;
  String imageUrl;
  final String name;
  final String date;
  final String time;
  final String status;
  final String fieldType;
  final Size size;
  final LatLng location;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MapScreen(
                  id: id,
                )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.width * 0.02),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 1,
                style: BorderStyle.solid,
                color: ColorTheme.iconGrey)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.inter(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      fieldType,
                      style: GoogleFonts.inter(
                        color: ColorTheme.gray,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                CircleAvatar(
                  radius: size.width * 0.08,
                  backgroundImage: NetworkImage(imageUrl),
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
                  date.split(':')[0],
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
                  "2:00",
                  style: GoogleFonts.inter(
                    color: ColorTheme.darkGray,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                CircleAvatar(
                  radius: size.width * 0.008,
                  backgroundColor: status == 'cancled'
                      ? Colors.red
                      : status == 'pending'
                          ? Colors.amber
                          : Colors.green,
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                Text(
                  status,
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
                            color: ColorTheme.white,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
