import 'package:eventplaner/screens/EventTypes/BithdayScreen.dart';
import 'package:eventplaner/screens/EventTypes/CorporateEventsScreen.dart';
import 'package:eventplaner/screens/EventTypes/weddings.dart';
import 'package:eventplaner/screens/HomePagev2.dart';
import 'package:eventplaner/widgets/customizedappBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drawers/flutter_drawers.dart';

import 'constant/constants.dart';

class rootPage extends StatefulWidget {
  const rootPage({Key? key}) : super(key: key);

  @override
  State<rootPage> createState() => _rootPageState();
}

//itsanoushahere
class _rootPageState extends State<rootPage> {
  List<Widget> pages = [];
  int currentPage = 0;

  void setPageIndex(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    pages = [
      HomePagev2(setPageIndex),
      WeddingScreen(setPageIndex),
      CorporateEventScreen(setPageIndex),
      BirthdayScreen(setPageIndex),
    ];

    // final isLargeScreen =
    //     MediaQuery.of(context).size.width > AppDefined.tabletThreshWidth;
    return  BoxDrawer(
    drawer: Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildAppBar2("Your Drawer"),
          ListTile(
            iconColor: Constants.primaryColor,
            //menu item of Drawer
            leading: Icon(Icons.home),
            title: Text('Home Page',
                style: TextStyle(color: Constants.primaryColor)),
          ),
          ListTile(
            iconColor: Constants.primaryColor,
            leading: Icon(Icons.account_circle),
            title: Text('My Profile',
                style: TextStyle(color: Constants.primaryColor)),
          ),
          ListTile(
            iconColor: Constants.primaryColor,
            leading: Icon(Icons.man),
            title: Text(
              'Upload Event',
              style: TextStyle(color: Constants.primaryColor),
            ),
          ),
          ListTile(
            iconColor: Constants.primaryColor,
            leading: Icon(Icons.settings),
            title: Text(
              'Account Settings',
              style: TextStyle(color: Constants.primaryColor),
            ),
          ),
          SizedBox(height: 200),
          Image(image: AssetImage("assets/undraw_Login_re_4vu2.png"))
        ],
      ),
    ),
    alignment: DrawerAlignment.start,
    showDrawerOpener: true,
    drawerOpenerTopMargin: 0.8,
  //  animatedHeader: drawerHeader,
    child:pages[currentPage],
    //   headerHeight: 20,
  
  );
  }
}
