import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wegesha_client/config/theme.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wegesha_client/model/user.dart';
import 'package:wegesha_client/provider/auth.dart';

import 'auth_page.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  static String route = '/profile';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  final List<String> entries = <String>[
    'My Save',
    'Appointment',
    'Payment',
    'FAQs',
    'Logout'
  ];
  final List<IconData> newicon = [
    Symbols.favorite,
    Symbols.schedule_rounded,
    Symbols.account_balance_wallet_rounded,
    Symbols.question_mark_rounded,
    Symbols.logout_rounded,
  ];
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final auth = Provider.of<Auth>(context);
    final UserModel userProfile = auth.userProfile;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorTheme.primaryColor,
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert, color: ColorTheme.white),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        body: Stack(children: [
          Container(
            height: size.height * 0.4,
            color: ColorTheme.primaryColor,
          ),
          Positioned(
            top: size.height * 0.01, // Adjust based on desired positioning
            left: size.width * 0.35, // Center the content horizontally

            child: RecentWidget(
              userProfile.profilePicture,
              "${userProfile.firstName} ${userProfile.lastName}",
              size,
            ),
          ),
          Positioned(
            child: Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.2, left: size.width * 0.07),
              child: Row(
                children: [
                  Row(
                    children: [
                      CategoryItem(
                          size,
                          Icon(
                            Symbols.ecg_heart_rounded,
                            color: ColorTheme.white,
                            size: 40,
                          ),
                          "Heart rate",
                          "215bpm"),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(bottom: size.height * 0.5),
                          height: size.height * 0.08,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: ColorTheme
                                    .lightgreen, // Specify the color of the border
                                width: 1.0, // Specify the width of the border
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CategoryItem(
                          size,
                          Icon(
                            Symbols.local_fire_department,
                            color: ColorTheme.white,
                            size: 40,
                          ),
                          "Calories",
                          "756cal"),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(bottom: size.height * 0.5),
                          height: size.height * 0.08,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: ColorTheme.lightgreen,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  CategoryItem(
                      size,
                      Icon(
                        Symbols.exercise_rounded,
                        color: ColorTheme.white,
                        size: 40,
                      ),
                      "Weight",
                      "103lbs"),
                ],
              ),
            ),
          ),
          Positioned(
              child: Container(
                  margin: EdgeInsets.only(top: size.height * 0.37),
                  height: size.height * 6.3,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: ColorTheme.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Container(
                      margin: EdgeInsets.only(top: size.height * 0.02),
                      child: ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: entries.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: size.height * 0.077,
                            color: ColorTheme.white,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.08),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: ColorTheme.highLight,
                                          child: IconButton(
                                            onPressed: () {
                                              switch (index) {
                                                case 0:
                                                  break;
                                                case 1:
                                                  break;
                                                case 4:
                                                  auth.accessToken = "";
                                                  auth.userProfile = UserModel(
                                                      email: "",
                                                      firstName: "",
                                                      lastName: "",
                                                      phoneNumber: "",
                                                      dateOfBirth: "",
                                                      userType: "",
                                                      isOnline: false);
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      AuthPage(
                                                                        title:
                                                                            "login",
                                                                      )));
                                                  break;
                                              }
                                            },
                                            color: index == 4
                                                ? ColorTheme.red
                                                : ColorTheme.primaryColor,
                                            icon: Icon(newicon[index]),
                                            iconSize: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  '${entries[index]}',
                                  style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: index == 4
                                          ? ColorTheme.red
                                          : ColorTheme.black),
                                ),
                                const Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Symbols.navigate_next,
                                        size: 35,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(
                          thickness: 0.5,
                        ),
                      ))))
        ]));
  }
}

Column RecentWidget(String image, String name, Size size) {
  return Column(
    children: [
      image != ""
          ? CircleAvatar(
              radius: size.width * 0.15,
              backgroundImage: NetworkImage(image),
            )
          : CircleAvatar(
              radius: size.width * 0.15,
              backgroundColor: ColorTheme.highLight,
              child: Text(
                name[0],
                style: GoogleFonts.inter(fontSize: size.width * 0.2),
              ),
            ),
      Text(
        name,
        style: GoogleFonts.inter(
            color: ColorTheme.white, fontWeight: FontWeight.bold, fontSize: 21),
      ),
    ],
  );
}

Padding CategoryItem(Size size, Icon icon, String title, String amount) {
  return Padding(
    padding: EdgeInsets.all(size.width * 0.05),
    child: Row(
      children: [
        Column(
          children: [
            icon,
            Text(
              title,
              style:
                  GoogleFonts.inter(color: ColorTheme.lightgreen, fontSize: 16),
            ),
            Text(
              amount,
              style: GoogleFonts.inter(
                  color: ColorTheme.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 21),
            )
          ],
        ),
      ],
    ),
  );
}
