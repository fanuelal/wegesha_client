import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wegesha_client/config/theme.dart';
import '../widget/ScheduledHPC.dart';

class MyAppointment extends StatefulWidget {
  const MyAppointment({super.key});

  @override
  State<MyAppointment> createState() => _MyAppointmentState();
}

class _MyAppointmentState extends State<MyAppointment> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Schedule",
                      style: GoogleFonts.inter(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: size.width * 0.4,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notifications_none_rounded))
                  ],
                ),
              ),
              CustomeTopMenu(),
              SizedBox(
                height: size.height * 0.04,
              ),
              ScheduledHCP(
                  size: size,
                  imageUrl:
                      "https://st2.depositphotos.com/1158045/6457/i/450/depositphotos_64572953-stock-photo-smiling-doctor-at-hospital.jpg",
                  name: "Dr. Henery Talu",
                  date: "02/03/24",
                  time: "2:00 PM",
                  status: "Confirmed",
                  fieldType: "Chardiologyst"),
              ScheduledHCP(
                  size: size,
                  imageUrl:
                      "https://media.istockphoto.com/id/1203995945/photo/portrait-of-mature-male-doctor-wearing-white-coat-standing-in-hospital-corridor.jpg?s=612x612&w=0&k=20&c=Hk-dqLqHXyYa4aTqjieXNk9-HQSE8WEYUAjA1sXsy_s=",
                  name: "Dr. Amanuel Tadese",
                  date: "03/07/24",
                  time: "8:00 PM",
                  status: "cancled",
                  fieldType: "Chardiologyst"),
              ScheduledHCP(
                  size: size,
                  imageUrl:
                      "https://thumbs.dreamstime.com/b/portrait-positive-black-doctor-holding-medical-chart-male-over-white-background-178499631.jpg",
                  name: "Dr. Aklilu Talu",
                  date: "02/03/24",
                  time: "2:00 PM",
                  status: "Upcomming",
                  fieldType: "Chardiologyst")
            ]),
          ),
        ),
      ),
    );
  }
}

class CustomeTopMenu extends StatefulWidget {
  const CustomeTopMenu({super.key});

  @override
  State<CustomeTopMenu> createState() => _CustomeTopMenuState();
}

class _CustomeTopMenuState extends State<CustomeTopMenu> {
  int activeFilter = 0;
  void menuNavigator(int currentIndex) {
    setState(() {
      activeFilter = currentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.06,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorTheme.highLight,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              menuNavigator(0);
            },
            child: Container(
              height: size.height * 0.06,
              width: size.width * 0.3,
              padding: EdgeInsets.only(
                  left: size.width * 0.04, top: size.height * 0.015),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: activeFilter == 0
                    ? ColorTheme.primaryColor
                    : ColorTheme.highLight,
              ),
              child: Text(
                'Upcoming',
                style: GoogleFonts.inter(
                    fontSize: 18,
                    color: activeFilter == 0
                        ? ColorTheme.white
                        : ColorTheme.black),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              menuNavigator(1);
            },
            child: Container(
              height: size.height * 0.06,
              width: size.width * 0.3,
              padding: EdgeInsets.only(
                  left: size.width * 0.04, top: size.height * 0.015),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: activeFilter == 1
                    ? ColorTheme.primaryColor
                    : ColorTheme.highLight,
              ),
              child: Text('Completed',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      color: activeFilter == 1
                          ? ColorTheme.white
                          : ColorTheme.black)),
            ),
          ),
          InkWell(
            onTap: () {
              menuNavigator(2);
            },
            child: Container(
              height: size.height * 0.06,
              width: size.width * 0.3,
              padding: EdgeInsets.only(
                  left: size.width * 0.06, top: size.height * 0.015),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: activeFilter == 2
                    ? ColorTheme.primaryColor
                    : ColorTheme.highLight,
              ),
              child: Text('Cancled',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      color: activeFilter == 2
                          ? ColorTheme.white
                          : ColorTheme.black)),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
