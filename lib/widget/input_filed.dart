import 'package:flutter/material.dart';
import '../config/theme.dart';

class InputFiled extends StatefulWidget {
  final TextEditingController controller;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final String placeholder;
  final Color color;
  final bool isError;
  final bool suffixIconNeeded;
  // void onChanged;
  InputFiled({
    super.key,
    required this.controller,
    required this.prefixIcon,
    this.suffixIcon = Icons.remove_red_eye_outlined,
    required this.placeholder,
    required this.color,
    required this.isError,
    this.suffixIconNeeded = false
  });

  @override
  State<InputFiled> createState() => _InputFiledState();
}

class _InputFiledState extends State<InputFiled> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorTheme.lightGray,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
                color: widget.isError ? ColorTheme.red : ColorTheme.grayBorder,
                width: 1.5)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(color: ColorTheme.grayBorder, width: 1.5)),
        hintText: widget.placeholder,
        hintStyle: TextStyle(
            color: widget.isError ? ColorTheme.red : ColorTheme.iconGrey),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Icon(
            widget.prefixIcon,
            color: ColorTheme.iconGrey,
          ),
        ),
         suffixIcon: widget.suffixIconNeeded? Icon(widget.suffixIcon, color: ColorTheme.iconGrey): const Spacer(),
        prefixIconColor: widget.controller.text == ""
            ? ColorTheme.gray
            : ColorTheme.primaryColor,
      ),
      // onChanged: widget.onChanged,
    );
  }
}