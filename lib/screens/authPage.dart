import 'package:flutter/material.dart';
import 'package:wegesha_client/config/theme.dart';
import 'package:wegesha_client/widget/input_filed.dart';

class TextScreen extends StatefulWidget {
  const TextScreen({super.key});

  @override
  State<TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 10),
        child: InputFiled(
            controller: controller,
            prefixIcon: Icons.person_3_outlined,
            suffixIcon: Icons.remove_red_eye,
            placeholder: "Enter your email",
            color: ColorTheme.primaryColor,
            isError: false,),
      ),
    );
  }
}
