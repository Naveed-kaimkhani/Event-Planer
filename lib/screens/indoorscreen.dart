import 'package:eventplaner/widgets/custom_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class IndoorEvents extends StatefulWidget {
  const IndoorEvents({Key? key}) : super(key: key);

  @override
  State<IndoorEvents> createState() => _IndoorEventsState();
}

class _IndoorEventsState extends State<IndoorEvents> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        CustomImages(
          image: 'assets/th.jpeg',
        ),
        CustomImages(
          image: 'assets.th1.jpeg',
        ),
      ]),
    );
  }
}
