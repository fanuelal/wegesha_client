// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wegesha_client/config/theme.dart';
import 'package:wegesha_client/model/hcp.dart';
import 'package:wegesha_client/provider/hcp_provider.dart';
import 'package:wegesha_client/screens/home_screen.dart';

import '../widget/bottomNavBar.dart';
import '../widget/listTileWidget.dart';

class Doctor {
  late String name;
  late String photoUrl;
  late String description;
  late String location;
  late String star;

  Doctor({
    required this.name,
    required this.photoUrl,
    required this.description,
    required this.location,
    required this.star,
  });
}

class List_doctor extends StatefulWidget {
  const List_doctor({super.key});

  @override
  State<List_doctor> createState() => list_doctorState();
}

class list_doctorState extends State<List_doctor> {
  List<String> distances = [
    "10.5KM",
    "15.3KM",
    "12.23KM",
    "22.4KM",
    "10.5KM",
    "15.3KM",
    "12.23KM",
    "22.4KM",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final hcpProvider = Provider.of<Hcp_Provider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Top Doctor",
          style: GoogleFonts.inter(
            color: ColorTheme.black,
            fontSize: 16,
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
        child: Container(
          height: size.height,
          child: ListView.builder(
            itemCount: hcpProvider.hpcs.length,
            itemBuilder: (context, index) {
              HCP hcp = hcpProvider.hpcs[index];
              return ListTileWidget(
                size: size,
                name: 'Dr. ${hcp.firstname} ${hcp.lastName}',
                distance: distances[index],
                filedStudy: hcp.specialty,
                rate: 4,
                hcp: hcp,
                imageUrl: hcp.profilePicture,
              );
            },
          ),
        ),
      ),
    );
  }
}
