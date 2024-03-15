import 'dart:ffi';

import 'package:flutter/material.dart';
import '../config/theme.dart';

class InputFiled extends StatefulWidget {
  late TextEditingController controller;
  IconData prefixIcon;
  late IconData suffixIcon;
  String placeholder;
  Color color;
  bool isError;
  // void onChanged;
  InputFiled(
      {super.key,
      required this.controller,
      required this.prefixIcon,
      required this.suffixIcon,
      required this.placeholder,
      required this.color,
      required this.isError,});

  @override
  State<InputFiled> createState() => _InputFiledState();
}

class _InputFiledState extends State<InputFiled> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        fillColor: ColorTheme.grayBorder,
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
        prefixIcon: Icon(
          widget.prefixIcon,
          color: ColorTheme.iconGrey,
        ),
        suffixIcon: Icon(widget.suffixIcon, color: ColorTheme.iconGrey),
        prefixIconColor: widget.controller.text == ""
            ? ColorTheme.gray
            : ColorTheme.primaryColor,
      ),
      // onChanged: widget.onChanged,
    );
  }
}
