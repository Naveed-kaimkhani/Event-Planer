import 'package:eventplaner/Model/eventModelV2.dart';
import 'package:eventplaner/screens/detailsPage.dart';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';

import '../Model/demoStuff/demoimages.dart';
import '../constant/constants.dart';
import '../widgets/customizedappBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    List<Event> _eventList = Event.eventList;

    //Plants category
    List<String> _eventTypes = [
      'All',
      'Weddings',
      'Birthdays',
      'Corporate Events',
      'Customized'
    ];

    //Toggle Favorite button
    bool toggleIsFavorated(bool isFavorited) {
      return !isFavorited;
    }

    return Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _eventTypes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Text(
                            _eventTypes[index],
                            style: TextStyle(
                              fontSize: 16.0,
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: 150.0,
                width: size.width,
                child: AspectRatio(
                    aspectRatio: 1.81,
                    child: Stack(children: [
                      PageView.builder(
                        itemCount: demoallImages.length,
                        itemBuilder: ((context, index) => Image.asset(
                              demoallImages[index],
                              fit: BoxFit.cover,
                            )),
                      ),
                    ])),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("Featured",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Constants.primaryColor,
                        fontSize: 25,
                      )),
                ),
              ),
              SizedBox(
                height: size.height * .3,
                child: ListView.builder(
                    itemCount: _eventList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: DetailPage(
                                    EventId: _eventList[index].eventId,
                                  ),
                                  type: PageTransitionType.bottomToTop));
                        },
                        child: Container(
                          width: 200,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                bottom: 50,
                                child: Image.asset(
                                  _eventList[index].imageURL,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 15,
                                left: 0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _eventList[index].category,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      _eventList[index].eventName,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("Top Planners",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Constants.primaryColor,
                        fontSize: 25,
                      )),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: size.height * .5,
                child: ListView.builder(
                    itemCount: _eventList.length,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     PageTransition(
                          //         child: DetailPage(
                          //             EventId: _eventList[index].eventId),
                          //         type: PageTransitionType.bottomToTop));
                        },
                        child: const Text(""),
                      );
                      // EventWidget(index: index, eventList: _eventList));
                    }),
              ),
            ],
          ),
        ));
  }
}
