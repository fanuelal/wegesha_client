import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:wegesha_client/config/theme.dart';
import 'package:wegesha_client/screens/home_screen.dart';
import 'package:wegesha_client/screens/profile.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<TabItem> items = [
    const TabItem(
      icon: Icons.home_rounded,
    ),
    const TabItem(
      icon: Icons.history,
    ),
    const TabItem(
      icon: Icons.calendar_month_rounded,
    ),
    const TabItem(
      icon: Icons.person_2_rounded,
    ),
  ];
  int visit = 0;

  Widget BottomNav() {
    return BottomBarInspiredFancy(
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

  List<Widget> pages = [
    HomeScreen(),
    const SafeArea(child: Text("History Doctor")),
    const SafeArea(child: Text("Scheduled Histories")),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: pages[visit],
    );
  }
}
