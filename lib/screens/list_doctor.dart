// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wegesha_client/config/theme.dart';

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

class list_doctor extends StatefulWidget {
  const list_doctor({super.key});

  @override
  State<list_doctor> createState() => list_doctorState();
}

class list_doctorState extends State<list_doctor> {
  List<Doctor> doctors = [
    Doctor(
      name: 'Dr.Yared Lemma',
      photoUrl:
          'https://www.regencymedicalcentre.com/wp-content/uploads/2018/03/black-doctor-bg-transparent-e1483021130255.png',
      description: 'Orthopedist',
      location: '200m away',
      star: '4.7',
    ),
    Doctor(
      name: 'Dr.Fanuel Alemaw',
      photoUrl:
          'https://www.meonly.live/wp-content/uploads/2018/04/doctor-pic13-600x459.png',
      description: 'Charadiologist',
      location: '500m away',
      star: '4.7',
    ),
    Doctor(
      name: 'Dr.Marina Elena',
      photoUrl:
          'https://madamefigaro.cy/wp-content/uploads/2021/08/doctor-pic-bg.png',
      description: 'Orthopedist',
      location: '200m away',
      star: '4.7',
    ),
    Doctor(
      name: 'Dr.Kidsit Mamaye ',
      photoUrl: 'https://pluspng.com/img-png/png-woman-doctor--602.png',
      description: 'Psychologist',
      location: '800m away',
      star: '4.7',
    ),
    Doctor(
      name: 'Dr.Hermela Asamenew ',
      photoUrl:
          'https://i.pinimg.com/originals/7c/23/13/7c2313f8d49ff41e48982af55d5938f9.png',
      description: 'Orthopedist',
      location: '700m away',
      star: '4.7',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // ignore: prefer_const_constructors
        title: Text(
            "Top Doctor",
            style: GoogleFonts.inter(
              color: ColorTheme.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
        leading: IconButton(
            onPressed: () {},
            icon: IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_back_ios))),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            Doctor doctor = doctors[index];
            return ListTileWidget(size: size);
          },
        ),
      ),
    );
  }
}
