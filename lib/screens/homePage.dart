import 'package:eventplaner/Model/eventModelV2.dart';
import 'package:eventplaner/screens/detailsPage.dart';

import 'package:eventplaner/Model/eventModel.dart';
import 'package:eventplaner/Model/sellermodel.dart';
import 'package:eventplaner/screens/eventtype.dart';
import 'package:eventplaner/widgets/drawer.dart';

import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../Model/User_Details.dart';
import '../Model/eventModelV2.dart';
import '../Provider/UserDetailsProvider.dart';
import '../Model/demoStuff/demoimages.dart';
import '../constant/constants.dart';

import '../widgets/customizedappBar.dart';

import '../services/Firestore_method.dart';
import '../widgets/widgets.dart';
import 'EventTypes/weddings.dart';
import 'detailsPage.dart';

class HomePage extends StatefulWidget {
  final Function? setPageIndex;
  const HomePage(
    this.setPageIndex, {
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<eventModel>? AllEvents;

  void getData() async {
    List<eventModel> events = await Firestore_method.getDataFromDb();

    //List<eventModel> events = await Firestore_method.getDataFromDb();

    setState(() {
      AllEvents = events;
    });
  }

  @override
  void initState() {
    getData();
    // Firestore_method().getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User_Details? userdetails =
        Provider.of<UserDetailsProvider>(context, listen: false).userDetails;
    print("first name ${userdetails!.firstName}");
    print("last name ${userdetails.lastName}");

    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    List<Event> _eventList = Event.eventList;

    //Plants category
    List<String> _eventTypes = [
      'All',
      'Weddings',
      'Corporate Events',
      'Birthdays',
      'Customized'
    ];
    //Toggle Favorite button
    bool toggleIsFavorated(bool isFavorited) {
      return !isFavorited;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 300, top: 30),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/google.png')),
                      //color: Constants.primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 160),
                          width: 400,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.black54.withOpacity(.6),
                              ),
                              const Expanded(
                                  child: TextField(
                                showCursor: false,
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              )),
                              Icon(
                                Icons.mic,
                                color: Colors.black54.withOpacity(.6),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Constants.primaryColor.withOpacity(.1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _eventTypes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (_eventTypes[index] == _eventTypes[0]) {
                                    this.widget.setPageIndex!(0);
                                  }
                                  if (_eventTypes[index] == _eventTypes[1]) {
                                    this.widget.setPageIndex!(1);
                                  }
                                  if (_eventTypes[index] == _eventTypes[2]) {
                                    this.widget.setPageIndex!(2);
                                  }
                                  if (_eventTypes[index] == _eventTypes[3]) {
                                    this.widget.setPageIndex!(3);
                                  }
                                });
                              },
                              child: Text(
                                _eventTypes[index],
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: selectedIndex == index
                                      ? FontWeight.bold
                                      : FontWeight.bold,
                                  color: selectedIndex == index
                                      ? Constants.blackColor
                                      : Constants.primaryColor,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            image: DecorationImage(
                                image: AssetImage('assets/google.png'))),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Container(
                        child: Text(
                          "Syeda Anousha",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Row(children: [
                      Text(
                        "Event Name",
                        style: TextStyle(fontSize: 20),
                      ),
                    ]),
                  ),
                  Container(
                    height: 400,
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            image: DecorationImage(
                                image: AssetImage('assets/google.png'))),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Container(
                        child: Text(
                          "Syeda Anousha",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Row(children: [
                      Text(
                        "Event Name",
                        style: TextStyle(fontSize: 20),
                      ),
                    ]),
                  ),
                  Container(
                    height: 400,
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            image: DecorationImage(
                                image: AssetImage('assets/google.png'))),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Container(
                        child: Text(
                          "Syeda Anousha",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Row(children: [
                      Text(
                        "Event Name",
                        style: TextStyle(fontSize: 20),
                      ),
                    ]),
                  ),
                  Container(
                    height: 400,
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
