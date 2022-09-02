import 'package:flutter/material.dart';

import '../screens/resultScreen.dart';
import '../screens/searchScreen.dart';

class SearchBarWidget extends StatelessWidget with PreferredSizeWidget {
  final bool isReadOnly;
  final bool hasBackButton;
  SearchBarWidget({
    Key? key,
    required this.isReadOnly,
    required this.hasBackButton,
  })  : preferredSize = const Size.fromHeight(80),
        super(key: key);

  @override
  final Size preferredSize;

  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(
      color: Colors.grey,
      width: 1,
    ),
  );

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          hasBackButton
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back))
              : Container(),
          SizedBox(
            //hasBackButton ? screenSize.width * 0.8 : screenSize.width * 0.5,

            width: screenSize.width * 0.6,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      spreadRadius: 1,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: TextField(
                  onSubmitted: (String query) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreen(query: query)));
                  },
                  readOnly: isReadOnly,
                  onTap: () {
                    if (isReadOnly) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Search_Screen()));
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Search Events",
                    fillColor: Colors.white,
                    filled: true,
                    border: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.mic_none_outlined,
              size: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
