import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../constant/constants.dart';
import '../../widgets/customizedappBar.dart';

class CorporateEventScreen extends StatefulWidget {
  final Function? setPageIndex;
  const CorporateEventScreen(
    this.setPageIndex, {
    Key? key,
  }) : super(key: key);

  @override
  State<CorporateEventScreen> createState() => _CorporateEventScreenState();
}

class _CorporateEventScreenState extends State<CorporateEventScreen> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    List<String> _eventTypes = [
      'All',
      'Weddings',
      'Corporate Events',
      'Birthdays',
    ];
    return Scaffold(
      appBar: buildAppBar("Corporate Screen"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  // Container(
                  //   margin: EdgeInsets.only(left: 300, top: 40),
                  //   height: 50,
                  //   width: 50,
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //         image: AssetImage('assets/google.png')),
                  //     //color: Constants.primaryColor,
                  //     borderRadius: BorderRadius.circular(50),
                  //   ),
                  // ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
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
