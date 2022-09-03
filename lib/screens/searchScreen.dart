import 'package:eventplaner/constant/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/searchbar.dart';

class Search_Screen extends StatelessWidget {
  const Search_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        actions: [
          Center(
              child: SearchBarWidget(isReadOnly: false, hasBackButton: false)),
        ],
      )),
    );
  }
}
