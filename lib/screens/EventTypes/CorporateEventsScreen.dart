import 'package:eventplaner/Model/eventModelV2.dart';
import 'package:eventplaner/screens/detailsPage.dart';

import 'package:eventplaner/Model/eventModel.dart';
import 'package:eventplaner/Model/sellermodel.dart';
import 'package:eventplaner/screens/eventtype.dart';

import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';

import '../../Model/demoStuff/demoimages.dart';
import '../../constant/constants.dart';
import '../../services/Firestore_method.dart';
import '../../widgets/customizedappBar.dart';


class CorporateEventsPage extends StatefulWidget {
  final Function? setPageIndex;
  const CorporateEventsPage(
    this.setPageIndex, {
    Key? key,
  }) : super(key: key);

  @override
  State<CorporateEventsPage> createState() => _CorporateEventsPageState();
}

class _CorporateEventsPageState extends State<CorporateEventsPage> {
  List<eventModel>? AllEvents;

  void getData() async {
    List<eventModel> events = await Firestore_method.getDataFromDb();

    setState(() {
      AllEvents = events;
    });
  }

  @override
  void initState() {
    getData();
    //Firestore_method().getNameAndAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        appBar: buildAppBar("Corporate Events"),
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
              // Expanded(
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 2),
              //     child: GridView.builder(
              //       itemCount: demoallImages.length,
              //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //         mainAxisSpacing: 20,
              //         crossAxisSpacing: 2,
              //         childAspectRatio: 1.65,
              //       ),
              //       itemBuilder: ((context, index) => Image.asset(
              //             demoallImages[index],
              //             fit: BoxFit.cover,
              //           )),
              //     ),
              //   ),
              // ),
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 12),
              //   height: 150.0,
              //   width: size.width,
              //   child: AspectRatio(
              //       aspectRatio: 1.81,
              //       child: Image.asset(
              //         'assets/undraw_welcome_cats_thqn.png',
              //       )),
              // ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Text("Top PLanners",
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
                    itemCount: profiles.length,
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
                          width: 150,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                bottom: 50,
                                child: Image.asset(
                                  profiles[index],
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
                                      "Name of planner",
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
                  padding: const EdgeInsets.all(4),
                  child: Text("Featured",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Constants.primaryColor,
                        fontSize: 25,
                      )),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 14,
                        width: 14,
                        decoration: BoxDecoration(
                          color: Color(0xB5741b47),
                          borderRadius: BorderRadius.all(Radius.circular(60)),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("NaveedKaimkhani",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                  SizedBox(
                    height: 5,
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
                  Text(
                    "Ayans 5th Birhtday Party",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff741b47),
                        fontSize: 20),
                  ),
                  Text(
                    "Beautiful and Delicate Indoor Birhday",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xB5741b47),
                        fontSize: 14),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 14,
                        width: 14,
                        decoration: BoxDecoration(
                          color: Color(0xB5741b47),
                          borderRadius: BorderRadius.all(Radius.circular(60)),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("NaveedKaimkhani",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                  SizedBox(
                    height: 5,
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
                  Text(
                    "Ayans 5th Birhtday Party",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff741b47),
                        fontSize: 20),
                  ),
                  Text(
                    "Beautiful and Delicate Indoor Birhday",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xB5741b47),
                        fontSize: 14),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Card(
                    elevation: 30,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          height: 14,
                          width: 14,
                          decoration: BoxDecoration(
                            color: Color(0xB5741b47),
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("NaveedKaimkhani",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
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
                  Text(
                    "Ayans 5th Birhtday Party",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff741b47),
                        fontSize: 20),
                  ),
                  Text(
                    "Beautiful and Delicate Indoor Birhday",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xB5741b47),
                        fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
