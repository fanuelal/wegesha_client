import 'package:flutter/material.dart';
import '../config/theme.dart';

class InputFiled extends StatefulWidget {
  late TextEditingController controller;
  IconData prefixIcon;
  late IconData suffixIcon;
  String placeholder;
  Color color;
  bool isError;
  bool suffixIconNeeded;
  bool isPassword;
  // void onChanged;
  InputFiled(
      {super.key,
      required this.controller,
      required this.prefixIcon,
      this.suffixIcon = Icons.remove_red_eye_outlined,
      required this.placeholder,
      required this.color,
      required this.isError,
      this.suffixIconNeeded = false,
      this.isPassword = false});

  @override
  State<InputFiled> createState() => _InputFiledState();
}

class _InputFiledState extends State<InputFiled> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.075,
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorTheme.lightGray,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                  color:
                      widget.isError ? ColorTheme.red : ColorTheme.grayBorder,
                  width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: ColorTheme.grayBorder, width: 1)),
          hintText: widget.placeholder,
          hintStyle: TextStyle(
              fontWeight: FontWeight.normal,
              color: widget.isError ? ColorTheme.red : ColorTheme.iconGrey),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(
              widget.prefixIcon,
              color: ColorTheme.iconGrey,
            ),
          ),
          suffixIcon: widget.suffixIconNeeded
              ? IconButton(
                  icon: Icon(widget.suffixIcon),
                  onPressed: () {
                    setState(() {
                      widget.isPassword = !widget.isPassword;
                    });
                  },
                  color: ColorTheme.iconGrey)
              : const Spacer(),
          prefixIconColor: widget.controller.text == ""
              ? ColorTheme.gray
              : ColorTheme.primaryColor,
        ),
      ),
    );
  }
}
