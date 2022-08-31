import 'dart:async';

import 'package:eventplaner/constant/constants.dart';
import 'package:eventplaner/screens/welcomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 10),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => WelcomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
          child: Text("Bliss",
              style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 50,
                  letterSpacing: 2.05,
                  color: Constants.primaryColor,
                ),
              )),
        ));
  }
}
