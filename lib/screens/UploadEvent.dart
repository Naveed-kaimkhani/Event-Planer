import 'dart:typed_data';

import 'package:eventplaner/constant/inputfields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../Provider/UserDetailsProvider.dart';
import '../constant/Utils.dart';
import '../services/Firestore_method.dart';

class UploadEvent extends StatefulWidget {
  UploadEvent({Key? key}) : super(key: key);

  @override
  State<UploadEvent> createState() => _UploadEventState();
}

class _UploadEventState extends State<UploadEvent> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descripontroller = TextEditingController();

  TextEditingController chargesController = TextEditingController();

  TextEditingController categController = TextEditingController();

//  TextEditingController titleController=TextEditingController();
  final categ = [
    'Wedding Event',
    'Birthday Event',
    'Farewell Party',
    'Festivals',
    //'Electronics',
    //'Sports'
  ];
  String SelectedCateg = 'Wedding Event';
  Uint8List? image1;
  Uint8List? image2;
  Uint8List? image3;
  Uint8List? image4;

  @override
  Widget build(BuildContext context) {
    SizedBox k = SizedBox(
      height: 30,
    );

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Let People Know ",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
            Text("With your Services ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            k,
            inputfields(hint_text: "Enter Title", controller: titleController),
            k,
            inputfields(
                hint_text: "Enter Description", controller: descripontroller),
            k,
            inputfields(
                hint_text: "Enter Charges", controller: chargesController),
            k,
            Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.purple.withAlpha(60),
                ),

                // ignore: prefer_const_constructors
                child: SizedBox(
                  //width: 80,
                  child: DropdownButton<String>(
                    elevation: 0,
                    icon: Icon(Icons.keyboard_arrow_down),
                    value: SelectedCateg,
                    items: categ
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            ))
                        .toList(),
                    onChanged: (item) => setState(() {
                      SelectedCateg = item!;
                    }),
                  ),
                )),
            k,
            Text("Upload atleast four pictures"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                UploadImage(image1),

                UploadImage(image2),
                UploadImage(image3),
                UploadImage(image3),
                // image1 == null
                //     ? Padding(
                //         padding: const EdgeInsets.only(top: 18.0),
                //         child: Stack(
                //           children: [
                //             Image.network(
                //               "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
                //               height: 60,
                //             ),
                //             IconButton(
                //                 onPressed: () async {
                //                   Uint8List? _image = await Utils().PickImage();
                //                   if (_image != null) {
                //                     setState(() {
                //                       image1 = _image;
                //                     });
                //                   } else {
                //                     print("Image not loaded");
                //                   }
                //                 },
                //                 icon: Icon(Icons.upload)),
                //           ],
                //         ),
                //       )
                //     : Stack(
                //         children: [
                //           Image.memory(
                //             image1!,
                //             height: MediaQuery.of(context).size.height / 15,
                //           ),
                //           IconButton(
                //               onPressed: () async {
                //                 Uint8List? _image = await Utils().PickImage();
                //                 if (_image != null) {
                //                   setState(() {
                //                     image1 = _image;
                //                   });
                //                 }
                //                 print("Image not loaded");
                //               },
                //               icon: Icon(Icons.upload)),
                //         ],
                //       )
              ],
            ),
            k,
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.purple,
                ),
                child: GestureDetector(
                  child: const Center(
                      child: Text(
                    "Post Event",
                    style: TextStyle(color: Colors.white),
                  )),
                  onTap: () async {
                    print("in upload function");
                    Future<String> url1 =
                        Firestore_method.uploadImageToDatabase(
                            image: image1, uid: Utils().getUid());

                    Future<String> url2 =
                        Firestore_method.uploadImageToDatabase(
                            image: image2, uid: Utils().getUid());

                    Future<String> url3 =
                        Firestore_method.uploadImageToDatabase(
                            image: image3, uid: Utils().getUid());

                    Future<String> url4 =
                        Firestore_method.uploadImageToDatabase(
                            image: image4, uid: Utils().getUid());
                    String output = await Firestore_method.uploadEventToDb(
                      image1: image1,
                      image2: image2,
                      image3: image3,
                      image4: image4,
                      title: titleController.text,
                      description: descripontroller.text,
                      charges: double.parse(chargesController.text),
                      Category: categController.text,
                      SellerName:  Provider.of<UserDetailsProvider>(
                                                    context,
                                                    listen: false)
                                                .userDetails!.firstName??
                                            "No name",
                      SellerUid: FirebaseAuth.instance.currentUser!.uid,
                    );

                    print("prodcut uploaded");
                    if (output == "success") {
                   Fluttertoast.showToast(
        msg: "Event Posted",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM ,// also possible "TOP" and "CENTER"
        backgroundColor: Colors.grey,
        textColor: Colors.white
);
                      print("Showing snackbar");
                    } else {
                      Utils.showSnackBar(context: context, content: output);
                      print("Exception aai");
                    }
                  },
                )),
          ]),
        ),
      ),
    ));
  }

  Widget UploadImage(Uint8List? image) {
    return image == null
        ? Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Stack(
              children: [
                Image.network(
                  "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
                  height: 60,
                ),
                IconButton(
                    onPressed: () async {
                      Uint8List? _image = await Utils().PickImage();
                      if (_image != null) {
                        setState(() {
                          image1 = _image;
                        });
                      } else {
                        print("Image not loaded");
                      }
                    },
                    icon: Icon(Icons.upload)),
              ],
            ),
          )
        : Stack(
            children: [
              Image.memory(
                image1!,
                height: MediaQuery.of(context).size.height / 15,
              ),
              IconButton(
                  onPressed: () async {
                    Uint8List? _image = await Utils().PickImage();
                    if (_image != null) {
                      setState(() {
                        image1 = _image;
                      });
                    }
                    print("Image not loaded");
                  },
                  icon: Icon(Icons.upload)),
            ],
          );
  }
}
