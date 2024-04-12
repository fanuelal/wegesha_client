import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wegesha_client/config/theme.dart';
import 'package:wegesha_client/widget/bottomNavBar.dart';
import 'package:material_symbols_icons/symbols.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<String> entries = <String>[
      'My Save',
      'Appointment',
      'Payment',
      'FAQs',
      'Logout'
    ];
    // final List<int> colorCodes = <int>[600, 500, 300, 200, 100];
    final List<IconData> newicon = [
      Symbols.favorite,
      Symbols.article,
      Symbols.account_balance_wallet_rounded,
      Symbols.sms_rounded,
      Symbols.error,
    ];

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
        bottomNavigationBar: const BottomNav(),
        body: Stack(children: [
          Container(
            height: size.height * 0.4,
            color: ColorTheme.primaryColor,
          ),
          Positioned(
            top: size.height * 0.08, // Adjust based on desired positioning
            left: size.width * 0.4, // Center the content horizontally

            child: RecentWidget(
              "https://t3.ftcdn.net/jpg/02/60/04/08/360_F_260040863_fYxB1SnrzgJ9AOkcT0hoe7IEFtsPiHAD.jpg",
              "Dr. Marcus",
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
                            Symbols.ecg_heart,
                            color: ColorTheme.white,
                            size: 50,
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
                            size: 50,
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
                  CategoryItem(
                      size,
                      Icon(
                        Symbols.exercise_rounded,
                        color: ColorTheme.white,
                        size: 50,
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
                      color: ColorTheme.highLight,
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
                            color: ColorTheme.highLight,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        color: ColorTheme.primaryColor,
                                        newicon[index],
                                        size: 40,
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  '${entries[index]}',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Symbols.navigate_next,
                                        size: 50,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                      ))))
        ]));
  }
}

Column RecentWidget(String image, String name) {
  return Column(
    children: [
      CircleAvatar(
        radius: 32,
        backgroundImage: NetworkImage(image),
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
