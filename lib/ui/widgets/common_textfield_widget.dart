import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  String hintText;
  TextEditingController controller;

  CommonTextField({
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.12),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white54,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 14.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
