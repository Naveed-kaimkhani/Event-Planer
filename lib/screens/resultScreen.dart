import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventplaner/Model/eventModel.dart';
import 'package:eventplaner/constant/constants.dart';
import "package:flutter/material.dart";

import '../widgets/searchbar.dart';

class ResultScreen extends StatelessWidget {
  final String query;
  const ResultScreen({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            SearchBarWidget(
              isReadOnly: false,
              hasBackButton: false,
            ),
          ],
          backgroundColor: Constants.primaryColor,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                  text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Showing results for ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: query,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
            ),
            // SizedBox(
            //   height: 5.h,
            // ),
            Expanded(
                child: FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection("events")
                        .where("Category", isEqualTo: query)
                        .get(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting)
                        return Center(
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage(
                                    "assets/undraw_Not_found_re_44w9.png"),
                              ),
                              Text("Nothing to show"),
                            ],
                          ),
                        );
                      else {
                        return GridView.builder(
                          itemCount: snapshot.data!.docs.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 2 / 3.3,
                          ),
                          itemBuilder: (context, index) {
                            eventModel event = eventModel
                                .fromJson(snapshot.data!.docs[index].data());
                            return ResultsWidget(
                              event: event,
                            );
                          },
                        );
                      }
                    }))
          ],
        ),
      ),
    );
  }
}

class ResultsWidget extends StatelessWidget {
  final eventModel event;
  const ResultsWidget({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
        // onTap: () {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => ProductScreen(product: product),
        //     ));
        // },
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                width: screenSize.width / 3,
                child: Image.network(
                  event.url1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  event.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.only(bottom:5),
              //   child: SizedBox(
              //     width: screenSize.width/5,
              //     child: FittedBox(
              //       child:RatingStatWidget(rating: product.rating)),
              //   ),
              // ),
              SizedBox(
                  height: 20,
                  child: FittedBox(
                    child: Text(event.charges.toString()),
                  )),
            ])));
  }
}
