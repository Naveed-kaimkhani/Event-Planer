import 'package:eventplaner/constant/constants.dart';
import 'package:eventplaner/widgets/customizedappBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:page_transition/page_transition.dart';

import '../Model/eventModelV2.dart';
import '../screens/detailsPageV2.dart';

Widget Imagecontainer(
  BuildContext context,
  Image image,
  String name,
  String title,
) {
  var rating = 3.0;
  return Container(
    child: Column(
      children: [
        Container(
          child: Text(name,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  style: BorderStyle.none,
                  width: 0.2,
                  color: Constants.primaryColor)),
          height: 250,
          child: InkWell(
            child: Card(
              margin: EdgeInsets.all(10),
              child: InkWell(
                  onTap: () => _showPreview(context, title, image),
                  child: image),
              elevation: 70,
              //  shadowColor: Color(0x26741b47).withOpacity(0.9),
            ),
          ),
          //color: Colors.pink,
        ),
        Container(
          child: Text(title,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
        ),
        ratingbR(),
      ],
    ),
  );
}

Widget ProfileContainer() {
  return Container(
    margin: EdgeInsets.all(10),
    height: 30,
    width: 30,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        image: DecorationImage(image: AssetImage('assets/account.png'))),
  );
}

Widget allImagesContainer(
    BuildContext context, Image image, String title, String subtitle) {
  return Container(
    child: Column(
      children: [
        Card(
          elevation: 10,
          child: Container(
            width: 350,
            height: 250,
            child: InkWell(
                onTap: () => _showPreview(context, title, image), child: image),
          ),
        ),
        Container(
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text(subtitle),
          ),
        )
      ],
    ),
  );
}

class ratingbR extends StatefulWidget {
  const ratingbR({Key? key}) : super(key: key);

  @override
  State<ratingbR> createState() => _ratingbRState();
}

class _ratingbRState extends State<ratingbR> {
  Color _myColorOne = Color(0xff741b47);
  Color _myColorTwo = Color(0xff741b47);
  Color _myColorThree = Color(0xff741b47);
  Color _myColorFour = Color(0xff741b47);
  Color _myColorFive = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.0,
      width: 400.0,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.star),
            onPressed: () => setState(() {
              _myColorOne = Color(0xff741b47);
            }),
            color: _myColorOne,
          ),
          new IconButton(
            icon: new Icon(Icons.star),
            onPressed: () => setState(() {
              _myColorOne = Color(0xff741b47);
              _myColorTwo = Color(0xff741b47);
              _myColorThree = Colors.grey;
              _myColorFour = Colors.grey;
              _myColorFive = Colors.grey;
            }),
            color: _myColorTwo,
          ),
          new IconButton(
            icon: new Icon(Icons.star),
            onPressed: () => setState(() {
              _myColorOne = Color(0xff741b47);
              _myColorTwo = Color(0xff741b47);
              _myColorThree = Color(0xff741b47);
              _myColorFour = Colors.grey;
              _myColorFive = Colors.grey;
            }),
            color: _myColorThree,
          ),
          new IconButton(
            icon: new Icon(Icons.star),
            onPressed: () => setState(() {
              _myColorOne = Color(0xff741b47);
              _myColorTwo = Color(0xff741b47);
              _myColorThree = Color(0xff741b47);
              _myColorFour = Color(0xff741b47);
              _myColorFive = Colors.grey;
            }),
            color: _myColorFour,
          ),
          new IconButton(
            icon: new Icon(Icons.star),
            onPressed: () => setState(() {
              _myColorOne = Color(0xff741b47);
              _myColorTwo = Color(0xff741b47);
              _myColorThree = Color(0xff741b47);
              _myColorFour = Color(0xff741b47);
              _myColorFive = Color(0xff741b47);
            }),
            color: _myColorFive,
          ),
        ],
      ),
    );
  }
}

_showPreview(BuildContext context, String title, Image image) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
        ),
        content: Container(
          height: double.infinity,
          width: double.infinity,
          child: image,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Close",
            ),
          ),
        ],
      );
    },
  );
}