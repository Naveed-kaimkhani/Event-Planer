import 'package:flutter/material.dart';


import '../widgets/searchbar.dart';

class Search_Screen extends StatelessWidget {
  const Search_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: SearchBarWidget(isReadOnly: false, hasBackButton:true),
      ),
    );
  }
}