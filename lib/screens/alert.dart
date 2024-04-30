// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import '../widget/Button.dart';


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
    content = "Once again you login successfully\n into Wegesha app.";
   iconData = Icons.check_circle;
    iconColor = const Color.fromARGB(255, 17, 122, 112);

  } else if (quickAlertType == QuickAlertType.error) {
    title = "Error!";
    content = "Please try again.";
    iconData = Icons.error;
     iconColor = const Color(0xffFF5C5C);
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
             Align(
                  alignment: Alignment.center,
                  child: Button(
                    title: 'Go To Home',
                    height: 0.06,
                    width: 0.2,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
         
         
          if (quickAlertType == QuickAlertType.error)
            Align(
                  alignment: Alignment.center,
                  child: Button(
                    title: 'Please Check',
                    height: 0.06,
                    width: 0.2,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
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
