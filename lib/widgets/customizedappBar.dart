import 'package:eventplaner/constant/constants.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Constants.primaryColor,
    leading: IconButton(
      icon: (Icon(Icons.menu)),
      onPressed: () {},
    ),
    // On Android by default its false
    centerTitle: true,
    title: Text(
      "Event PLanner",
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
