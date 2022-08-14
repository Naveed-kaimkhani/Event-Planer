import 'package:eventplaner/Model/sellermodel.dart';
import 'package:eventplaner/screens/eventtype.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../Model/eventModelV2.dart';
import '../constant/constants.dart';
import '../widgets/widgets.dart';
import 'detailsPage.dart';

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
    List<Seller> _sellerList = Seller.sellerList;

    List<String> _eventTypes = [
      'Top Planners',
      'Indoor Events',
      'Outdoor Events',
    ];

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: AppBar(
              backgroundColor: Colors.purple,
            )),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              AppBar(
                title: Text(""),
                backgroundColor: Colors.purple,
              ),
              ListTile(
                //menu item of Drawer
                leading: Icon(Icons.account_box),
                title: Text('Account'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('My Profile'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Account Settings'),
              ),
              ListTile(
                  leading: Icon(Icons.event),
                  title: Text('Event Type'),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const EventType(),
                            type: PageTransitionType.bottomToTop));
                  }),
              SizedBox(
                height: 250,
              ),
              Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  image: new DecorationImage(
                    image: AssetImage("assets/undraw_Mobile_login_re_9ntv.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      width: size.width * .9,
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
                        borderRadius: BorderRadius.circular(20),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: 50.0,
                width: size.width,
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
                                  : FontWeight.w300,
                              color: selectedIndex == index
                                  ? Constants.primaryColor
                                  : Constants.blackColor,
                            ),
                          ),
                        ),
                      );
                    }),
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
                                left: 50,
                                right: 50,
                                top: 50,
                                bottom: 50,
                                child: Image.asset(_sellerList[index].imageURL),
                              ),
                              Positioned(
                                bottom: 15,
                                left: 20,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _sellerList[index].decription,
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      _sellerList[index].sellerName,
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 15,
                                right: 20,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    r'$' + _eventList[index].package.toString(),
                                    style: TextStyle(
                                        color: Constants.primaryColor,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Constants.primaryColor.withOpacity(.8),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
                child: const Text(
                  'Packages',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
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
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: DetailPage(
                                        EventId: _eventList[index].eventId),
                                    type: PageTransitionType.bottomToTop));
                          },
                          child:
                              EventWidget(index: index, eventList: _eventList));
                    }),
              ),
            ],
          ),
        ));
  }
}
