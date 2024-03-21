import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wegesha_client/config/theme.dart';
import 'package:wegesha_client/widget/input_filed.dart';
import 'package:material_symbols_icons/symbols.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              Container(
                width: size.width * 0.75,
                padding: EdgeInsets.only(
                    left: size.width * 0.1,
                    top: size.height * 0.1,
                    bottom: size.height * 0.05),
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
          const Row(
            children: [
              Column(
                children: [Icon(Symbols.stethoscope)],
              )
            ],
          )
        ],
      )),
    );
  }
}
