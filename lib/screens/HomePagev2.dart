import 'package:eventplaner/main.dart';
import 'package:eventplaner/rootwidget.dart';
import 'package:eventplaner/screens/EventTypes/BithdayScreen.dart';
import 'package:eventplaner/screens/EventTypes/weddings.dart';
import 'package:eventplaner/widgets/Containerwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
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
  const HomePagev2({
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
    //  User_Details? userdetails =
    //  Provider.of<UserDetailsProvider>(context,listen: false).userDetails;
    //  print("first name ${userdetails!.firstName}");
    //  print( "last name ${userdetails.lastName}");

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
          height: 200,
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
          ]),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: Text("Categories",
              style: GoogleFonts.pacifico(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 50,
                  letterSpacing: 1.05,
                  color: Color(0xff741b47),
                ),
              )
              // style: GoogleFonts.lato(
              //   textStyle: const TextStyle(
              //     fontWeight: FontWeight.w700,
              //     fontSize: 23,
              //     letterSpacing: 1.05,
              //     color: Color(0xFF512D8F),
              //   ),
              // ),
              ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          child: Column(
            children: <Widget>[
              Text("Birthdays",
                  style: GoogleFonts.pacifico(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      letterSpacing: 1.05,
                      color: Color(0xff741b47),
                    ),
                  )),
              Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BirthdaysPage()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: GridView(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1, mainAxisSpacing: 10.0),
                      children: <Widget>[
                        Container(
                          height: 150,
                          width: 400,
                          child: Image(
                            image: AssetImage("assets/birthday2.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 400,
                          child: Image(
                            image: AssetImage("assets/birthf.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 400,
                          child: Image(
                            image: AssetImage("assets/b5 (copy).jpg"),
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                    // color: Colors.amber,
                    height: 400,
                    width: 500,
                  ),
                ),
              ),
              Text("Weddings",
                  style: GoogleFonts.pacifico(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      letterSpacing: 1.05,
                      color: Color(0xff741b47),
                    ),
                  )),
              Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WeddingsPage()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: GridView(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1, mainAxisSpacing: 10.0),
                      children: <Widget>[
                        Container(
                          height: 150,
                          width: 400,
                          child: Image(
                            image: AssetImage("assets/w4.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 400,
                          child: Image(
                            image: AssetImage("assets/birthf.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 400,
                          child: Image(
                            image: AssetImage("assets/b5 (copy).jpg"),
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                    // color: Colors.amber,
                    height: 400,
                    width: 500,
                  ),
                ),
              ),
              Text("Bridal Shower",
                  style: GoogleFonts.pacifico(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      letterSpacing: 1.05,
                      color: Color(0xff741b47),
                    ),
                  )),
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: GridView(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, mainAxisSpacing: 10.0),
                    children: <Widget>[
                      Container(
                        height: 150,
                        width: 400,
                        child: Image(
                          image: AssetImage("assets/bride.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 150,
                        width: 400,
                        child: Image(
                          image: AssetImage("assets/birthf.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 150,
                        width: 400,
                        child: Image(
                          image: AssetImage("assets/b5 (copy).jpg"),
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                  // color: Colors.amber,
                  height: 400,
                  width: 500,
                ),
              ),
              Text("Baby Shower",
                  style: GoogleFonts.pacifico(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      letterSpacing: 1.05,
                      color: Color(0xff741b47),
                    ),
                  )),
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: GridView(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, mainAxisSpacing: 10.0),
                    children: <Widget>[
                      Container(
                        height: 150,
                        width: 400,
                        child: Image(
                          image: AssetImage("assets/babyshower1.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 150,
                        width: 400,
                        child: Image(
                          image: AssetImage("assets/birthf.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 150,
                        width: 400,
                        child: Image(
                          image: AssetImage("assets/b5 (copy).jpg"),
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                  // color: Colors.amber,
                  height: 400,
                  width: 500,
                ),
              ),
              // Container(
              //   color: Colors.black,
              //   height: 300,
              //   width: 500,
              // ),
              // Text(
              //   "Graduation Party",
              //   style: TextStyle(fontSize: 28),
              // ),
              // Container(
              //   color: Colors.black,
              //   height: 300,
              //   width: 500,
              // ),
              // Text(
              //   "Official Events",
              //   style: TextStyle(fontSize: 28),
              // ),
            ],
          ),
        ),
        // Container(
        //   color: Colors.white,
        //   margin: EdgeInsets.only(top: 10),
        //   height: 400,
        //   child: ListView.builder(
        //       scrollDirection: Axis.vertical,
        //       itemCount: _eventTypes.length,
        //       itemBuilder: (BuildContext context, int index) {
        //         return Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: InkWell(
        //               onTap: () {
        //                 if (_eventTypes[index] == _eventTypes[0]) {
        //                   this.widget.setPageIndex!(0);
        //                 }
        //                 if (_eventTypes[index] == _eventTypes[1]) {
        //                   this.widget.setPageIndex!(1);
        //                 }
        //                 if (_eventTypes[index] == _eventTypes[2]) {
        //                   this.widget.setPageIndex!(2);
        //                 }
        //                 if (_eventTypes[index] == _eventTypes[3]) {
        //                   this.widget.setPageIndex!(3);
        //                 }
        //               },
        //               child: Center(
        //                 child: Container(
        //                   child: Text(
        //                     _eventTypes[index],
        //                     style: TextStyle(
        //                         wordSpacing: 50,
        //                         fontSize: 22.0,
        //                         // fontWeight: selectedIndex == index
        //                         //     ? FontWeight.bold
        //                         //     : FontWeight.bold,
        //                         color: selectedIndex == index
        //                             ? Constants.primaryColor
        //                             : Constants.primaryColor),
        //                   ),
        //                 ),
        //               )),
        //         );
        //       }),
        // ),
        // Container(
        //   child: Row(children: [
        //     Text(
        //       "  Top Desi",
        //       style: TextStyle(
        //           color: Constants.primaryColor,
        //           fontSize: 22,
        //           fontWeight: FontWeight.w500),
        //     ),
        //   ]),
        // ),
        // SizedBox(
        //   height: 15,
        // ),
        // Container(
        //   height: 340,
        //   child: GridView(
        //     scrollDirection: Axis.horizontal,
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 1, mainAxisSpacing: 10.0),
        //     children: <Widget>[
        //       allImagesContainer(
        //           context,
        //           Image(image: AssetImage("assets/b.jpg")),
        //           Image(image: AssetImage("assets/w4.jpg")),
        //           Image(image: AssetImage("assets/w4.jpg")),
        //           "Blue themed birhday party",
        //           "package:4000Rs",
        //           "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
        //           Image(image: AssetImage("assets/account.png")),
        //           "Username"),
        //       allImagesContainer(
        //           context,
        //           Image(image: AssetImage("assets/w4.jpg")),
        //           Image(image: AssetImage("assets/w4.jpg")),
        //           Image(image: AssetImage("assets/w4.jpg")),
        //           "Blue themed birhday party",
        //           "package:4000Rs",
        //           "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
        //           Image(image: AssetImage("assets/account.png")),
        //           "Username"),
        //       allImagesContainer(
        //           context,
        //           Image(image: AssetImage("assets/w4.jpg")),
        //           Image(image: AssetImage("assets/w4.jpg")),
        //           Image(image: AssetImage("assets/w4.jpg")),
        //           "Blue themed birhday party",
        //           "package:4000Rs",
        //           "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
        //           Image(image: AssetImage("assets/account.png")),
        //           "Username"),
        //     ],
        //   ),
        // ),
        // Container(
        //   child: Row(children: [
        //     Text(
        //       "  Top Wedding picks",
        //       style: TextStyle(
        //           color: Constants.primaryColor,
        //           fontSize: 22,
        //           fontWeight: FontWeight.w500),
        //     ),
        //   ]),
        // ),
        // SizedBox(
        //   height: 15,
        // ),
        // Container(
        //   height: 340,
        //   child: GridView(
        //     scrollDirection: Axis.horizontal,
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 1, mainAxisSpacing: 10.0),
        //     children: <Widget>[
        //       allImagesContainer(
        //           context,
        //           Image(image: AssetImage("assets/wed2.jpg")),
        //           Image(image: AssetImage("assets/wedd.jpg")),
        //           Image(image: AssetImage("assets/wedd3.jpg")),
        //           "Blue themed birhday party",
        //           "package:4000Rs",
        //           "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
        //           Image(image: AssetImage("assets/account.png")),
        //           "Username"),
        //       // allImagesContainer(
        //       //     Image(image: AssetImage("assets/s3.jpeg")), "", ""),
        //       allImagesContainer(
        //           context,
        //           Image(image: AssetImage("assets/w4.jpg")),
        //           Image(image: AssetImage("assets/w4.jpg")),
        //           Image(image: AssetImage("assets/w4.jpg")),
        //           "Blue themed birhday party",
        //           "package:4000Rs",
        //           "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
        //           Image(image: AssetImage("assets/account.png")),
        //           "Username"),
        //       allImagesContainer(
        //           context,
        //           Image(image: AssetImage("assets/w3.jpg")),
        //           Image(image: AssetImage("assets/w3.jpg")),
        //           Image(image: AssetImage("assets/w3.jpg")),
        //           "Blue themed birhday party",
        //           "package:4000Rs",
        //           "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
        //           Image(image: AssetImage("assets/account.png")),
        //           "Username"),
        //       allImagesContainer(
        //           context,
        //           Image(image: AssetImage("assets/w1.jpeg")),
        //           Image(image: AssetImage("assets/w1.jpeg")),
        //           Image(image: AssetImage("assets/w1.jpeg")),
        //           "Blue themed birhday party",
        //           "package:4000Rs",
        //           "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
        //           Image(image: AssetImage("assets/account.png")),
        //           "Username"),
        //     ],
        //   ),
        // ),
        // Container(
        //   child: Row(children: [
        //     Text(
        //       "  Top Birthday Picks",
        //       style: TextStyle(
        //           color: Constants.primaryColor,
        //           fontSize: 22,
        //           fontWeight: FontWeight.w500),
        //     ),
        //   ]),
        // ),
        // SizedBox(
        //   height: 15,
        // ),
        // Container(
        //   height: 340,
        //   child: GridView(
        //     scrollDirection: Axis.horizontal,
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 1, mainAxisSpacing: 10.0),
        //     children: <Widget>[
        //       allImagesContainer(
        //           context,
        //           Image(image: AssetImage("assets/b5 (copy).jpg")),
        //           Image(image: AssetImage("assets/b6.jpg")),
        //           Image(image: AssetImage("assets/Ce.jpg")),
        //           "Blue themed birhday party",
        //           "package:4000Rs",
        //           "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
        //           Image(image: AssetImage("assets/account.png")),
        //           "Username"),
        //       // allImagesContainer(
        //       //     Image(image: AssetImage("assets/s3.jpeg")), "", ""),
        //       allImagesContainer(
        //           context,
        //           Image(image: AssetImage("assets/birthday2.jpg")),
        //           Image(image: AssetImage("assets/w4.jpg")),
        //           Image(image: AssetImage("assets/w4.jpg")),
        //           "Blue themed birhday party",
        //           "package:4000Rs",
        //           "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
        //           Image(image: AssetImage("assets/account.png")),
        //           "Username"),
        //       allImagesContainer(
        //           context,
        //           Image(image: AssetImage("assets/birthf.jpg")),
        //           Image(image: AssetImage("assets/w4.jpg")),
        //           Image(image: AssetImage("assets/w4.jpg")),
        //           "Blue themed birhday party",
        //           "package:4000Rs",
        //           "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
        //           Image(image: AssetImage("assets/account.png")),
        //           "Username"),
        //       allImagesContainer(
        //           context,
        //           Image(image: AssetImage("assets/w4.jpg")),
        //           Image(image: AssetImage("assets/w4.jpg")),
        //           Image(image: AssetImage("assets/w4.jpg")),
        //           "Blue themed birhday party",
        //           "package:4000Rs",
        //           "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
        //           Image(image: AssetImage("assets/account.png")),
        //           "Username"),
        //     ],
        //   ),
        // ),
        // Container(
        //   child: Row(children: [
        //     Text(
        //       "  Others",
        //       style: TextStyle(
        //           color: Constants.primaryColor,
        //           fontSize: 22,
        //           fontWeight: FontWeight.w500),
        //     ),
        //   ]),
        // ),
        // SizedBox(
        //   height: 15,
        // ),
        // Container(
        //   height: 340,
        //   child: GridView(
        //     scrollDirection: Axis.horizontal,
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 1, mainAxisSpacing: 10.0),
        //     children: <Widget>[
        //       allImagesContainer(
        //           context,
        //           Image(image: AssetImage("assets/anniversary.jpg")),
        //           Image(image: AssetImage("assets/b6.jpg")),
        //           Image(image: AssetImage("assets/Ce.jpg")),
        //           "Blue themed birhday party",
        //           "package:4000Rs",
        //           "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
        //           Image(image: AssetImage("assets/account.png")),
        //           "Username"),
        //       // allImagesContainer(
        //       //     Image(image: AssetImage("assets/s3.jpeg")), "", ""),
        //       allImagesContainer(
        //           context,
        //           Image(image: AssetImage("assets/bride.jpg")),
        //           Image(image: AssetImage("assets/bridalshower3.jpg")),
        //           Image(image: AssetImage("assets/bri.jpg")),
        //           "Blue themed birhday party",
        //           "package:4000Rs",
        //           "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
        //           Image(image: AssetImage("assets/account.png")),
        //           "Username"),
        //       allImagesContainer(
        //           context,
        //           Image(image: AssetImage("assets/wed2.jpg")),
        //           Image(image: AssetImage("assets/wedd.jpg")),
        //           Image(image: AssetImage("assets/wedd3.jpg")),
        //           "Blue themed birhday party",
        //           "package:4000Rs",
        //           "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
        //           Image(image: AssetImage("assets/account.png")),
        //           "Username"),
        //       allImagesContainer(
        //           context,
        //           Image(image: AssetImage("assets/w4.jpg")),
        //           Image(image: AssetImage("assets/w4.jpg")),
        //           Image(image: AssetImage("assets/w4.jpg")),
        //           "Blue themed birhday party",
        //           "package:4000Rs",
        //           "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
        //           Image(image: AssetImage("assets/account.png")),
        //           "Username"),
        //     ],
        //   ),
        // ),
        // // Container(
        // //   height: 100,
        // //   width: 500,
        // //   decoration: BoxDecoration(color: Constants.primaryColor),
        // //   child: Row(children: [
        // //     Text("",
        // //         style: TextStyle(
        // //             color: Constants.primaryColor,
        // //             fontSize: 22,
        // //             fontWeight: FontWeight.w500))
        // //   ]),
        // // ),
      ]),
    ));
  }
}
