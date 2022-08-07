import 'package:firebase_auth/firebase_auth.dart';

import 'Firestore_method.dart';

class authentication_methods {
  static Future<String> SignupUsers(
      {required String firstname,
      required String lastname,
      required String email,
      required String password,
      required String phone,
      required String address,
      
      }) async {
    firstname.trim();
    lastname.trim();
    email.trim();
    phone.trim();
    password.trim();
    String output;
    if (firstname != "" && lastname != "" && email != "" && phone != "" && password != ""&& address != "") {
      try {
        final authResult =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        output = "SignUp Successfully";
        await Firestore_method.uploadDataToFirestore(
            firstname: firstname,lastname: lastname, phone: phone,address: address);
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Please fill all the fields";
      //return output;
    }
    print("output is $output");
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
