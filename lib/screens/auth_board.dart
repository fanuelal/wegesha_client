import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController _userName = TextEditingController();
  late TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _userName = TextEditingController();
    _password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(icon: Icon(Icons.person)),
            controller: _userName,
            onSubmitted: (String str) {
              // print(_userName.text);
              // print(str);
            },
          ),
          TextField(
            decoration: const InputDecoration(icon: Icon(Icons.person)),
            controller: _password,
            onSubmitted: (String str) {
              // print(_userName.text);
              // print(str);
            },
          ),
        ],
      ),
    );
  }
}
