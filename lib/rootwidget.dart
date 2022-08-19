import 'package:eventplaner/Model/demoStuff/demoimages.dart';
import 'package:eventplaner/screens/EventTypes/BithdayScreen.dart';
import 'package:eventplaner/screens/EventTypes/CorporateEventsScreen.dart';
import 'package:eventplaner/screens/EventTypes/weddings.dart';
import 'package:eventplaner/screens/homePage.dart';
import 'package:flutter/material.dart';

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
      HomePage(setPageIndex),
      WeddingPage(setPageIndex),
      BirthdayPage(setPageIndex),
      CorporateEventsPage(setPageIndex),
    ];
    // final isLargeScreen =
    //     MediaQuery.of(context).size.width > AppDefined.tabletThreshWidth;
    return pages[currentPage];
  }
}

class CorporateEventsScreen {}
