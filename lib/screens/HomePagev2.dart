import 'package:eventplaner/main.dart';
import 'package:eventplaner/rootwidget.dart';
import 'package:eventplaner/widgets/Containerwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../Model/User_Details.dart';
import '../Model/demoStuff/demoimages.dart';
import '../Model/eventModelV2.dart';

import '../Provider/UserDetailsProvider.dart';
import '../constant/constants.dart';

import '../widgets/customizedappBar.dart';

import 'detailsPage.dart';
import 'detailsPageV2.dart';

class HomePagev2 extends StatefulWidget {
  const HomePagev2(
    this.setPageIndex, {
    Key? key,
  }) : super(key: key);

  final Function? setPageIndex;

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

     User_Details? userdetails =
     Provider.of<UserDetailsProvider>(context,listen: false).userDetails;
     print("first name ${userdetails!.firstName}");
     print( "last name ${userdetails.lastName}");

    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    List<Event> _eventList = Event.eventList;

    //Plants category
    List<String> _eventTypes = ['All', 'Weddings', 'Birthdays', 'Others'];
    //Toggle Favorite button
    bool toggleIsFavorated(bool isFavorited) {
      return !isFavorited;
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Container(
          height: 250,
          color: Constants.primaryColor,
          child: Column(children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 135),
                width: 350,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.black.withOpacity(.6),
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
                      color: Colors.black.withOpacity(.6),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 50,
              child:
                  // Expanded(
                  //   child: Padding(
                  //     padding: EdgeInsets.symmetric(horizontal: 2),
                  //     child: GridView.builder(
                  //       scrollDirection: Axis.horizontal,
                  //       itemCount: demoallImages.length,
                  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //         crossAxisCount: 1,
                  //         mainAxisExtent: 500,
                  //         crossAxisSpacing: 2,
                  //         childAspectRatio: 1.65,
                  //       ),
                  //       itemBuilder: ((context, index) => Image.asset(
                  //             demoallImages[index],
                  //             fit: BoxFit.fill,
                  //           )),
                  //     ),
                  //   ),
                  // ),
                  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _eventTypes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
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
                            },
                            child: Text(
                              _eventTypes[index],
                              style: TextStyle(
                                  wordSpacing: 50,
                                  fontSize: 22.0,
                                  // fontWeight: selectedIndex == index
                                  //     ? FontWeight.bold
                                  //     : FontWeight.bold,
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.white),
                            ),
                          ),
                        );
                      }),
            ),
          ]),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          child: Row(children: [
            Text(
              "  Top Designs",
              style: TextStyle(
                  color: Constants.primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
          ]),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 340,
          child: GridView(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, mainAxisSpacing: 10.0),
            children: <Widget>[
              allImagesContainer(
                  context,
                  Image(image: AssetImage("assets/w4.jpg")),
                  "Blue themed birhday party",
                  "package:4000Rs"),
              // allImagesContainer(
              //     Image(image: AssetImage("assets/s3.jpeg")), "", ""),
              allImagesContainer(
                  context,
                  Image(image: AssetImage("assets/b5.jpg")),
                  "Blue themed birhday party",
                  "package:4000Rs"),
              allImagesContainer(
                  context,
                  Image(image: AssetImage("assets/bs3.jpg")),
                  "Blue themed birhday party",
                  "package:4000Rs"),
              allImagesContainer(
                  context,
                  Image(image: AssetImage("assets/w4.jpg")),
                  "Blue themed birhday party",
                  "package:4000Rs"),
              // allImagesContainer(
              //     Image(image: AssetImage("assets/s3.jpeg")), "", ""),
              // allImagesContainer(Image(image: AssetImage("assets/b5.jpg")),
              //     "Blue themed birhday party", "package:4000Rs"),
              // allImagesContainer(Image(image: AssetImage("assets/bs3.jpg")),
              //     "Blue themed birhday party", "package:4000Rs"),
            ],
          ),
        ),
        Container(
          child: Row(children: [
            Text(
              "  Top Wedding picks",
              style: TextStyle(
                  color: Constants.primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
          ]),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 340,
          child: GridView(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, mainAxisSpacing: 10.0),
            children: <Widget>[
              allImagesContainer(
                  context,
                  Image(image: AssetImage("assets/w4.jpg")),
                  "Blue themed birhday party",
                  "package:4000Rs"),
              allImagesContainer(
                  context,
                  Image(image: AssetImage("assets/b5.jpg")),
                  "Blue themed birhday party",
                  "package:4000Rs"),
              allImagesContainer(
                  context,
                  Image(image: AssetImage("assets/bs3.jpg")),
                  "Blue themed birhday party",
                  "package:4000Rs"),
              allImagesContainer(
                  context,
                  Image(image: AssetImage("assets/w4.jpg")),
                  "Blue themed birhday party",
                  "package:4000Rs"),
              allImagesContainer(
                  context,
                  Image(image: AssetImage("assets/b5.jpg")),
                  "Blue themed birhday party",
                  "package:4000Rs"),
              allImagesContainer(
                  context,
                  Image(image: AssetImage("assets/bs3.jpg")),
                  "Blue themed birhday party",
                  "package:4000Rs"),
            ],
          ),
        ),
        Container(
          child: Row(children: [
            Text(
              "  Top Birthday Picks",
              style: TextStyle(
                  color: Constants.primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
          ]),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 340,
          child: GridView(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, mainAxisSpacing: 10.0),
            children: <Widget>[
              allImagesContainer(
                  context,
                  Image(image: AssetImage("assets/w4.jpg")),
                  "Blue themed birhday party",
                  "package:4000Rs"),
              allImagesContainer(
                  context,
                  Image(image: AssetImage("assets/b5.jpg")),
                  "Blue themed birhday party",
                  "package:4000Rs"),
              allImagesContainer(
                  context,
                  Image(image: AssetImage("assets/bs3.jpg")),
                  "Blue themed birhday party",
                  "package:4000Rs"),
              allImagesContainer(
                  context,
                  Image(image: AssetImage("assets/w4.jpg")),
                  "Blue themed birhday party",
                  "package:4000Rs"),
              allImagesContainer(
                  context,
                  Image(image: AssetImage("assets/b5.jpg")),
                  "Blue themed birhday party",
                  "package:4000Rs"),
              allImagesContainer(
                  context,
                  Image(image: AssetImage("assets/bs3.jpg")),
                  "Blue themed birhday party",
                  "package:4000Rs"),
            ],
          ),
        ),
        Container(
          child: Row(children: [
            Text(
              "  Others",
              style: TextStyle(
                  color: Constants.primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
          ]),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 340,
          child: GridView(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, mainAxisSpacing: 10.0),
            children: <Widget>[
              allImagesContainer(
                  context,
                  Image(image: AssetImage("assets/w4.jpg")),
                  "Blue themed birhday party",
                  "package:4000Rs"),
              allImagesContainer(
                  context,
                  Image(image: AssetImage("assets/b5.jpg")),
                  "Blue themed birhday party",
                  "package:4000Rs"),
              allImagesContainer(
                  context,
                  Image(image: AssetImage("assets/bs3.jpg")),
                  "Blue themed birhday party",
                  "package:4000Rs"),
              allImagesContainer(
                  context,
                  Image(image: AssetImage("assets/w4.jpg")),
                  "Blue themed birhday party",
                  "package:4000Rs"),
              allImagesContainer(
                  context,
                  Image(image: AssetImage("assets/b5.jpg")),
                  "Blue themed birhday party",
                  "package:4000Rs"),
              allImagesContainer(
                  context,
                  Image(image: AssetImage("assets/bs3.jpg")),
                  "Blue themed birhday party",
                  "package:4000Rs"),
            ],
          ),
        ),
        // Container(
        //   height: 100,
        //   width: 500,
        //   decoration: BoxDecoration(color: Constants.primaryColor),
        //   child: Row(children: [
        //     Text("",
        //         style: TextStyle(
        //             color: Constants.primaryColor,
        //             fontSize: 22,
        //             fontWeight: FontWeight.w500))
        //   ]),
        // ),
      ]),
    ));
  }
}
