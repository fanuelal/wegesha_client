// import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wegesha_client/config/theme.dart';
import 'package:wegesha_client/screens/appointment.dart';
import 'package:wegesha_client/widget/Button.dart';
import 'package:wegesha_client/widget/datewidget.dart';
import 'package:intl/intl.dart';
import 'package:wegesha_client/widget/timewidget.dart';

import '../widget/listTileWidget.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  List<String> timeList = [];
  List<String> generateTimeList() {
    DateTime currentTime = DateTime.now().add(const Duration(hours: 1));

    for (int i = 0; i < 9; i++) {
      String time = DateFormat('hh:00 a').format(currentTime);
      timeList.add(time);
      currentTime = currentTime.add(const Duration(hours: 1));
    }

    return timeList;
  }

  Widget getTimeWidget() {
    int i = 0;
    List<Widget> listTime = [];
    generateTimeList();
    while (timeList.length > i) {
      print(i);
      listTime.add(Time(time: timeList[i]));
      i += 1;
    }
    return Wrap(children: listTime);
  }

  List<Map<String, dynamic>> getDatesAndDaysUntilEndOfMonth() {
    final now = DateTime.now();
    final endOfMonth = DateTime(now.year, now.month + 1, 0);
    final dateFormat = DateFormat('yyyy-MM-dd');
    final dayFormat = DateFormat('EEEE');

    final List<Map<String, dynamic>> datesAndDays = [];

    for (DateTime date = now;
        date.isBefore(endOfMonth);
        date = date.add(const Duration(days: 1))) {
      final dateString = dateFormat.format(date);
      final dayString = dayFormat.format(date);

      final dateAndDay = {
        'date': dateString,
        'day': dayString,
      };

      datesAndDays.add(dateAndDay);
    }

    return datesAndDays;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Doctor Detail",
            style: GoogleFonts.inter(
              color: ColorTheme.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: ColorTheme.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert, color: ColorTheme.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(children: [
            ListTileWidget(
              size: size,
              name: "Dr Helen Abebe",
              distance: "100KM",
              filedStudy: "doctor",
              rate: 4,
              imageUrl:
                  "https://i.pinimg.com/originals/7c/23/13/7c2313f8d49ff41e48982af55d5938f9.png",
            ),
            Container(
                margin: EdgeInsets.only(
                    top: size.height * 0.03, left: size.width * 0.04),
                alignment: Alignment.topLeft,
                child: Text(
                  "About",
                  style: GoogleFonts.inter(
                    color: ColorTheme.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Container(
                margin: EdgeInsets.only(
                    top: size.height * 0.03, left: size.width * 0.04),
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam... ",
                      style: GoogleFonts.inter(
                        color: ColorTheme.gray,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: 'Read more',
                          style: GoogleFonts.inter(
                            color: ColorTheme.primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        )
                      ]),
                )),
            Container(
              height: size.height * 0.15,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: getDatesAndDaysUntilEndOfMonth().length,
                itemBuilder: (ctx, index) {
                  final itemsList = getDatesAndDaysUntilEndOfMonth();
                  final slicedDate = itemsList[index]['date'].split("-")[2];
                  final slicedDay = itemsList[index]['day'].substring(0, 3);

                  return DateOfMonth(date: slicedDate, day: slicedDay);
                },
              ),
            ),
            getTimeWidget(),
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.02, bottom: size.height * 0.02),
              child: Button(
                  title: "Book Apointment",
                  height: 0.07,
                  width: 0.75,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Appointment()));
                  },
                  isElevated: true),
            ),
          ]),
        )));
  }
}
