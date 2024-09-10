// ignore_for_file: prefer_const_constructors

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wegesha_client/config/theme.dart';
import 'package:wegesha_client/model/appointment.dart';
import 'package:wegesha_client/model/hcp.dart';
import 'package:wegesha_client/provider/auth.dart';
import 'package:wegesha_client/widget/listTileWidget.dart';
import 'package:wegesha_client/widget/Button.dart';
import 'package:geolocator/geolocator.dart';

import '../provider/appointment.dart';
import '../provider/payment.dart';
import 'list_doctor.dart';

class Appointment extends StatefulWidget {
  Appointment(
      {
      required this.id,
      required this.hcp,
      required this.selectedDate,
      required this.selectedDay,
      required this.selectedTime});
  final String id;
  final HCP hcp;
  final DateTime selectedDate;
  final String selectedDay;
  final String selectedTime;
  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  bool isRedirecting = false;
  Payment payment = new Payment();

  Future<void> _launchUrl(Uri _url) async {
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url, mode: LaunchMode.inAppWebView);
    } else {
      AnimatedSnackBar snackBarEmergency = AnimatedSnackBar.material(
          "Cannot launch this URL, please try again.",
          type: AnimatedSnackBarType.error,
          mobileSnackBarPosition: MobileSnackBarPosition.top,
          desktopSnackBarPosition: DesktopSnackBarPosition.topLeft,
          snackBarStrategy: RemoveSnackBarStrategy(),
          animationCurve: Easing.standardAccelerate);

      snackBarEmergency.show(context);
    }
  }

  Future<Position?> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return null;
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final auth = Provider.of<Auth>(context);
    final userProfile = auth.userProfile;
    final appointmentProvider = Provider.of<AppointmentService>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          " Appointment",
          style: GoogleFonts.inter(
            color: ColorTheme.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios))),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTileWidget(
                size: size,
                name: 'Dr. ${widget.hcp.firstname} ${widget.hcp.lastName}',
                distance: "100KM",
                filedStudy: widget.hcp.specialty,
                rate: 4,
                hcp: widget.hcp,
                imageUrl: widget.hcp.profilePicture,
              ),
              Container(
                margin: EdgeInsets.only(
                    top: size.height * 0.03, left: size.width * 0.04),
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Date ",
                          style: GoogleFonts.inter(
                            color: ColorTheme.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Spacer(),
                        Text(
                          "Change",
                          style: GoogleFonts.inter(
                            color: ColorTheme.gray,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: ColorTheme.highLight,
                          child: const Icon(
                            Icons.calendar_month,
                            color: Color.fromARGB(255, 17, 122, 112),
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "${widget.selectedDay}, Jul ${widget.selectedDate}, 2024 | ${widget.selectedTime}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: size.width * 0.045,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Divider(
                  color: Colors.grey[200],
                  thickness: 2.0,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: size.height * 0.03, left: size.width * 0.04),
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Reason ",
                          style: GoogleFonts.inter(
                            color: ColorTheme.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Spacer(),
                        Text(
                          "Change",
                          style: GoogleFonts.inter(
                            color: ColorTheme.gray,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: ColorTheme.highLight,
                          child: const Icon(
                            Icons.edit_square,
                            color: Color.fromARGB(255, 17, 122, 112),
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Some Note",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Divider(
                  color: Colors.grey[200],
                  thickness: 2.0,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: size.height * 0.03, left: size.width * 0.04),
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Payment Detail ",
                          style: GoogleFonts.inter(
                            color: ColorTheme.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Consultation ",
                          style: GoogleFonts.inter(
                            color: ColorTheme.gray,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "250.00 ETB",
                          style: GoogleFonts.inter(
                            color: ColorTheme.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Admin Fee ",
                          style: GoogleFonts.inter(
                            color: ColorTheme.gray,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "150.00 ETB",
                          style: GoogleFonts.inter(
                            color: ColorTheme.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Additional Discount ",
                          style: GoogleFonts.inter(
                            color: ColorTheme.gray,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "-",
                          style: GoogleFonts.inter(
                            color: ColorTheme.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Total ",
                          style: GoogleFonts.inter(
                            color: ColorTheme.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "250.00 ETB",
                          style: GoogleFonts.inter(
                            color: const Color.fromARGB(255, 17, 122, 112),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Divider(
                  color: Colors.grey[200],
                  thickness: 2.0,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: size.height * 0.03, left: size.width * 0.04),
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Payment Method",
                          style: GoogleFonts.inter(
                            color: ColorTheme.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: 600,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffE5E7EB)),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(11.13),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Image.network(
                                  "https://banksethiopia.com/wp-content/uploads/chapa-1.png")),
                          Padding(
                            padding: EdgeInsets.only(right: 30.0),
                            child: Text(
                              "change",
                              style: GoogleFonts.inter(
                                color: ColorTheme.gray,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Total ",
                          style: GoogleFonts.inter(
                            color: ColorTheme.gray,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          "250.00 ETB",
                          style: GoogleFonts.inter(
                            color: ColorTheme.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.02),
                    padding: EdgeInsets.only(right: 25.0),
                    child: isRedirecting
                        ? Padding(
                            padding: EdgeInsets.only(right: size.width * 0.2),
                            child: CircularProgressIndicator(
                                color: ColorTheme.primaryColor),
                          )
                        : Button(
                            title: "Booking",
                            height: 0.05,
                            width: 0.4,
                            onTap: () async {
                              setState(() {
                                isRedirecting = true;
                              });

                              Position? position = await _determinePosition();
                              if (position == null) {
                                setState(() {
                                  isRedirecting = false;
                                });
                                AnimatedSnackBar snackBar =
                                    AnimatedSnackBar.material(
                                  "Location permission denied or location services are disabled.",
                                  type: AnimatedSnackBarType.error,
                                  mobileSnackBarPosition:
                                      MobileSnackBarPosition.top,
                                  desktopSnackBarPosition:
                                      DesktopSnackBarPosition.topLeft,
                                  snackBarStrategy: RemoveSnackBarStrategy(),
                                  animationCurve: Easing.standardAccelerate,
                                );
                                snackBar.show(context);
                                return;
                              }
                              String latLong = "${position.latitude},${position.longitude}";
                              AppointmentModel appointment = AppointmentModel(imageUrl: widget.hcp.profilePicture, name: '${widget.hcp.firstname} ${widget.hcp.lastName}', date: widget.selectedDate, time: widget.selectedTime, status: 'pending', location: latLong, fieldType: 'no Note', doctorId: widget.id, patientId: auth.userProfile.id);
                              // Create appointment
                            await appointmentProvider.createAppointment(appointment, auth.accessToken);

                              String paymentLink =
                                  await payment.paymentChapa(auth.userProfile);
                              setState(() {
                                isRedirecting = false;
                              });
                              print(paymentLink);
                              Uri _url = Uri.parse(paymentLink);
                              await _launchUrl(_url);
                            },
                            isElevated: true),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
