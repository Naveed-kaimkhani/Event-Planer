
import 'package:flutter/material.dart';

import '../Model/User_Details.dart';
import '../services/Firestore_method.dart';

class UserDetailsProvider with ChangeNotifier{
  User_Details? userDetails;
  UserDetailsProvider():userDetails=User_Details(firstName: "Loading",lastName: "Loading", phone: "Loading");

  Future getData() async {
    userDetails = await Firestore_method().getUserDetails();
    notifyListeners();
  }
  
}