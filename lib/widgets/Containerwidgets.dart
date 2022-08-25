import 'package:eventplaner/widgets/customizedappBar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../Model/eventModelV2.dart';
import '../screens/detailsPageV2.dart';

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

Widget Imagecontainer(Image image) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
    child: image,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    height: 300.0,
    width: 500,
  );
}

Widget ProfileContainer() {
  return Container(
    margin: EdgeInsets.all(10),
    height: 30,
    width: 30,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        image: DecorationImage(image: AssetImage('assets/account.png'))),
  );
}
