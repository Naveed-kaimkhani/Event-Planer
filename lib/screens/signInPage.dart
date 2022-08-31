import 'package:eventplaner/constant/inputfields.dart';
import 'package:eventplaner/screens/EventTypes/weddings.dart';

import 'package:eventplaner/screens/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../Provider/UserDetailsProvider.dart';
import '../constant/TextField.dart';
import '../constant/Utils.dart';
import '../constant/constants.dart';

import '../rootwidget.dart';
import '../services/authentication_methods.dart';
import 'forgotpassPage.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController eController = TextEditingController();
  String sPassword = "";
  String sEmail = "";
  bool showPassword = false;
  bool showConfirmPassword = false;
  void togglePasswordVisibility() {
    setState(() => showPassword = !showPassword);
  }

  TextEditingController pController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/undraw_Login_re_4vu2.png'),
              Center(
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0x26741b47),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Email address",
                    prefixIcon: Icon(
                      Icons.email_rounded,
                      color: Color(0xff741b47),
                    ),
                  ),
                  // validator: (val) {
                  //   return validateEmail(val!.trim());
                  // },
                  onChanged: (val) {
                    setState(() {
                      sEmail = val.trim();
                    });
                  },
                ),
              ),
              // Center(
              //   child: inputfields(
              //     hint_text: "Enter Email",
              //     controller: eController,
              //     field_icon: Icons.email_outlined,
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0x26741b47),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(
                      Icons.password_rounded,
                      color: Color(0xff741b47),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        togglePasswordVisibility();
                      },
                      tooltip: "Add password",
                      color: const Color.fromARGB(255, 168, 62, 13),
                      icon: (showPassword
                          ? Icon(Icons.visibility_rounded)
                          : Icon(
                              Icons.visibility_off_rounded,
                            )),
                    ),
                  ),
                  obscureText: !showPassword,
                  // validator: (val) {
                  //   return validateField(val!);
                  // },
                  onChanged: (val) {
                    setState(() {
                      sPassword = val;
                    });
                  },
                ),
              ),
              // Center(
              //   child: inputfields(
              //     hint_text: "Enter Password",
              //     controller: pController,
              //     field_icon: Icons.password_outlined,
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const rootPage(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Center(
                      child: GestureDetector(
                    onTap: () async {
                      //  authentication_methods
                      // Future<String> output="something";
                      setState(() {
                        isLoading = true;
                      });
                      String output = await authentication_methods.SignInUsers(
                        email: eController.text,
                        password: pController.text,
                      );

                      // //    if (output=="SignIn Successfully") {
                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (_) => HomePage()));
                      // } else {
                      //   Utils.showSnackBar(context: context, content: output.toString());
                      // }

                      if (output == "SignIn Successfully") {
                        await Provider.of<UserDetailsProvider>(context,
                                listen: false)
                            .getData();
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => rootPage()));
                      } else {
                        // Utils.showSnackBar(
                        //     context: context, content: output.toString());
                        Fluttertoast.showToast(msg: output.toString());
                      }

                      // print(output);
                      //  Utils.showSnackBar(context: context, content: output.toString());
                    },
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
                                "SignIn",
                                style: TextStyle(color: Colors.white),
                              )),
                  )),

                  //   child: Center(
                  //     child: Container(
                  //       width: 250,
                  //       decoration: BoxDecoration(
                  //         color: Constants.primaryColor,
                  //         borderRadius: BorderRadius.circular(20),
                  //       ),
                  //       padding: const EdgeInsets.symmetric(
                  //           horizontal: 10, vertical: 15),
                  //       child: Center(
                  //           child: GestureDetector(
                  //         onTap: () async {
                  //           //  authentication_methods
                  //           // Future<String> output="something";
                  //           String output =
                  //               await authentication_methods.SignInUsers(
                  //             email: eController.text,
                  //             password: pController.text,
                  //           );

                  //           //    if (output=="SignIn Successfully") {
                  //           Navigator.pushReplacement(context,
                  //               MaterialPageRoute(builder: (_) => rootPage()));
                  //           // } else {
                  //           //   Utils.showSnackBar(context: context, content: output.toString());
                  //           // }

                  //           if (output == "SignIn Successfully") {
                  //             Navigator.pushReplacement(context,
                  //                 MaterialPageRoute(builder: (_) => rootPage()));
                  //           } else {
                  //             Utils.showSnackBar(
                  //                 context: context, content: output.toString());
                  //           }

                  //           // print(output);
                  //           //  Utils.showSnackBar(context: context, content: output.toString());
                  //         },
                  //         child: Text(
                  //           "Sign In",
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //           ),
                  //         ),
                  //       )),
                  //   // child: Center(
                  //   //   child: Container(
                  //   //     width: 250,
                  //   //     decoration: BoxDecoration(
                  //   //       color: Constants.primaryColor,
                  //   //       borderRadius: BorderRadius.circular(20),
                  //   //     ),
                  //   //     padding: const EdgeInsets.symmetric(
                  //   //         horizontal: 10, vertical: 15),
                  //   //     child: Center(
                  //   //         child: GestureDetector(
                  //   //       onTap: () async {
                  //   //         //  authentication_methods
                  //   //         // Future<String> output="something";
                  //   //         String output =
                  //   //             await authentication_methods.SignInUsers(
                  //   //           email: eController.text,
                  //   //           password: pController.text,
                  //   //         );

                  //   //         //    if (output=="SignIn Successfully") {
                  //   //         Navigator.pushReplacement(context,
                  //   //             MaterialPageRoute(builder: (_) => rootPage()));
                  //   //         // } else {
                  //   //         //   Utils.showSnackBar(context: context, content: output.toString());
                  //   //         // }

                  //   //         if (output == "SignIn Successfully") {
                  //   //           Navigator.pushReplacement(context,
                  //   //               MaterialPageRoute(builder: (_) => rootPage()));
                  //   //         } else {
                  //   //           Utils.showSnackBar(
                  //   //               context: context, content: output.toString());
                  //   //         }

                  //   //         // print(output);
                  //   //         //  Utils.showSnackBar(context: context, content: output.toString());
                  //   //       },
                  //   //       child: Text(
                  //   //         "Sign In",
                  //   //         style: TextStyle(
                  //   //           color: Colors.white,
                  //   //         ),
                  //   //       ),
                  //   //     )),
                  //   //   ),
                  //   // ),
                  // ),
                  //     ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const ForgotPassword(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'Forgot Password? ',
                        style: TextStyle(
                          color: Constants.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Reset Here',
                        style: TextStyle(
                          color: Constants.primaryColor,
                        ),
                      ),
                    ]),
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
                    InkWell(
                      onTap: () => authentication_methods.signInWithGoogle(),
                      child: Text(
                        'Sign In with Google',
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
                          child: SignUp(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'New Here ',
                        style: TextStyle(
                          color: Constants.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Register',
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
}
