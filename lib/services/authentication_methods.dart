import 'package:eventplaner/screens/homePage.dart';
import 'package:eventplaner/screens/signInPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Firestore_method.dart';

class authentication_methods {

  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return SignIn();
          }
        });
  }
  static signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  static Future<String> SignupUsers(
      {required String firstname,
      required String lastname,
      required String email,
      required String password,
      required String phone,
     // required String address,
      
      }) async {
    firstname.trim();
    lastname.trim();
    email.trim();
    phone.trim();
    password.trim();
    String output;
    if (firstname != "" && lastname != "" && email != "" && phone != "" && password != "") {
      try {
        final authResult =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        output = "SignUp Successfully";
        await Firestore_method.uploadDataToFirestore(
            firstname: firstname,lastname: lastname, phone: phone, address: "");
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Please fill all the fields";
      //return output;
    }
   
    // return output as Future<String>;
    return output;
  }

  //SignIn method
  static Future<String> SignInUsers(
      {required String email, required String password}) async {
    email.trim();
    password.trim();
    String output;
    if (email != "" && password != "") {
      try {
        final authResult =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        output = "SignIn Successfully";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Please fill all the fields";
      // return output;
    }
    //print("output is $output");
    // return output as Future<String>;
    return output;
  }
}
