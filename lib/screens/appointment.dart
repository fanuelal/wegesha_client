
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wegesha_client/config/theme.dart';
import 'package:wegesha_client/widget/listTileWidget.dart';
import 'package:wegesha_client/widget/Button.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // ignore: prefer_const_constructors
     title: Text(
            " Appointment",
            style: GoogleFonts.inter(
              color: ColorTheme.black,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
       
        leading: IconButton(
            onPressed: () {},
            icon: IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_back_ios))),
      ),
      body: SafeArea(
        child: Column(
        children: [
          ListTileWidget(size: size),
                    Container(
                margin: EdgeInsets.only(
                    top: size.height * 0.03, left: size.width * 0.04),
                alignment: Alignment.topLeft,
                child:  Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Date ",
            style: GoogleFonts.inter(
              color: ColorTheme.black,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
              // Spacer(),
              Text(
        "Change",
        style: GoogleFonts.inter(
          color: ColorTheme.gray,
          fontSize: 20,
        ),
      ),
        ],
      ),
      SizedBox(height: 15),
       Row(
    children: [
      Container(
        width: 50,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
        child: const Icon(
          Icons.calendar_month,
          color: Color.fromARGB(255, 17, 122, 112),
        ),
      ),
      SizedBox(width: 20),
      Text(
        "Wednesday, Jun 23, 2021 | 10:00 AM",
        style: TextStyle(color: Colors.black, fontSize: 23,),
      ),
    ],
  ),
      
     
    ],
    
  ),
      
     ),
    
              

        Padding(
  padding: EdgeInsets.only(left: 20.0), 
  child: Divider(
    color: Colors.grey[200],
    thickness: 2.0,
  ),
),
 Container(
                margin: EdgeInsets.only(
                    top: size.height * 0.03, left: size.width * 0.04),
                alignment: Alignment.topLeft,
                child:  Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Reason ",
            style: GoogleFonts.inter(
              color: ColorTheme.black,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
              // Spacer(),
              Text(
        "Change",
        style: GoogleFonts.inter(
          color: ColorTheme.gray,
          fontSize: 20,
        ),
      ),
        ],
      ),
      SizedBox(height: 15),
       Row(
    children: [
      Container(
        width: 50,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
        child: const Icon(
          Icons.edit_square,
          color: Color.fromARGB(255, 17, 122, 112),
        ),
      ),
      SizedBox(width: 20),
      Text(
        "Chest pain",
        style: TextStyle(color: Colors.black, fontSize: 23,),
      ),
    ],
  ),
      
     
    ],
    
  ),
      
     ),
       Padding(
  padding: EdgeInsets.only(left: 20.0), 
  child: Divider(
    color: Colors.grey[200],
    thickness: 2.0,
  ),
),
 Container(
                margin: EdgeInsets.only(
                    top: size.height * 0.03, left: size.width * 0.04),
                alignment: Alignment.topLeft,
                child:  Column(
    children: [
      Row(
        
        children: [
          Text(
            "Payment Detail ",
            style: GoogleFonts.inter(
              color: ColorTheme.black,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
             
  
        ],
      ),
      SizedBox(height: 15),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Consultation ",
        style: GoogleFonts.inter(
         color: ColorTheme.gray,
          fontSize: 20,
         
       ),
      ),
         Text(
         "\$60.00",
         style: GoogleFonts.inter(
           color: ColorTheme.black,
           fontSize: 20,
          
         ),
       ),
      
    ],
  ),
  SizedBox(height:10 ),
  Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Admin Fee ",
        style: GoogleFonts.inter(
         color: ColorTheme.gray,
          fontSize: 20,
         
       ),
      ),
         Text(
         "\$30.00",
         style: GoogleFonts.inter(
           color: ColorTheme.black,
           fontSize: 20,
          
         ),
       ),
      
    ],
  ),
  SizedBox(height:10 ),
  Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Additional Discount ",
        style: GoogleFonts.inter(
         color: ColorTheme.gray,
          fontSize: 20,
         
       ),
      ),
         Text(
         "-",
         style: GoogleFonts.inter(
           color: ColorTheme.black,
           fontSize: 20,
          
         ),
       ),
      
    ],
  ),
  SizedBox(height:15 ),
  Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Total ",
        style: GoogleFonts.inter(
         color: ColorTheme.black,
          fontSize: 23,
         fontWeight: FontWeight.bold,
       ),
      ),
         Text(
         "\$90.00",
         style: GoogleFonts.inter(
           color: const Color.fromARGB(255, 17, 122, 112),
           fontSize: 20,
           fontWeight: FontWeight.bold,
          
         ),
       ),
      
    ],
  ),
      
     
    ],
    
  ),
      
     ),


     Padding(
  padding: EdgeInsets.only(left: 20.0), 
  child: Divider(
    color: Colors.grey[200],
    thickness: 2.0,
  ),
),

     Container(
  margin: EdgeInsets.only(top: size.height * 0.03, left: size.width * 0.04),
  alignment: Alignment.topLeft,
  child: Column(
    children: [
      Row(
        children: [
          Text(
            "Payment Method",
            style: GoogleFonts.inter(
              color: ColorTheme.black,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      SizedBox(height: 15),
      Container(
       width: 600,
       height: 80,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffE5E7EB)),
          color: Colors.transparent,
            borderRadius: BorderRadius.circular(11.13),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
          padding: EdgeInsets.only(left: 20.0),
                child: Text(
              "VISA",
              style: GoogleFonts.inter(
                color: Color(0xFF1A1F71),
                fontSize: 23,
                fontWeight: FontWeight.w900,
              ),
             
            ),
            ),
            Padding(
          padding: EdgeInsets.only(right: 20.0),
                child:
            Text(
              "change",
              style: GoogleFonts.inter(
                color: ColorTheme.black,
                fontSize: 20,
              ),
            ),
            ),
          ],
        ),
      ),
      SizedBox(height: 10),
    ],
  ),
),


       SizedBox(height: 20),
      Row(
        children: [
          Column(
            children: [
              Padding(
          padding: EdgeInsets.only(left: 20.0),
                child:Text(
        "Total ",
        style: GoogleFonts.inter(
          color: ColorTheme.gray,
          fontSize: 23,
         
        ),
      ),
              ),
      SizedBox(height: 10),
      Padding(
          padding: EdgeInsets.only(left: 20.0),
                child:
             Text(
         "\$90.00",
        style: GoogleFonts.inter(
          color: ColorTheme.black,
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
      ),
            ],
          ),
            Spacer(),
          Container(
                  margin: EdgeInsets.only(top: size.height*0.02),
                   padding: EdgeInsets.only(right: 25.0),
                  child: Button(
                    title: "Booking",
                    height: 0.05,
                    width: 0.4,
                    onTap: () {
                     
                    },
                    isElevated: true),
                          ),
        ],
      ), 
        

        ],
        
      ),

      
      
      
      ),

    );
            

  }
}