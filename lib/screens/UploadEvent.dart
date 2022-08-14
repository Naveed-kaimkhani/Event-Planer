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
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(FirebaseAuth.instance.currentUser!.uid);
  }

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
            inputfields(
              hint_text: "Enter Title",
              controller: titleController,
              field_icon: Icons.title,
            ),
            k,
            inputfields(
              hint_text: "Enter Description",
              controller: descripontroller,
              field_icon: Icons.description_outlined,
            ),
            k,
            inputfields(
                hint_text: "Enter Charges",
                controller: chargesController,
                field_icon: Icons.price_check),
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
                UploadImage1(image1),

                UploadImage2(image2),
                UploadImage3(image3),
                UploadImage4(image4),
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
                  child: Center(
                      child: isLoading
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Please Wait..",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            )
                          : Text(
                              "Post Event",
                              style: TextStyle(color: Colors.white),
                            )),
                  onTap: () async {
                    //  print("in upload function");
                    // Future<String> url1 =
                    //     Firestore_method.uploadImageToDatabase(
                    //         image: image1, uid: Utils().getUid());

                    // Future<String> url2 =
                    //     Firestore_method.uploadImageToDatabase(
                    //         image: image2, uid: Utils().getUid());

                    // Future<String> url3 =
                    //     Firestore_method.uploadImageToDatabase(
                    //         image: image3, uid: Utils().getUid());

                    // Future<String> url4 =
                    //     Firestore_method.uploadImageToDatabase(
                    //         image: image4, uid: Utils().getUid());

                    // if (isLoading)return;
                    setState(() {
                      isLoading = true;
                    });
                    String output = await Firestore_method.uploadEventToDb(

                      image1: image1,
                      image2: image2,
                      image3: image3,
                      image4: image4,
                      title: titleController.text,
                      description: descripontroller.text,
                      charges: double.parse(chargesController.text),
                      Category: SelectedCateg,
                      SellerName: Provider.of<UserDetailsProvider>(context,
                                  listen: false)
                              .userDetails!
                              .firstName ??
                          "No name",
                      SellerUid: FirebaseAuth.instance.currentUser!.uid,
                    );
                    setState(() {
                      isLoading = false;
                    });
                    //     print("event uploaded");
                    if (output == "success") {
                      Fluttertoast.showToast(
                          timeInSecForIosWeb: 2,
                          msg: "Event Posted",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity
                              .BOTTOM, // also possible "TOP" and "CENTER"
                          backgroundColor: Colors.blueGrey[700],
                          textColor: Colors.white);
                      //print("Showing snackbar");
                    } else {
                      print(output);
                      Fluttertoast.showToast(
                          timeInSecForIosWeb: 2,
                          msg: output,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity
                              .BOTTOM, // also possible "TOP" and "CENTER"
                          backgroundColor: Colors.blueGrey[700],
                          textColor: Colors.white);

                      // Utils.showSnackBar(context: context, content: output);
                      print("Exception aai");
                    }
                  },
                )),
          ]),
        ),
      ),
    ));
  }

  Widget UploadImage1(Uint8List? image) {
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
  } // for 1st image

  //
  Widget UploadImage2(Uint8List? image) {
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
                          image2 = _image;
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
                image2!,
                height: MediaQuery.of(context).size.height / 15,
              ),
              IconButton(
                  onPressed: () async {
                    Uint8List? _image = await Utils().PickImage();
                    if (_image != null) {
                      setState(() {
                        image2 = _image;
                      });
                    }
                    print("Image not loaded");
                  },
                  icon: Icon(Icons.upload)),
            ],
          );
  } // for 2nd image

  Widget UploadImage3(Uint8List? image) {
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
                          image3 = _image;
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
                image3!,
                height: MediaQuery.of(context).size.height / 15,
              ),
              IconButton(
                  onPressed: () async {
                    Uint8List? _image = await Utils().PickImage();
                    if (_image != null) {
                      setState(() {
                        image3 = _image;
                      });
                    }
                    print("Image not loaded");
                  },
                  icon: Icon(Icons.upload)),
            ],
          );
  } // for 3rd image

  Widget UploadImage4(Uint8List? image) {
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
                          image4 = _image;
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
                image4!,
                height: MediaQuery.of(context).size.height / 15,
              ),
              IconButton(
                  onPressed: () async {
                    Uint8List? _image = await Utils().PickImage();
                    if (_image != null) {
                      setState(() {
                        image4 = _image;
                      });
                    }
                    print("Image not loaded");
                  },
                  icon: Icon(Icons.upload)),
            ],
          );
  } // for 4th image

}

////////
///
///
