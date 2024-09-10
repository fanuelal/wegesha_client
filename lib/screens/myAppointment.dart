import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wegesha_client/config/theme.dart';
import 'package:wegesha_client/provider/appointment.dart';
import '../provider/auth.dart';
import '../widget/ScheduledHPC.dart';

class MyAppointment extends StatefulWidget {
  const MyAppointment({super.key});

  @override
  State<MyAppointment> createState() => _MyAppointmentState();
}

class _MyAppointmentState extends State<MyAppointment> {
  @override
    void didChangeDependencies() {
    super.didChangeDependencies();
    fetch(); // Call fetch here to ensure context is available
  }

  Future<void> fetch() async {
    final apptProvider = Provider.of<AppointmentService>(context, listen: false);
    final auth = Provider.of<Auth>(context);
    await apptProvider.fetchAppointmentsByPatient(
        auth.userProfile.id, auth.accessToken);
    // Call setState to update UI after fetching data
    setState(() {});
  }

LatLng getLatLng(String _location) {
    final coordinates = _location.split(',');
    final lat = double.parse(coordinates[0]);
    final lng = double.parse(coordinates[1]);
    return LatLng(lat, lng);

}
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final apptProvider = Provider.of<AppointmentService>(context);
    final appointments = apptProvider.appointments;
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
                      "My Appointments",
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
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  final appointment = appointments[index];
                  return ScheduledHCP(
                    size: size,
                    id: appointment.id,
                    imageUrl: appointment.imageUrl,
                    name: appointment.name,
                    date: appointment.date.toIso8601String(),
                    time: appointment.time,
                    status: appointment.status,
                    fieldType: appointment.fieldType,
                    location: getLatLng(appointment.location),
                  );
                },
              ),
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
