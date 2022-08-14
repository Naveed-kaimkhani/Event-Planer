import 'package:eventplaner/screens/indoorscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';

class EventType extends StatefulWidget {
  const EventType({Key? key}) : super(key: key);

  @override
  State<EventType> createState() => _EventTypeState();
}

class _EventTypeState extends State<EventType> {
  List<String> categories = [
    'Birthdays',
    'Weddings',
    'Corporate Events',
    "Evening Parties",
    'Customize'
  ];

  final Map itemFunc = {
    'Birthdays': () => print("1"),
    'Weddings': () => print("2"),
    'Corporate Events': () => print("3"),
    'Customize': () => print("4")
  };

  // final List<Map> myProducts =
  //     List.generate(6, (index) => {"id": index, "name": "$index"}).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // implement GridView.builder
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  if (index == 1) {
                    print("0");
                  } else if (index == 2) {
                    print("1");
                  } else if (index == 3) {
                    print("3");
                  } else if (index == 4) {
                    print("4");
                  } else if (index == 5) {
                    print("5");
                  }
                },
                child: Card(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      categories[index],
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
