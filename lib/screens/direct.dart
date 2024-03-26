import 'package:flutter/material.dart';
import 'package:wegesha_client/screens/detail.dart';

class Direct extends StatefulWidget {
  const Direct({super.key});

  @override
  State<Direct> createState() => _DirectState();
}

class _DirectState extends State<Direct> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Detail()));
      },
      child: const Text(
        'TextButton',
      ),
    ));
  }
}
