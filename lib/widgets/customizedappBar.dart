import 'package:eventplaner/constant/constants.dart';
import 'package:eventplaner/widgets/drawer.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(String title) {
  return AppBar(
    backgroundColor: Constants.primaryColor,

    // On Android by default its false
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(color: Colors.white),
    ),
    actions: <Widget>[
      PopupMenuButton(
          icon: Icon(Icons.crib),
          itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text("Indoor"),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text("Outdoor"),
                  value: 2,
                )
              ])
    ],
  );
}
