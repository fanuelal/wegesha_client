import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wegesha_client/config/theme.dart';
import 'package:wegesha_client/widget/input_filed.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../widget/bottomNavBar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: TextButton(
                  child: Text("see all"),
                  onPressed: () {},
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    HorizontalScrollingItem(
                        size,
                        "https://media.istockphoto.com/id/1372002650/photo/cropped-portrait-of-an-attractive-young-female-doctor-standing-with-her-arms-folded-in-the.jpg?s=612x612&w=0&k=20&c=o1QtStNsowOU0HSof6xQ_jZMglU8ZK565gHd655U6S4=",
                        "Dr. Maria Elena",
                        "Psychologist",
                        "4.5"),
                    HorizontalScrollingItem(
                        size,
                        "https://media.istockphoto.com/id/1197650057/photo/portrait-of-female-nurse-using-tablet-at-hospital.jpg?s=612x612&w=0&k=20&c=Z46rTvNKqQfwQv0KYNQj4DbU3fDZ1hP4atPyMgYDZBg=",
                        "Dr. Stevi Jessi",
                        "Orthopedist",
                        "4.2"),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              const Text("Your Recent Doctors"),
              SizedBox(
                height: size.height * 0.04,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    RecentWidget(
                        "https://img.freepik.com/free-photo/woman-doctor-wearing-lab-coat-with-stethoscope-isolated_1303-29791.jpg",
                        "Dr. Marcus",
                        size),
                    RecentWidget(
                        "https://t3.ftcdn.net/jpg/02/60/04/08/360_F_260040863_fYxB1SnrzgJ9AOkcT0hoe7IEFtsPiHAD.jpg",
                        "Dr. Marcus",
                        size),
                    RecentWidget(
                        "https://t4.ftcdn.net/jpg/03/20/52/31/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg",
                        "Dr. Marcus",
                        size),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container RecentWidget(image, name, size) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      child: Column(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(image),
          ),
          Text(name)
        ],
      ),
    );
  }

  Container HorizontalScrollingItem(
    Size size,
    String imageUrl,
    String name,
    String job,
    String rate,
  ) {
    return Container(
      height: size.height * 0.375,
      width: size.width * 0.4,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.06),
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
                radius: size.height * 0.06,
                backgroundImage: NetworkImage(imageUrl)),
          ),
          Text(
            name,
            style: GoogleFonts.inter(fontWeight: FontWeight.bold),
          ),
          Text(job, style: GoogleFonts.inter(color: ColorTheme.iconGrey)),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.05),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: ColorTheme.highLight,
                      borderRadius: BorderRadius.circular(2.23)),
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.only(left: size.width * 0.01),
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
                      color: ColorTheme.iconGrey, fontSize: size.width * 0.03),
                )
              ],
            ),
          )
        ],
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
