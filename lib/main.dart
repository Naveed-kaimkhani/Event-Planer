import 'package:eventplaner/rootwidget.dart';
import 'package:eventplaner/screens/UploadEvent.dart';
import 'package:eventplaner/screens/homePage.dart';
import 'package:eventplaner/screens/signInPage.dart';
import 'package:eventplaner/screens/signupPage.dart';
import 'package:eventplaner/services/Firestore_method.dart';
import 'package:eventplaner/services/authentication_methods.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/UserDetailsProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // print("in main");
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserDetailsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //      home: SignUpPage(),

        home: SignIn(),
        // home: SignUp(),
      ),
    );
  }
}
