import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wegesha_client/config/theme.dart';
import 'package:wegesha_client/model/emergency.dart';
import 'package:wegesha_client/provider/auth.dart';
import 'package:wegesha_client/provider/emergencyProvider.dart';
import 'package:wegesha_client/provider/hcp_provider.dart';
import 'package:wegesha_client/screens/detail.dart';
import 'package:wegesha_client/widget/input_filed.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../model/hcp.dart';
import './list_doctor.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  static String route = '/home';
  final String accessToken;
  HomeScreen({required this.accessToken});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isEmergencyMode = false;
  bool isFetching = false;
  bool emergencyBroadCasting = false;
  final TextEditingController searchController = TextEditingController();

  @override
  // void initState() {
  //   super.initState();

  // }

  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      isFetching = true;
    });
    fetchData();
    setState(() {
      isFetching = false;
    });
  }

  Future<void> fetchData() async {
    final hpc_provider = Provider.of<Hcp_Provider>(context);
    hpc_provider.getAll(widget.accessToken);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final auth = Provider.of<Auth>(context);
    final hcpProvider = Provider.of<Hcp_Provider>(context);
    final emergencyService = Provider.of<EmergencyService>(context);
    List<HCP> filteredHcp = hcpProvider.filterHome();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: isEmergencyMode ? ColorTheme.black : ColorTheme.red,
        foregroundColor: ColorTheme.white,
        child: emergencyBroadCasting
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: ColorTheme.red,
                ),
              )
            : Icon(isEmergencyMode
                ? Symbols.emergency_share_off_rounded
                : Icons.emergency_share),
        onPressed: () async {
          // print(auth.accessToken);

          setState(() {
            isEmergencyMode = !isEmergencyMode;
          });
          String contentAlert = "You are in emergency mode!";
          AnimatedSnackBar snackBarEmergency = AnimatedSnackBar.material(
              contentAlert,
              type: AnimatedSnackBarType.error,
              mobileSnackBarPosition: MobileSnackBarPosition.top,
              desktopSnackBarPosition: DesktopSnackBarPosition.topLeft,
              snackBarStrategy: RemoveSnackBarStrategy(),
              animationCurve: Easing.standardAccelerate);
          AnimatedSnackBar snackSafe = AnimatedSnackBar.material(contentAlert,
              type: AnimatedSnackBarType.success,
              mobileSnackBarPosition: MobileSnackBarPosition.top,
              desktopSnackBarPosition: DesktopSnackBarPosition.topLeft,
              snackBarStrategy: RemoveSnackBarStrategy(),
              animationCurve: Easing.standardAccelerate);

          bool isLocationServiceEnabled =
              await Geolocator.isLocationServiceEnabled();

          if (isLocationServiceEnabled) {
            setState(() {
              emergencyBroadCasting = true;
            });
            Position position = await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.high);
            Emergency emergency = Emergency(
              type: 'Healthcare',
              location: '${position.latitude}:${position.longitude}',
              userId: auth.userProfile.id,
              acceptedBy: auth.userProfile.id,
              status: "pending",
            );
            bool published = await emergencyService.createEmergency(
                emergency, auth.accessToken);
            setState(() {
              emergencyBroadCasting = false;
            });
            if (published) {
              contentAlert = 'Your emergency broadcasted to doctors';
              snackSafe.show(context);

              Future.delayed(const Duration(seconds: 60), () {
                snackSafe.remove();
              });
            }
          } else {
            LocationPermission permission = await Geolocator.checkPermission();
            if (permission == LocationPermission.denied) {
              permission = await Geolocator.requestPermission();
              if (permission == LocationPermission.denied) {
                contentAlert = "Location Permissions are denined";
                snackBarEmergency.show(context);
              }
              if (permission == LocationPermission.deniedForever) {
                contentAlert =
                    "Location Permissions are denined forever can't request again!";
                snackBarEmergency.show(context);
              }
              bool isLocationServiceEnabled =
                  await Geolocator.isLocationServiceEnabled();
              if (!isLocationServiceEnabled) {
                contentAlert = "Please enable location service!";
                // snackBarEmergency.show(context);
                print(contentAlert);
              } else {
                Position position = await Geolocator.getCurrentPosition(
                    desiredAccuracy: LocationAccuracy.high);
                contentAlert =
                    "location: ${position.altitude}: ${position.latitude}";
                print(contentAlert);
              }
            }
          }
          if (isEmergencyMode) {
            contentAlert = "You are now in Emergency State!";
            snackBarEmergency.show(context);
          } else {
            snackSafe.show(context);
          }
          Future.delayed(const Duration(seconds: 60), () {
            isEmergencyMode ? snackBarEmergency.remove() : snackSafe.remove();
          });
        },
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    color: ColorTheme.white,
                    width: size.width * 0.75,
                    padding: EdgeInsets.only(
                        left: size.width * 0.1,
                        top: size.height * 0.04,
                        bottom: size.height * 0.02),
                    child: Text(
                      "Find your desire healt solution",
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: ColorTheme.black,
                      ),
                      softWrap: true,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: size.width * 0.1),
                      child: const Icon(Icons.notifications_outlined))
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: InputFiled(
                    controller: searchController,
                    prefixIcon: Icons.search,
                    placeholder: "Search doctor, drugs, articles...",
                    color: ColorTheme.gray,
                    isError: false),
              ),
              Wrap(
                children: [
                  CategoryItem(
                      size,
                      Icon(
                        Symbols.stethoscope,
                        color: ColorTheme.primaryColor,
                      ),
                      "Doctor"),
                  CategoryItem(
                      size,
                      Icon(
                        Symbols.pill,
                        color: ColorTheme.primaryColor,
                      ),
                      "Pharmacy"),
                  CategoryItem(
                      size,
                      Icon(
                        Symbols.local_hospital,
                        color: ColorTheme.primaryColor,
                      ),
                      "Hospital"),
                  CategoryItem(
                      size,
                      Icon(
                        Symbols.stethoscope,
                        color: ColorTheme.primaryColor,
                      ),
                      "Doctor"),
                ],
              ),
              isFetching
                  ? CircularProgressIndicator()
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: ListView.builder(
                        itemCount: hcpProvider.filterHome().length,
                        itemBuilder: (context, index) {
                          HCP hcp = filteredHcp[index];
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * 0.04),
                            child: HorizontalScrollingItem(
                                size,
                                hcp.profilePicture,
                                'DR. ${hcp.firstname} ${hcp.lastName}',
                                hcp.specialty,
                                hcp.rated.toString(),
                                hcp),
                          );
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: TextButton(
                  child: Text("see all"),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => List_doctor()));
                  },
                ),
              ),
              isFetching
                  ? CircularProgressIndicator()
                  : Container(
                      margin: EdgeInsets.only(left: size.width * 0.02),
                      width: size.width,
                      child: Text(
                        "Your Recent Doctors",
                        style: GoogleFonts.inter(
                            color: ColorTheme.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                height: size.height * 0.15,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (hcpProvider.hpcs.length > index + 2) {
                      HCP hcp = hcpProvider.hpcs[index + 2];
                      return RecentWidget(hcp.profilePicture,
                          'Dr. ${hcp.firstname} ${hcp.lastName}', hcp, size);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell RecentWidget(image, name, hcp, size) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Detail(
                  hcp: hcp,
                )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child: Column(
          children: [
            CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage(image),
            ),
            Text(name)
          ],
        ),
      ),
    );
  }

  InkWell HorizontalScrollingItem(Size size, String imageUrl, String name,
      String job, String rate, HCP hcp) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Detail(
                  hcp: hcp,
                )));
      },
      child: Container(
        height: size.height * 0.31,
        width: size.width * 0.5,
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: ColorTheme.grayBorder),
            borderRadius: BorderRadius.circular(11.13)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.02,
              ),
              child: CircleAvatar(
                  radius: size.height * 0.07,
                  backgroundImage: NetworkImage(imageUrl)),
            ),
            Text(
              name,
              style: GoogleFonts.inter(fontWeight: FontWeight.bold),
            ),
            Text(job, style: GoogleFonts.inter(color: ColorTheme.iconGrey)),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.025),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: ColorTheme.highLight,
                        borderRadius: BorderRadius.circular(2.23)),
                    padding: EdgeInsets.all(3),
                    margin: EdgeInsets.only(left: size.width * 0.03),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: size.width * 0.04,
                          color: ColorTheme.primaryColor,
                        ),
                        Text(
                          rate,
                          style: TextStyle(color: ColorTheme.primaryColor),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Icon(
                    Icons.location_on,
                    color: ColorTheme.iconGrey,
                    size: size.width * 0.04,
                  ),
                  Text(
                    "1.5km away",
                    style: GoogleFonts.inter(
                        color: ColorTheme.iconGrey,
                        fontSize: size.width * 0.03),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding CategoryItem(Size size, Icon icon, String title) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Column(
        children: [
          icon,
          Text(
            title,
            style: TextStyle(color: ColorTheme.iconGrey),
          )
        ],
      ),
    );
  }
}
