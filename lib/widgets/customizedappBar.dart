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
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
      ),
      SizedBox(
          // It means 5 because by out defaultSize = 10
          //  width: SizeConfig.defaultSize * 0.5,
          )
    ],
  );
}
