import 'package:eventplaner/services/Firestore_method.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../Model/eventModel.dart';
import '../widgets/Containerwidgets.dart';
import 'EventTypes/BithdayScreen.dart';

class TotalEvents extends StatefulWidget {
  const TotalEvents({Key? key}) : super(key: key);

  @override
  State<TotalEvents> createState() => _TotalEventsState();
}

class _TotalEventsState extends State<TotalEvents> {
  List<eventModel>? AllEvents;

  void getData() async {
    List<eventModel> events =
        await Firestore_method.UserUploadedEvents(id: user?.uid);

    //List<eventModel> events = await Firestore_method.getDataFromDb();

    setState(() {
      AllEvents = events;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: Container(
                child: Text("All Your Events",
                    style: GoogleFonts.pacifico(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                        letterSpacing: 1.05,
                        color: Color(0xff741b47),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text("   All Your Uploaded Events will appear here",
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    letterSpacing: 1.05,
                    color: Color(0xff741b47),
                  ),
                )),
            Container(
              height: 500,
              child:     SizedBox(
                height:300,
                child: ListView.builder(
                    itemCount: AllEvents?.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        // onTap: () {
                        //   Navigator.push(
                        //       context,
                        //       PageTransition(
                        //           child: DetailPage(
                        //             EventId: _eventList[index].eventId,
                        //           ),
                        //           type: PageTransitionType.bottomToTop));
                        // },
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
                                  AllEvents![index].url1,
                                  fit: BoxFit.cover,
                                ),
                              ),
                                 Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                bottom: 50,
                                child: Image.asset(
                                  AllEvents![index].url1,
                                  fit: BoxFit.cover,
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
              // GridView(
              //   scrollDirection: Axis.vertical,
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 1, mainAxisSpacing: 5.0),
              //   children: <Widget>[

              //     allImagesContainer(
              //         context,
              //         Image(image: AssetImage("assets/birtdhayfinal4.jpg")),
              //         Image(image: AssetImage("assets/birthdayfinal41.jpg")),
              //         Image(image: AssetImage("assets/w4.jpg")),
              //         "Micky Mouse themed Birthday Party",
              //         "package:40,000 Rs only",
              //         "This is micky mouse themed birthday party. Organized for first birthday",
              //         Image(image: AssetImage("assets/anousha.jpeg")),
              //         "Syeda Anousha"),
              //     // allImagesContainer(
              //     //     Image(image: AssetImage("assets/s3.jpeg")), "", ""),
              //     // allImagesContainer(
              //     //     context,
              //     //     Image(image: AssetImage("assets/birthfayfinal6.jpg")),
              //     //     Image(image: AssetImage("assets/w4.jpg")),
              //     //     Image(image: AssetImage("assets/w4.jpg")),
              //     //     "Blue themed birhday party",
              //     //     "package:4000Rs",
              //     //     "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
              //     //     Image(image: AssetImage("assets/account.png")),
              //     //     "Username"),
              //     // allImagesContainer(
              //     //     context,
              //     //     Image(image: AssetImage("assets/birthf.jpg")),
              //     //     Image(image: AssetImage("assets/w4.jpg")),
              //     //     Image(image: AssetImage("assets/w4.jpg")),
              //     //     "Blue themed birhday party",
              //     //     "package:4000Rs",
              //     //     "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
              //     //     Image(image: AssetImage("assets/account.png")),
              //     //     "Syeda Anousha"),
              //     // // allImagesContainer(
              //     // //     context,
              //     // //     Image(image: AssetImage("assets/w4.jpg")),
              //     // //     Image(image: AssetImage("assets/w4.jpg")),
              //     // //     Image(image: AssetImage("assets/w4.jpg")),
              //     // //     "Blue themed birhday party",
              //     // //     "package:4000Rs",
              //     // //     "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
              //     // //     Image(image: AssetImage("assets/account.png")),
              //     // //     "Username"),
              //   ],
              // ),
            )
          ]),
        ),
      ),
    );
  }
}

class NoEvnts extends StatefulWidget {
  const NoEvnts({Key? key}) : super(key: key);

  @override
  State<NoEvnts> createState() => _NoEvntsState();
}

class _NoEvntsState extends State<NoEvnts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: Container(
                child: Text("All Your Events",
                    style: GoogleFonts.pacifico(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                        letterSpacing: 1.05,
                        color: Color(0xff741b47),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text("   All Your Uploaded Events will appear here",
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    letterSpacing: 1.05,
                    color: Color(0xff741b47),
                  ),
                )),
            Container(
              height: 500,
              child: GridView(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, mainAxisSpacing: 5.0),
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/undraw_Not_found_re_44w9.png"),
                  ),
                  Text("Nothing to show"),
                  // allImagesContainer(
                  //     context,
                  //     Image(image: AssetImage("assets/birtdhayfinal4.jpg")),
                  //     Image(image: AssetImage("assets/birthdayfinal41.jpg")),
                  //     Image(image: AssetImage("assets/w4.jpg")),
                  //     "Micky Mouse themed Birthday Party",
                  //     "package:40,000 Rs only",
                  //     "This is micky mouse themed birthday party. Organized for first birthday",
                  //     Image(image: AssetImage("assets/anousha.jpeg")),
                  //     "Syeda Anousha"),
                  // // allImagesContainer(
                  // //     Image(image: AssetImage("assets/s3.jpeg")), "", ""),
                  // allImagesContainer(
                  //     context,
                  //     Image(image: AssetImage("assets/birthfayfinal6.jpg")),
                  //     Image(image: AssetImage("assets/w4.jpg")),
                  //     Image(image: AssetImage("assets/w4.jpg")),
                  //     "Blue themed birhday party",
                  //     "package:4000Rs",
                  //     "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
                  //     Image(image: AssetImage("assets/account.png")),
                  //     "Username"),
                  // allImagesContainer(
                  //     context,
                  //     Image(image: AssetImage("assets/birthf.jpg")),
                  //     Image(image: AssetImage("assets/w4.jpg")),
                  //     Image(image: AssetImage("assets/w4.jpg")),
                  //     "Blue themed birhday party",
                  //     "package:4000Rs",
                  //     "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
                  //     Image(image: AssetImage("assets/account.png")),
                  //     "Syeda Anousha"),
                  // // allImagesContainer(
                  // //     context,
                  // //     Image(image: AssetImage("assets/w4.jpg")),
                  // //     Image(image: AssetImage("assets/w4.jpg")),
                  // //     Image(image: AssetImage("assets/w4.jpg")),
                  // //     "Blue themed birhday party",
                  // //     "package:4000Rs",
                  // //     "This event is xys,This event is xys,This event is xys,This event is xys,This event is xys",
                  // //     Image(image: AssetImage("assets/account.png")),
                  // //     "Username"),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
