import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:wegesha_client/config/theme.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<TabItem> items = [
    TabItem(
      icon: Icons.home_rounded,
    ),
    TabItem(
      icon: Icons.chat_bubble_outline,
    ),
    TabItem(
      icon: Icons.calendar_month_rounded,
    ),
    TabItem(
      icon: Icons.person_2_rounded,
    ),
  ];
  int visit = 0;

  @override
  Widget build(BuildContext context) {
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
}
