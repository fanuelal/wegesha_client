// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';


class Alert extends StatefulWidget {
  const Alert({super.key});

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
 void showAlert(QuickAlertType quickAlertType) {
   late IconData iconData;
  late String title;
  late String content;
   late Color iconColor;

  if (quickAlertType == QuickAlertType.success) {
    title = "Yeay!Welcome Back ";
    content = "Once again you logged in successfully\n into Wegesha app.";
   iconData = Icons.check_circle;
    iconColor = Colors.green;

  } else if (quickAlertType == QuickAlertType.error) {
    title = "Error!";
    content = "Please try again.";
    iconData = Icons.error;
     iconColor = Colors.red;
  }
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child:AlertDialog(
             content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
               Icon(
                  iconData,
                  size: 100,
                   color: iconColor,
                ),
                const SizedBox(height: 20),
                Text(title ,style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,),),
               const SizedBox(height: 7),
                Text(content,    maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                style: TextStyle(color: const Color(0xff717784),fontSize: 15,
                ),),
              ],
            ),
       
        
        actions: <Widget>[
          if (quickAlertType == QuickAlertType.success)
         
            TextButton(
              onPressed: () {
              
                Navigator.of(context).pop(); 
              },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF199A8E)),
                     foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
              child:  const Text("Go to Home"),
            ),
          if (quickAlertType == QuickAlertType.error)
         
            TextButton(
              onPressed: () {
                
                Navigator.of(context).pop(); 
              },
                 style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff199A8E)),
                     foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                
              child:const Text("Please check"),
            ),
        ],
      ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  showAlert(QuickAlertType.success);
                  
                },
                child:const Text("Success Alert")),
            ElevatedButton(
                onPressed: () {
                  showAlert(QuickAlertType.error);
                },
                child:const Text("Error Alert")),
          ],
        ),
      ),
    );
  }
}
