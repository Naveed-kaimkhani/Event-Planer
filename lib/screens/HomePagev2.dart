import 'package:eventplaner/main.dart';
import 'package:eventplaner/rootwidget.dart';
import 'package:eventplaner/widgets/Containerwidgets.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../Model/demoStuff/demoimages.dart';
import '../Model/eventModelV2.dart';

import '../constant/constants.dart';

import '../widgets/customizedappBar.dart';

import 'detailsPage.dart';
import 'detailsPageV2.dart';

class HomePagev2 extends StatefulWidget {
  final Function? setPageIndex;
  const HomePagev2(
    this.setPageIndex, {
    Key? key,
  }) : super(key: key);

  @override
  State<HomePagev2> createState() => _HomePagev2State();
}

class _HomePagev2State extends State<HomePagev2> {
  //List<eventModel>? AllEvents;

  // void getData() async {
  //   List<eventModel> events =
  //       await Firestore_method.getDataFromDb();

  //   //List<eventModel> events = await Firestore_method.getDataFromDb();

  //   setState(() {
  //     AllEvents = events;
  //   });
  // }

  @override
  // void initState() {
  //   getData();
  //  // Firestore_method().getUserDetails();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    //User_Details? userdetails =

    //  Provider.of<UserDetailsProvider>(context,listen: false).userDetails;
    //  print("first name ${userdetails!.firstName}");
    //  print( "last name ${userdetails.lastName}");

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
                    margin: EdgeInsets.only(left: 330, top: 40),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/account.png')),
                      //color: Constants.primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 280),
                            child: Text(
                              "Explore",
                              style: TextStyle(
                                  fontSize: 30, color: Constants.primaryColor),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Hi Syeda ! we are here to make your event remarkable",
                            style: TextStyle(
                                fontSize: 18, color: Constants.primaryColor),
                          ),
                        ],
                      )),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: 400,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search,
                                color: Constants.primaryColor.withOpacity(.6),
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
                                color: Constants.primaryColor.withOpacity(.6),
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
                                  fontSize: 20.0,
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
                      ProfileContainer(),
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 300.0,
                    width: size.width,
                    child: AspectRatio(
                        aspectRatio: 1.81,
                        child: Stack(children: [
                          PageView.builder(
                            itemCount: demoallImages.length,
                            itemBuilder: ((context, index) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            child: DetailScreen(
                                                EventId:
                                                    _eventList[index].eventId),
                                            type: PageTransitionType
                                                .bottomToTop));
                                  },
                                  child: Image.asset(
                                    demoallImages[index],
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ),
                        ])),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      ProfileContainer(),
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
                  Imagecontainer(Image(
                    image: AssetImage(
                      "assets/b6.jpg",
                    ),
                    fit: BoxFit.fill,
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      ProfileContainer(),
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
                  Imagecontainer(Image(
                    image: AssetImage(
                      "assets/w5.jpg",
                    ),
                    fit: BoxFit.fill,
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
