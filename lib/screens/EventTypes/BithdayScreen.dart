import 'package:eventplaner/main.dart';
import 'package:eventplaner/rootwidget.dart';
import 'package:eventplaner/widgets/Containerwidgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../Model/eventModelV2.dart';
import '../../constant/constants.dart';

class BirthdaysPage extends StatefulWidget {
  BirthdaysPage({Key? key}) : super(key: key);

  @override
  State<BirthdaysPage> createState() => _BirthdaysPageState();
}

class _BirthdaysPageState extends State<BirthdaysPage> {
  @override
  @override
  Widget build(BuildContext context) {
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
        appBar: AppBar(
          backgroundColor: Constants.primaryColor,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              // color: Constants.primaryColor,
              child: Column(children: [
                Container(
                  width: 500,
                  child: Text("      Birthdays",
                      style: GoogleFonts.pacifico(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 50,
                          letterSpacing: 1.05,
                          color: Color(0xff741b47),
                        ),
                      )),
                ),

                // Center(
                //   child: Container(
                //     margin: EdgeInsets.only(top: 135),
                //     width: 350,
                //     child: Row(
                //       // crossAxisAlignment: CrossAxisAlignment.start,
                //       // mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Icon(
                //           Icons.search,
                //           color: Colors.black.withOpacity(.6),
                //         ),
                //         const Expanded(
                //             child: TextField(
                //           showCursor: false,
                //           decoration: InputDecoration(
                //             hintText: 'Search',
                //             border: InputBorder.none,
                //             focusedBorder: InputBorder.none,
                //           ),
                //         )),
                //         Icon(
                //           Icons.mic,
                //           color: Colors.black.withOpacity(.6),
                //         ),
                //       ],
                //     ),
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(15),
                //     ),
                //   ),
                // ),
                // Container(
                //   margin: EdgeInsets.only(top: 55),
                //   height: 40,
                //   child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemCount: _eventTypes.length,
                //       itemBuilder: (BuildContext context, int index) {
                //         return Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: InkWell(
                //             onTap: () {
                //               if (_eventTypes[index] == _eventTypes[0]) {
                //                 this.widget.setPageIndex!(0);
                //               }
                //               if (_eventTypes[index] == _eventTypes[1]) {
                //                 this.widget.setPageIndex!(1);
                //               }
                //               if (_eventTypes[index] == _eventTypes[2]) {
                //                 this.widget.setPageIndex!(2);
                //               }
                //               if (_eventTypes[index] == _eventTypes[3]) {
                //                 this.widget.setPageIndex!(3);
                //               }
                //             },
                //             child: Text(
                //               _eventTypes[index],
                //               style: TextStyle(
                //                   fontSize: 18.0,
                //                   // fontWeight: selectedIndex == index
                //                   //     ? FontWeight.bold
                //                   //     : FontWeight.bold,
                //                   color: selectedIndex == index
                //                       ? Colors.grey
                //                       : Colors.white),
                //             ),
                //           ),
                //         );
                //       }),
                // ),
              ]),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: Row(children: [
                Text("  Exclusives",
                    style: GoogleFonts.pacifico(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 40,
                        letterSpacing: 1.05,
                        color: Color(0xff741b47),
                      ),
                    )),
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
                      Image(image: AssetImage("assets/birtdhayfinal4.jpg")),
                      Image(image: AssetImage("assets/birthdayfinal41.jpg")),
                      Image(image: AssetImage("assets/w4.jpg")),
                      "Micky Mouse themed Birthday Party",
                      "package:40,000 Rs only",
                      "This is micky mouse themed birthday party. Organized for first birthday",
                      Image(image: AssetImage("assets/anousha.jpeg")),
                      "Syeda Anousha"),
                  // allImagesContainer(
                  //     Image(image: AssetImage("assets/s3.jpeg")), "", ""),
                  allImagesContainer(
                      context,
                      Image(image: AssetImage("assets/birthfayfinal6.jpg")),
                      Image(image: AssetImage("assets/w4.jpg")),
                      Image(image: AssetImage("assets/w4.jpg")),
                      "Blue themed birhday party",
                      "package:4000Rs",
                      "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
                      Image(image: AssetImage("assets/account.png")),
                      "Username"),
                  allImagesContainer(
                      context,
                      Image(image: AssetImage("assets/birthf.jpg")),
                      Image(image: AssetImage("assets/w4.jpg")),
                      Image(image: AssetImage("assets/w4.jpg")),
                      "Blue themed birhday party",
                      "package:4000Rs",
                      "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
                      Image(image: AssetImage("assets/account.png")),
                      "Syeda Anousha"),
                  // allImagesContainer(
                  //     context,
                  //     Image(image: AssetImage("assets/w4.jpg")),
                  //     Image(image: AssetImage("assets/w4.jpg")),
                  //     Image(image: AssetImage("assets/w4.jpg")),
                  //     "Blue themed birhday party",
                  //     "package:4000Rs",
                  //     "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
                  //     Image(image: AssetImage("assets/account.png")),
                  //     "Username"),
                ],
              ),
            ),
            // Container(
            //   child: Row(children: [
            //     Text(
            //       "  Themes ",
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
            //           Image(image: AssetImage("assets/w4.jpg")),
            //           Image(image: AssetImage("assets/w4.jpg")),
            //           Image(image: AssetImage("assets/w4.jpg")),
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
            Container(
              child: Row(children: [
                Text("  All Designs",
                    style: GoogleFonts.pacifico(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 40,
                        letterSpacing: 1.05,
                        color: Color(0xff741b47),
                      ),
                    )),
              ]),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 540,
              child: GridView(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, mainAxisSpacing: 10.0),
                children: <Widget>[
                  allImagesContainer(
                      context,
                      Image(image: AssetImage("assets/birthdayfinal5.jpg")),
                      Image(image: AssetImage("assets/birthdayfinal4.1.jpg")),
                      Image(image: AssetImage("assets/birthfayfinalj.jpg")),
                      "Blue themed birhday party",
                      "package:4000Rs",
                      "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
                      Image(image: AssetImage("assets/account.png")),
                      "Username"),
                  // allImagesContainer(
                  //     Image(image: AssetImage("assets/s3.jpeg")), "", ""),
                  allImagesContainer(
                      context,
                      Image(image: AssetImage("assets/birtdhayfinal3.jpg")),
                      Image(image: AssetImage("assets/w4.jpg")),
                      Image(image: AssetImage("assets/w4.jpg")),
                      "Blue themed birhday party",
                      "package:4000Rs",
                      "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
                      Image(image: AssetImage("assets/account.png")),
                      "Username"),
                  allImagesContainer(
                      context,
                      Image(image: AssetImage("assets/birthdayfinal2.jpg")),
                      Image(image: AssetImage("assets/w4.jpg")),
                      Image(image: AssetImage("assets/w4.jpg")),
                      "Blue themed birhday party",
                      "package:4000Rs",
                      "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
                      Image(image: AssetImage("assets/account.png")),
                      "Username"),
                  allImagesContainer(
                      context,
                      Image(image: AssetImage("assets/birthdayfinal5.jpg")),
                      Image(image: AssetImage("assets/w4.jpg")),
                      Image(image: AssetImage("assets/w4.jpg")),
                      "Blue themed birhday party",
                      "package:4000Rs",
                      "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
                      Image(image: AssetImage("assets/account.png")),
                      "Username"),
                ],
              ),
            ),
          ]),
        ));
  }
}
