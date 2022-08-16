import 'dart:typed_data';

import 'package:eventplaner/constant/inputfields.dart';
import 'package:eventplaner/screens/signInPage.dart';
import 'package:eventplaner/services/Firestore_method.dart';
import 'package:eventplaner/services/authentication_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';
import '../constant/TextField.dart';
import '../constant/Utils.dart';
import '../constant/constants.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController eController = TextEditingController();

  TextEditingController LastController = TextEditingController();

  TextEditingController FirstController = TextEditingController();

  TextEditingController PassController = TextEditingController();

  TextEditingController PhoneController = TextEditingController();

  Uint8List? image;
  final GoogleSignIn _googleSignIn=GoogleSignIn(
    scopes: ['email']
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SizedBox k = SizedBox(
      height: 20,
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image.asset('assets/undraw_Mobile_login_re_9ntv.png'),
              Center(
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Color(0xffBEB6F5),
                    fontSize: 35.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //  Align(alignment: Alignment.center, child: UploadImage1(image)),
              image == null
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Stack(
                          children: [
                            Image.network(
                              "https://cdn-icons-png.flaticon.com/512/8207/8207765.png",
                              height: 50,
                            ),
                            IconButton(
                                onPressed: () async {
                                  Uint8List? _image = await Utils().PickImage();
                                  if (_image != null) {
                                    setState(() {
                                      image = _image;
                                    });
                                  } else {
                                    print("Image not loaded");
                                  }
                                },
                                icon: Icon(Icons.upload)),
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: Stack(
                        children: [
                          Image.memory(
                            image!,
                            height: MediaQuery.of(context).size.height / 8,
                          ),
                          IconButton(
                              onPressed: () async {
                                Uint8List? _image = await Utils().PickImage();
                                if (_image != null) {
                                  setState(() {
                                    image = _image;
                                  });
                                }
                                print("Image not loaded");
                              },
                              icon: Icon(
                                Icons.upload,
                                size: 30,
                              )),
                        ],
                      ),
                    ),

              k,
              inputfields(
                hint_text: "Enter FirstName",
                controller: FirstController,
                field_icon: Icons.abc,
              ),
              k,
              inputfields(
                hint_text: "Enter LastName",
                controller: LastController,
                field_icon: Icons.abc,
              ),
              k,
              inputfields(
                hint_text: "Enter Email",
                controller: eController,
                field_icon: Icons.mail_outline,
              ),
              //  inputfields(
              //     hint_text: "Enter Phone", controller: PhoneController),
              // inputfields(hint_text: "Enter Phone", controller:PhoneController,field_icon: Icons.phone,),

              k,
              inputfields(
                  hint_text: "Enter Phone",
                  controller: PhoneController,
                  field_icon: Icons.password),
              k,
              inputfields(
                  hint_text: "Enter Password",
                  controller: PassController,
                  field_icon: Icons.password),
              k,
              GestureDetector(
                onTap: () async {
                  

                  String output = await authentication_methods.SignupUsers(
                    firstname: FirstController.text,
                    lastname: LastController.text,
                    email: eController.text,
                    phone: PhoneController.text,
                    password: PassController.text,
                  );
                  if (output == "SignUp Successfully") {
                    Fluttertoast.showToast(msg: "SignUp Succesfully");
                  //  print("user created");
                    print(FirebaseAuth.instance.currentUser!.uid);
                   await Firestore_method.uploadProfilePicToDatabase(
                        image: image,
                        uid: FirebaseAuth.instance.currentUser!.uid);
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => SignIn()));
                  } else {
                    Fluttertoast.showToast(msg: output.toString());
                  }
                },
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: Constants.primaryColor),
                    borderRadius: BorderRadius.circular(10)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 30,
                      child: Image.asset('assets/google.png'),
                    ),
                    GestureDetector(
                      onTap: ()=>authentication_methods.signInWithGoogle(),
                      child: Text(
                        'Sign Up with Google',
                        style: TextStyle(
                          color: Constants.blackColor,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: SignIn(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'Have an Account? ',
                        style: TextStyle(
                          color: Constants.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Constants.primaryColor,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget UploadImage1(Uint8List? image) {
  //   return image == null
  //       ? Padding(
  //           padding: const EdgeInsets.only(top: 18.0),
  //           child: Stack(
  //             children: [
  //               // Icon(
  //               //   Icons.image,
  //               //   size: 40,
  //               // ),
  //               Image.network(
  //                 "https://cdn-icons-png.flaticon.com/512/8207/8207765.png",
  //                 height: 80,
  //               ),
  //               IconButton(
  //                 onPressed: () async {
  //                   Uint8List? _image = await Utils().PickImage();
  //                   if (_image != null) {
  //                     setState(() {
  //                       image = _image;
  //                     });
  //                   } else {
  //                     print("Image not loaded");
  //                   }
  //                 },
  //                 icon: Icon(Icons.upload, color: Colors.black),
  //                 iconSize: 30,
  //               ),
  //             ],
  //           ),
  //         )
  //       : Stack(
  //           children: [
  //             Image.memory(
  //               image,
  //               height: MediaQuery.of(context).size.height / 15,
  //             ),
  //             IconButton(
  //                 onPressed: () async {
  //                   Uint8List? _image = await Utils().PickImage();
  //                   if (_image != null) {
  //                     setState(() {
  //                       image = _image;
  //                     });
  //                   }
  //                   print("Image not loaded");
  //                 },
  //                 icon: Icon(Icons.upload)),
  //           ],
  //         );
  // }
}
