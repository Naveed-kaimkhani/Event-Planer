import 'package:eventplaner/constant/Utils.dart';
import 'package:eventplaner/constant/constants.dart';
import 'package:eventplaner/services/Firestore_method.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../Model/User_Details.dart';
import '../Model/eventModel.dart';
import '../Provider/UserDetailsProvider.dart';
import '../constant/SlanderClip.dart';
import '../widgets/Containerwidgets.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  List<eventModel>? AllEvents;

  void getData() async {
    List<eventModel> events = await Firestore_method.UserUploadedEvents(
        id: FirebaseAuth.instance.currentUser!.uid);

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Constants.primaryColor,
          elevation: 0,
          title: ListTile(
            // leading: Icon(Icons.arrow_back_ios_new_outlined),
            trailing: Text(
              "Edit",
              style: TextStyle(color: Colors.white),
            ),
          )
          // actions: [
          //   Icon(Icons.arrow_back_ios_new_outlined),
          //   Text("Edit"),
          // ],
          ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: SlandingClipper(),
                  child: Container(
                    height: size.height / 5,
                    color: Constants.primaryColor,
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/anousha.jpeg"),
                      radius: 70,
                    ), //CircleAvatar
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 130.0),
              child: Text(
                "Syeda Anousha",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 8.0),
              child: Text(
                "About",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0, left: 8.0, right: 5.0),
              child: Container(
                // color: Colors.black,
                height: size.height / 7,
                width: size.width,
                child: Text(
                  "Syeda Anousha Syeda Anousha Syeda Anousha Syeda Anousha FerozSyeda Anousha Syeda AnoushaSyeda AnoushaSyeda AnoushaSyeda AnoushaSyeda AnoushaSyeda AnoushaSyeda Anousha",
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 8.0),
              child: Text(
                "Reviews",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0, left: 8.0, right: 5.0),
              child: Container(
                // color: Colors.black,
                height: size.height / 7,
                width: size.width,
                child: Text(
                  "Syeda Anousha Syeda Anousha Syeda Anousha Syeda Anousha FerozSyeda Anousha Syeda AnoushaSyeda AnoushaSyeda AnoushaSyeda AnoushaSyeda AnoushaSyeda AnoushaSyeda Anousha",
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 8.0),
              child: Text(
                "Email",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0, left: 8.0, right: 5.0),
              child: Container(
                // color: Colors.black,
                height: size.height / 7,
                width: size.width,
                child: Text(
                  "anoushazaidi432@gmail.com",
                  //maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0, left: 8.0),
              child: Text(
                "Phone:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0, left: 8.0, right: 5.0),
              child: Container(
                // color: Colors.black,
                height: size.height / 7,
                width: size.width,
                child: Text(
                  "03103869050",
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 10.0, left: 8.0),
            //   child: Row(
            //     children: [
            //       Text(
            //         "Events Covered",
            //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //       ),
            //       SizedBox(
            //         width: 190,
            //       ),
            //       Text(
            //         "See all",
            //         style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            //       ),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 6.0, left: 8.0, right: 5.0),
            //   child: Container(
            //     height: 340,
            //     child: GridView(
            //       scrollDirection: Axis.horizontal,
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //           crossAxisCount: 1, mainAxisSpacing: 10.0),
            //       children: <Widget>[
            //            allImagesContainer(
            //       context,
            //       Image(image: AssetImage("assets/w4.jpg")),
            //       "Blue themed birhday party",
            //       "package:4000Rs",
            //       "This event is xys",
            //       ),
            //   // allImagesContainer(
            //   //     Image(image: AssetImage("assets/s3.jpeg")), "", ""),
            //   allImagesContainer(
            //       context,
            //       Image(image: AssetImage("assets/b5.jpg")),
            //       "Blue themed birhday party",
            //       "package:4000Rs",   "This event is xys",),
            //   allImagesContainer(
            //       context,
            //       Image(image: AssetImage("assets/bs3.jpg")),
            //       "Blue themed birhday party",
            //       "package:4000Rs",   "This event is xys",),
            //   allImagesContainer(
            //       context,
            //       Image(image: AssetImage("assets/w4.jpg")),
            //       "Blue themed birhday party",
            //       "package:4000Rs",   "This event is xys",),

            //       ],
            //     ),
            //   ),
            // ),
            // UserProfileListTile(
            //   text: "Uploaded Events",
            //   func: () {},
            // ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContactButtons(
                    contact: "Call",
                    func: () {
                      Utils.MakeCall(phoneNo: '031032323');
                    },
                  ),
                  // Text("Message"),
                  ContactButtons(
                    contact: "Text",
                    func: () {
                      Utils.message(phoneNo: '031032323');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ContactButtons extends StatelessWidget {
  String? contact;
  Function()? func;
  ContactButtons({
    Key? key,
    required this.contact,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Constants.primaryColor,
      ),
      child: GestureDetector(
          onTap: func,
          child: Center(
              child: Text(
            contact!,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ))),
    );
  }
}
