import 'package:eventplaner/constant/constants.dart';
import 'package:flutter/material.dart';

class inputfields extends StatelessWidget {
  String? hint_text;
  IconData? field_icon;
  TextEditingController? controller;
  inputfields(
      {required this.hint_text,
      required this.field_icon,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      width: width * 0.8,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Color(0x26741b47),
      ),

      // ignore: prefer_const_constructors
      child: TextField(
        controller: controller,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint_text,
          icon: Icon(
            field_icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
