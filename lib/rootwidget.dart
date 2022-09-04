import 'package:eventplaner/screens/EventTypes/BithdayScreen.dart';
import 'package:eventplaner/screens/EventTypes/OthersEvent.dart';
import 'package:eventplaner/screens/EventTypes/weddings.dart';
import 'package:eventplaner/screens/HomePagev2.dart';

import 'package:eventplaner/screens/UploadEvent.dart';
import 'package:eventplaner/screens/totalEvents.dart';
import 'package:eventplaner/screens/userProfile.dart';
import 'package:eventplaner/screens/welcomePage.dart';
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
      // HomePagev2(setPageIndex),
      // WeddingsPage(setPageIndex),
      // BirthdaysPage(setPageIndex),
      // OthersPage(setPageIndex),
    ];

    // final isLargeScreen =
    //     MediaQuery.of(context).size.width > AppDefined.tabletThreshWidth;
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: BoxDrawer(
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
                title: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserProfile2()));
                  },
                  child: Text('My Profile',
                      style: TextStyle(color: Constants.primaryColor)),
                ),
              ),
              ListTile(
                iconColor: Constants.primaryColor,
                leading: Icon(Icons.man),
                title: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UploadEvent()));
                  },
                  child: Text(
                    'Upload event',
                    style: TextStyle(color: Constants.primaryColor),
                  ),
                ),
              ),
              ListTile(
                iconColor: Constants.primaryColor,
                leading: Icon(Icons.man),
                title: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TotalEvents()));
                  },
                  child: Text(
                    'All your events',
                    style: TextStyle(color: Constants.primaryColor),
                  ),
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
        child: HomePagev2(),
        //   headerHeight: 20,
      ),
    );
  }
}
