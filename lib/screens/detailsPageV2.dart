import 'package:eventplaner/constant/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';

import '../Model/eventModelV2.dart';

class DetailScreen extends StatefulWidget {
  final int EventId;
  const DetailScreen({Key? key, required this.EventId}) : super(key: key);
  //const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Event> _eventList = Event.eventList;
    return Scaffold(
      body: Container(
        child: Column(children: [
          Column(
            children: [
              Positioned(
                top: 100,
                left: 20,
                right: 20,
                child: Container(
                  width: size.width * .8,
                  height: size.height * .4,
                  padding: const EdgeInsets.all(20),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        left: 0,
                        child: SizedBox(
                          height: 350,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            height: 300.0,
                            width: size.width,
                            child: AspectRatio(
                                aspectRatio: 1.81,
                                child: Stack(children: [
                                  PageView.builder(
                                    itemCount: _eventList.length,
                                    itemBuilder: ((context, index) =>
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    child: DetailScreen(
                                                        EventId:
                                                            _eventList[index]
                                                                .eventId),
                                                    type: PageTransitionType
                                                        .bottomToTop));
                                          },
                                          child: Image.asset(
                                            _eventList[widget.EventId].imageURL,
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                                  ),
                                ])),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Men's Striped Accent Fleece Sweatpants",
                style: TextStyle(fontSize: 35),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  color: Constants.primaryColor,
                  width: 350,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor:
                          Constants.primaryColor, // Background Color
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Contact us',
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.call)
                      ],
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.only(right: 200),
              child: Text(
                "Event Description",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
          Flexible(
            child: SingleChildScrollView(
              child: Text(
                "ancdeheifhjkfdshjsfdhdfslkfs\nancdeheifhjkfdshjsfdhdfslkfsf\nancdeheifhjkfdshjsfdhdfslkfsf",
                style: TextStyle(fontSize: 30),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
