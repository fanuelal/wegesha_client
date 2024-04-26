import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wegesha_client/config/theme.dart';
import 'package:wegesha_client/widget/bottomNavBar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            color: ColorTheme.primaryColor,
          ),
// RecentWidget(
//                   "https://t3.ftcdn.net/jpg/02/60/04/08/360_F_260040863_fYxB1SnrzgJ9AOkcT0hoe7IEFtsPiHAD.jpg",
//                   "Dr. Marcus"),
          
          child: Container(
            margin: EdgeInsets.only(top: size.height * 0.45),
            decoration: BoxDecoration(
                color: ColorTheme.highLight,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            
          )),
    );
      Column RecentWidget(image, name) {
    return Column(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundImage: NetworkImage(image),
        ),
        Text(name)
      ],
    );
  }
  }
}
