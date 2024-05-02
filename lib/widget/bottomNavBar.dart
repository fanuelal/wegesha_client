import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:wegesha_client/config/theme.dart';
import 'package:wegesha_client/screens/home_screen.dart';
import 'package:wegesha_client/screens/profile.dart';
import 'package:material_symbols_icons/get.dart';
import '../screens/appointment.dart';
import '../screens/myAppointment.dart';
import '../screens/result.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({required this.accessToken});
  final String accessToken;
  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<TabItem> items = [
    const TabItem(
      icon: Symbols.home_app_logo_rounded,
    ),
    TabItem(
      icon: Symbols.biotech_rounded,
    ),
    const TabItem(
      icon: Icons.event_available_rounded,
    ),
    const TabItem(
      icon: Icons.person_2_rounded,
    ),
  ];
  int visit = 0;

  Widget BottomNav() {
    return BottomBarInspiredFancy(
      iconSize: 23,
      items: items,
      backgroundColor: Colors.white,
      color: ColorTheme.gray,
      colorSelected: ColorTheme.primaryColor,
      indexSelected: visit,
      styleIconFooter: StyleIconFooter.dot,
      onTap: (int index) => setState(() {
        visit = index;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
  List<Widget> pages = [
    HomeScreen(accessToken: widget.accessToken,),
    ResultsScreen(),
    const MyAppointment(),
    const Profile(),
  ];
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: pages[visit],
    );
  }
}
