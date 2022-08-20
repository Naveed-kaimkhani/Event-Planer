import 'package:eventplaner/widgets/customizedappBar.dart';
import 'package:flutter/material.dart';

Widget drawer1() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        buildAppBar(""),
        ListTile(
          //menu item of Drawer
          leading: Icon(Icons.home),
          title: Text('Home Page'),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('My Profile'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Account Settings'),
        ),
        ListTile(
            onTap: () {},
            leading: Icon(Icons.close),
            title: Text("Close Drawer"))
      ],
    ),
  );
}
